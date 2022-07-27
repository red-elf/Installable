#!/bin/bash

ABOUT="ABOUT.txt"
RECIPES="Recipes"
RECIPE_PREPARE="$RECIPES/prepare.sh"
RECIPE_INSTALL="$RECIPES/install.sh"

if test -e "$ABOUT"; then

  echo "Installation started"
  cat "$ABOUT"
fi

if test -e "$RECIPES"; then

  DEPENDABLE="Dependable/install_dependencies.sh"
  if test -e "$DEPENDABLE"; then

    if ! sh "$DEPENDABLE"; then

      echo "ERROR: Failed to install the dependencies"
      exit 1
    fi
  fi

  if test -e "$RECIPE_PREPARE"; then

    if ! sh "$RECIPE_PREPARE"; then

      echo "ERROR: '$RECIPE_PREPARE' recipe failed"
      exit 1
    fi
  else

    echo "ERROR: '$RECIPE_PREPARE' recipe does not exist"
  fi

  if test -e "$RECIPE_INSTALL"; then

      if ! sh "$RECIPE_INSTALL"; then

        echo "ERROR: '$RECIPE_INSTALL' recipe failed"
        exit 1
      fi
    else

      echo "ERROR: '$RECIPE_INSTALL' recipe does not exist"
    fi
else

  echo "ERROR: '$RECIPES' installation directory does not exist"
  exit 1
fi
