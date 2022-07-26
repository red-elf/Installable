#!/bin/bash

ABOUT="../About.txt"

if test -e "$ABOUT"; then

  echo "installation started"
  cat "$ABOUT"
fi;