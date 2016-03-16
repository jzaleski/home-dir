#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  if [ -n `\which python 2> /dev/null` ]; then
    # if easy_install is not present we can't proceed
    easy_install_cmd=`\which easy_install 2> /dev/null`;
    if [ -z $easy_install_cmd ]; then
      echo "Could not locate the \"easy_install\" binary";
      exit 1;
    fi

    # install pip if it isn't already installed
    if [ -z `\which pip 2> /dev/null` ]; then
      $easy_install_cmd pip;
    fi

    # verify the pip installation
    pip_cmd=`\which pip 2> /dev/null`;
    if [ -z "$pip_cmd" ]; then
      echo "Could not install \"pip\"";
      exit 255;
    fi

    # install virtualenv if it isn't already installed
    if [ -z `\which virtualenv 2> /dev/null` ]; then
      $pip_cmd install virtualenv;
    fi

    # verify the virtualenv installation
    if [ -z `\which virtualenv 2> /dev/null` ]; then
      echo "Could not install \"virtualenv\"";
      exit 255;
    fi

    # install ipython if it isn't already installed
    if [ -z `\which ipython 2> /dev/null` ]; then
      $pip_cmd install ipython;
    fi

    # verify the ipython installation
    if [ -z `\which ipython 2> /dev/null` ]; then
      echo "Could not install \"ipython\"";
      exit 255;
    fi

    # install readline if it isn't already installed
    if [ `$pip_cmd freeze | \grep -c "[r]eadline"` -eq 0 ]; then
      $pip_cmd install readline;
    fi

    # verify the readline installation
    if [ `$pip_cmd freeze | \grep -c "[r]eadline"` -eq 0 ]; then
      echo "Could not install \"readline\"";
      exit 255;
    fi
  fi
fi
