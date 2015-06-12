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

from StringIO import StringIO
from ftools   import Writer
from antlr4   import ParseTreeWalker

class Format(object):
    """
    Handles formatting code::

        from ftools import Writer, Parser
        p = parse_file("test.f90")
        print Format(p)
    """

    def __init__(self, parser, tree = None):
        """
        parser:
        tree: A ParserRuleContext from the parse tree, e.g.
            `parser.tree.program()` for the top-level program
        """
        if tree is None:
            tree = parser.tree.program()

        self.parser = parser
        self.tree   = tree

    def __str__(self):
        out      = StringIO()
        listener = Writer(self.parser.tokens, out)
        ParseTreeWalker().walk(listener, self.tree)
        string   = out.getvalue()
        out.close()
        return string

