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

from DependencyListener import *

class ProjectDependencies(object):
    def __init__(self, path):
        self.products = {} # file: [outputs]
        self.requires = {} # file: [dependency]
        self.rule     = {} # file: "rule"

        self.scan_directory(path)

    def scan_directory(self,path):
        """
        Scan files in path for dependency information
        """
        for (p, dirs, files) in os.walk(path):
            for d in dirs:
                self.scan_directory(d)
            for f in files:
                ext = os.path.splitext(f)[1]
                if ext.lower() == 'f90':
                    pass
                self.scan_file(os.path.join(p,f))

    def scan_file(self,filename):
        """
        Add a file to the dependency information
        """
        deps = file_dependencies(filename)
        self.products[filename] = deps.products()
        self.requires[filename] = deps.requires()
        self.rule[filename] = deps.rule()

    def rules(self):
        """
        Print all rules for the project in Make format
        """
        return '\n'.join(self.rule.values())

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

