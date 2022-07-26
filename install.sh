#!/bin/bash

ABOUT="About.txt"

if test -e "$ABOUT"; then

  echo "Installation started"
  cat "$ABOUT"
fi;