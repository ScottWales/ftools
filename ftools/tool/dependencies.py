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

from ftools import parser

from antlr4 import ParseTreeWalker
from ftools.parser.Fortran03Listener import Fortran03Listener

class DependencyListener(Fortran03Listener):
    def __init__(self):
        self.uses = []

    def enterUseStmt(self, ctx):
        self.inside_use = True

    def exitUseStmt(self, ctx):
        self.inside_use = False

    def enterModuleName(self, ctx):
        if self.inside_use:
            self.uses.append(ctx.getText())

def dependencies_string(string):
    "Helper function to parse an input string"
    stream = InputStream(string)
    return dependencies(stream)

def dependencies_file(filename):
    "Helper function to parse a file"
    stream = FileStream(filename)
    return dependencies(stream)

def dependencies(stream):
    "Given an input stream gather dependencies by walking the parse tree"
    tree = parser.parse(stream).program()
    listener = DependencyListener() 
    ParseTreeWalker().walk(listener, tree)

    return listener
