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

from ftools.writer.Writer import Writer

from ftools.parser import Fortran03Lexer
from ftools.parser import Fortran03Parser

from antlr4 import ParseTreeWalker
from antlr4.InputStream import InputStream
from antlr4.BufferedTokenStream import BufferedTokenStream

from StringIO import StringIO

def run_testcase(data):
    stream = InputStream(data)
    lexer = Fortran03Lexer(stream)
    tokens = BufferedTokenStream(lexer)
    parser = Fortran03Parser(tokens)
    tree = parser.program()

    out  = StringIO()
    listener = Writer(tokens,out)
    ParseTreeWalker().walk(listener, tree)
    assert out.getvalue() == data

def test_empty():
    data = ""
    run_testcase(data)

def test_program():
    data = "program"
    run_testcase(data)

def test_named_program():
    data = "program foo"
    run_testcase(data)

def test_multiline():
    data = """\
    program foo
    end program
    """.strip()
    run_testcase(data)

