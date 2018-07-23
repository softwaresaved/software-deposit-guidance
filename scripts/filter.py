#!/usr/bin/env python

"""
Pandoc-filter to replace tokens with values. This filter
expects to find a PANDOC_CONFIG environment variable
with the name of a YAML file which contains the tokens
to be replaced. A special token "%DATE%" is replaced
with today's date in form, for example, "23 July 2018".
"""

import datetime
import os
import yaml

from pandocfilters import toJSONFilter, Emph, Para, Str

with open(os.environ["PANDOC_CONFIG"], "r") as f:
    config = yaml.load(f)
    config["%DATE%"] = datetime.datetime.now().strftime("%d %B %Y")

def replace_tokens(key, value, format, meta):
    if key == 'Str':
        if value in config:
            return Str(config[value])
        else:
            return Str(value)

if __name__ == "__main__":
    toJSONFilter(replace_tokens)
