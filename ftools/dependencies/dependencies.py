#!/usr/bin/env python
"""
Copyright 2015 ARC Centre of Excellence for Climate Systems Science

author: Scott Wales <scott.wales@unimelb.edu.au>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

import os.path

from ftools import parser

from antlr4 import ParseTreeWalker
from antlr4.InputStream import InputStream
from antlr4.FileStream import FileStream
from ftools.parser.Fortran03Listener import Fortran03Listener

class DependencyListener(Fortran03Listener):
    def __init__(self, filename):
        self.uses = set()
        self.modules = set()
        self.filename = filename

    def exitUseStmt(self, ctx):
        name = ctx.moduleName().getText().lower()
        self.uses.add(name)

    def exitModuleStmt(self, ctx):
        name = ctx.moduleName().getText().lower()
        self.modules.add(name)

    def products(self):
        "Get a set of files compiling this file will produce"
        prods = module_filenames(self.modules)
        return prods

    def requires(self):
        "Gets a set of files required to compile this file"
        external_uses  = self.uses.difference(self.modules)
        deps  = module_filenames(external_uses)
        return deps

    def out(self):
        "Gets the object this file will create"
        return os.path.splitext(self.filename)[0] + '.o'


    def rule(self):
        "Gets the Make rule for this file"
        return ' '.join([self.out()] + self.products() + 
                [':',self.filename] + self.requires())

def directory_dependencies(path):
    "Find all dependencies under a path"
    pass

def file_dependencies(filename):
    "Helper function to parse a file"
    stream = FileStream(filename)
    return walk_dependencies(stream, filename)

def string_dependencies(string, filename):
    "Helper functon to parse a string"
    stream = InputStream(string)
    return walk_dependencies(stream, filename)

def walk_dependencies(stream, filename):
    "Given an input stream gather dependencies by walking the parse tree"
    tree = parser.parse(stream).program()
    listener = DependencyListener(filename) 
    ParseTreeWalker().walk(listener, tree)
    return listener

def module_filenames(mods):
    return [mod + '.mod' for mod in mods]
