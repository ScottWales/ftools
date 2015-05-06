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

from Fortran03Lexer import Fortran03Lexer
from Fortran03Parser import Fortran03Parser
from antlr4 import CommonTokenStream

def parse(stream):
    """
    Parse a stream using antlr

    Inputs:
     - stream: an antlr4.FileStream (to parse a file) or antlr4.InputStream (to parse a
       string)

    Outputs:
     - An Antlr parser object. Extract parse trees using functions with the
       names of grammar products, e.g.
    
           parse(InputStream('function foo(bar)')).functionStmt()
    """
    lex  = Fortran03Lexer(stream)
    toks = CommonTokenStream(lex)
    par  = Fortran03Parser(toks)
    return par
