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
        self.use_count = 0
    def enterUseStmt(self, ctx):
        self.use_count += 1

class Dependencies(object):
    def __init__(self):
        self.uses = ['bar']

def dependencies(stream):
    tree = parser.parse(stream).program()
    listener = DependencyListener() 
    ParseTreeWalker().walk(listener, tree)

    return listener
