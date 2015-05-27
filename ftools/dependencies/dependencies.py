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

from DependencyListener import DependencyListener


class ProjectDependencies(object):
    def __init__(self, path):
        # Dicts map output objects to their module dependencies
        self.obj_deps = {}
        self.mod_deps = {} 

        # Maps modules to object files
        self.mod_object = {}

        # Maps programs to object files
        self.prog_object = {} 

        # List of rules from each fortran file
        self.file_rules = []

        self.scan_directory(path)

    def scan_directory(self,path):
        """
        Scan files in path for dependency information
        """
        for (p, dirs, files) in os.walk(path):
            for d in dirs:
                self.scan_directory(d)
            for f in files:
                if f.lower().endswith('.f90'):
                    self.scan_file(os.path.join(p,f))

    def scan_file(self,filename):
        """
        Parse the file to get its dependency information, then add that to the
        global state
        """
        deps = file_dependencies(filename)
        for p in deps.programs:
            self.prog_object[p] = deps.compiled()
        for m in deps.module_files():
            self.mod_deps[m] = deps.requires()
            self.mod_object[m] = deps.compiled()

        self.obj_deps[deps.compiled()] = deps.requires()
        self.file_rules.append(deps.rule())

    def resolve_object_links(self, obj):
        """
        Given an object name get the objects that need to be linked to satisfy
        module dependencies
        """
        out = [obj]
        for d in self.obj_deps[obj]:
            out.extend(self.resolve_module_objects(d))
        return out

    def resolve_module_objects(self, mod):
        """
        Given a module name get the objects that need to be linked to satisfy
        module dependencies
        """
        objs = [] 
        # Get the objects needed for all dependencies
        for d in self.mod_deps[mod]:
            objs.extend(self.resolve_module_objects(d))
        objs.append(self.mod_object[mod])
        return objs

    def rules(self):
        """
        Print all rules for the project in Make format
        """
        make = '\n'.join(sorted(self.file_rules))
        for program, obj in sorted(self.prog_object.iteritems()):
            make += '\n' + program + ' : ' + ' '.join(sorted(self.resolve_object_links(obj)))
        return make

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

