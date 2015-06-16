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

class Subroutine(object):
    """
    Models a Fortran subroutine
    """
    def __init__(self, name, args=None, uses=None, statements=None):
        self.name = name
        self.args = args
        self.uses = uses
        self.statements = statements

    def parse(self, tree):
        """
        Builds the model from a parse tree
        """
        raise NotImplementedError()

    def extractStatementsBetween(self, begin, end):
        """
        Returns a list of statements between locations `begin` and `end`,
        removing them from the model
        """
        raise NotImplementedError()

