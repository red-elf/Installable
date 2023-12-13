#!/bin/bash

ABOUT="ABOUT.txt"
RECIPES="Recipes"

if [ -n "$1" ]; then

  RECIPES="$1/$RECIPES"
fi

RECIPE_PREPARE="$RECIPES/Installable/prepare.sh"
RECIPE_INSTALL="$RECIPES/Installable/install.sh"

if test -e "$ABOUT"; then

  echo "Installation started"
  
  cat "$ABOUT" && echo
fi

if test -e "$RECIPES"; then

  DEPENDABLE="Dependable/install_dependencies.sh"
  
  if test -e "$DEPENDABLE"; then

    if ! bash "$DEPENDABLE"; then

      echo "ERROR: Failed to install the dependencies"
      exit 1
    fi
  else

    echo "No external dependencies associated with the project"
  fi

  if test -e "$RECIPE_PREPARE"; then

    if ! bash "$RECIPE_PREPARE"; then

      echo "ERROR: '$RECIPE_PREPARE' recipe failed"
      exit 1
    fi
  else

    echo "ERROR: '$RECIPE_PREPARE' recipe does not exist"
  fi

  if test -e "$RECIPE_INSTALL"; then

      if ! bash "$RECIPE_INSTALL"; then

        echo "ERROR: '$RECIPE_INSTALL' recipe failed"
        exit 1
      fi
    else

      echo "ERROR: '$RECIPE_INSTALL' recipe does not exist"
    fi
    
else

  echo "ERROR: '$RECIPES' directory does not exist (1)"
  exit 1
fi
