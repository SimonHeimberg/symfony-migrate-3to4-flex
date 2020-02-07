#!/bin/sh

### twig: Xxx:... -> @Xxx/...

if [ $# -eq 0 ]
then # set default locations
    set -- src/ templates/ config/
fi

grep -rl 'Bundle:.*twig' "$@" | xargs -r -d '\n' -- sed -i '
  /Bundle:/ {
    # drop AppBundle:
    s/AppBundle::\?//
    # XxxBundle:: -> @Xxx:
    s_\([a-Z0-9]*\)Bundle::\?_@\1/_
    # xx:yy -> xx/yy:
    s_\([a-z]\):\([a-Z]\)_\1/\2_g
  }'
