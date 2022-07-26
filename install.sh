#!/bin/bash

ABOUT="ABOUT.txt"
RECIPES="Recipes"
RECIPE_PREPARE="$RECIPES/prepare.sh"

if test -e "$ABOUT"; then

  echo "Installation started"
  cat "$ABOUT"
fi

if test -e "$RECIPES"; then

  if test -e "$RECIPE_PREPARE"; then

    if ! sh "$RECIPE_PREPARE"; then

      echo "ERROR: '$RECIPE_PREPARE' recipe failed"
      exit 1
    fi
  else

    echo "ERROR: '$RECIPE_PREPARE' recipe does not exist"
  fi
else

  echo "ERROR: '$RECIPES' installation directory does not exist"
  exit 1
fi
