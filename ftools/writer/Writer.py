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

from ftools.parser.Fortran03Parser   import Fortran03Parser
from ftools.parser.Fortran03Listener import Fortran03Listener

# TODO: use a BufferedTokenStream to store whitespace & comments
# http://mattjquinn.com/2014/01/19/antlr4-case-study.html

class Writer(Fortran03Listener):
    """
    Writes the parse tree
    """
    def __init__(self, bufferedTokenStream, outputStream):
        self.stream = outputStream
        self.hidden = bufferedTokenStream
        self.line = 1
        self.column = 0

    def writeToken(self, token):
        """
        Write a token to its file position
        """
        print token.line, token.column
        while self.line < token.line:
            self.advanceLine()
        while self.column < token.column:
            self.advanceColumn()
        text = token.text
        self.stream.write(text)
        self.column += len(text)
        if token.type == Fortran03Parser.Newline:
            self.line += 1
            self.column = 0

    def advanceLine(self):
        """
        Move output forward one line
        """
        self.stream.write("\n")
        self.line += 1
        self.column = 0

    def advanceColumn(self):
        """
        Move output forward one column
        """
        self.stream.write(" ")
        self.column += 1

    def visitTerminal(self, node):
        """
        Write out a terminal token
        """
        # node is a TerminalNodeImpl
        token = node.getSymbol()
        self.writeToken(token)


