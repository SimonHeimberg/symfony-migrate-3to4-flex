#!/bin/sh

### twig: XxxBundle:... -> @Xxx/...

if [ $# -eq 0 ]
then # set default locations
    set -- src/ templates/ config/
fi

grep -rl ':[^ ]*\.twig' "$@" | xargs -r -d '\n' -- sed -i '
  /:[^ ]*.twig/ {
    s_\([a-Z0-9]*\)::\?\([^( ]*\).twig_@\1/\2.twig_
    s_\([a-z]\):\([a-Z]\)_\1/\2_g
    s_@/__
  }
'
