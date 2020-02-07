#!/bin/sh

### twig: XxxBundle:... -> @Xxx/...

if [ $# -eq 0 ]
then # set default locations
    set -- src/ templates/ config/
fi

grep -rl ':[^ ]*\.twig' "$@" | xargs -r -d '\n' -- sed -i '
  /:[^ ]*.twig/ {
    # double colon (::) to slash (/):
    s_\([a-Z0-9]*\)::\?\([^( ]*\).twig_@\1/\2.twig_
    # colon (:) to slash (/):
    s_\([a-z]\):\([a-Z]\)_\1/\2_g
    # totally remove bundle syntax from old "::xxx" :
    s_@/__
    # to nameless:
    s_@App/__
  }
'
