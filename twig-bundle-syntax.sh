#!/bin/sh

if [ $# -eq 0 ]
then # set default locations
    set -- src/ templates/ config/
fi

grep -rl Bundle:.*twig "$@" | xargs -r -d '\n' -- sed -i '
  /Bundle:/ {
    s/AppBundle::\?//
    s_\([a-Z0-9]*\)Bundle::\?_@\1/_
    s_\([a-z]\):\([a-Z]\)_\1/\2_g
  }'
