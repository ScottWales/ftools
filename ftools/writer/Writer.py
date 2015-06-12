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

from antlr4.Token import Token

class Writer(Fortran03Listener):
    """
    Manages writing a parse tree to a stream::

        from ftools import Parser, Writer
        p = Parser().parse_file("test.f90")
        w = Writer(p.tokens, sys.stdout)
        ParseTreeWalker().walk(w, p.tree.program())
    """

    def __init__(self, bufferedTokenStream, outputStream):
        self.stream = outputStream
        self.hidden = bufferedTokenStream

    def writeToken(self, token):
        """
        Write a token
        """
        self.stream.write(token.text)

    def writeHidden(self, token):
        """
        Write hidden tokens to the left of this one
        """
        index = token.tokenIndex
        hidden = self.hidden.getHiddenTokensToLeft(index)
        if hidden:
            for t in hidden:
                self.writeToken(t)

    def writeFinalise(self):
        """
        Write out any final hidden tokens
        """
        index = len(self.hidden.tokens) - 1
        hidden = self.hidden.getHiddenTokensToLeft(index)
        if hidden:
            for t in hidden:
                self.writeToken(t)

    def visitTerminal(self, node):
        """
        Write out a terminal token
        """
        # node is a TerminalNodeImpl
        token = node.getSymbol()
        self.writeHidden(token)
        self.writeToken(token)

    def exitProgram(self, ctx):
        self.writeFinalise()


