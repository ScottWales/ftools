#!/usr/bin/env python
"""
Copyright 2015 Scott Wales

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

import os

from ftools.parser import parse
from antlr4.FileStream import FileStream
from antlr4.error.ErrorStrategy import BailErrorStrategy

base = 'test/example_project'

def parse_testcase(filename):
    out = parse(FileStream(filename))
    out._errHandler = BailErrorStrategy()
    out.program()

def test_example():
    parse_directory(base)

def test_bar():
    parse_testcase(os.path.join(base,'bar_mod.f90'))

def parse_directory(base):
    for (path, dirs, files) in os.walk(base):
        for d in dirs:
            parse_directory(d)
        for f in files:
            if f.lower().endswith('.f90'):
                parse_testcase(os.path.join(path, f))
