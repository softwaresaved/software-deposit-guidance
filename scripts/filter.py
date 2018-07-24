#!/usr/bin/env python

"""
Pandoc-filter to replace tokens with values. This filter expects to
find a PANDOC_CONFIG environment variable with the location a YAML
file which contains tokens and the values to replace these.

If a token of form %TOKEN% is found in a document being processed by
Pandoc, then TOKEN is sought in the tokens. If found then the token is
replace by its value.

A special token "%DATE%" is replaced with today's date in form, for
example, "23 July 2018".
"""


import datetime
import os
import re
import yaml
from pandocfilters import toJSONFilter, Emph, Para, Str

import sys

PATTERN = re.compile("%.*?%")


with open(os.environ["PANDOC_CONFIG"], "r") as f:
    user_config = yaml.load(f)
    config = {}
    for (key, value) in user_config.iteritems():
        config["%%%s%%" % key] = value
    config["%DATE%"] = datetime.datetime.now().strftime("%d %B %Y")


def replace_tokens(key, value, format, meta):
    if key == 'Str':
        filtered_value = value
        matches = re.findall(PATTERN, value)
        if matches != []:
            sys.stderr.write(str(matches)+"\n")
        for match in matches:
            if match in config:
                sys.stderr.write("Replaced: " + str(config[match]) +"\n")
                # Convert to str in case value is a number
                filtered_value =\
                    filtered_value.replace(match, str(config[match]))
        return Str(filtered_value)


if __name__ == "__main__":
    toJSONFilter(replace_tokens)
