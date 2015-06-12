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

from Fortran03Lexer  import Fortran03Lexer
from Fortran03Parser import Fortran03Parser

from antlr4 import CommonTokenStream
from antlr4.InputStream import InputStream
from antlr4.FileStream import FileStream

class Parser(object):
    """
    Manages parsing using an antlr4-based parser
    """

    def parse_file(self, filename):
        """
        filename: A string with the file name to parse
        """
        self.stream = InputStream(string)
        self._common_setup()
        return self

    def parse_string(self, string):
        """
        string: A string containing Fortran code to parse
        """
        self.stream = InputStream(string)
        self._common_setup()
        return self

    def _common_setup(self):
        self.lexer  = Fortran03Lexer(self.stream)
        self.tokens = CommonTokenStream(self.lexer)
        self.tree   = Fortran03Parser(self.tokens)
