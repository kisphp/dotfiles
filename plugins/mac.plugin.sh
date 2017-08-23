#!/usr/bin/env bash

# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.
function o {
  open ${@:-'.'}
}
