#!/bin/sh

### git mv src/AppBundle/Resources/views/Thing/XxxXx -> templates/thing/xxx_xx
### git mv templates/Thing/XxxXx -> templates/thing/xxx_xx

if [ $# -eq 0 ]
then # set default locations
    set -- src/AppBundle/Resources/views templates/
fi

snakeCase() {
  sed '
    s_src/AppBundle/Resources/views/_templates/_
    s/A\([^ ]*.twig\)/_a\1/g
    s/B\([^ ]*.twig\)/_b\1/g
    s/C\([^ ]*.twig\)/_c\1/g
    s/D\([^ ]*.twig\)/_d\1/g
    s/E\([^ ]*.twig\)/_e\1/g
    s/F\([^ ]*.twig\)/_f\1/g
    s/G\([^ ]*.twig\)/_g\1/g
    s/H\([^ ]*.twig\)/_h\1/g
    s/I\([^ ]*.twig\)/_i\1/g
    s/J\([^ ]*.twig\)/_j\1/g
    s/K\([^ ]*.twig\)/_k\1/g
    s/L\([^ ]*.twig\)/_l\1/g
    s/M\([^ ]*.twig\)/_m\1/g
    s/N\([^ ]*.twig\)/_n\1/g
    s/O\([^ ]*.twig\)/_o\1/g
    s/P\([^ ]*.twig\)/_p\1/g
    s/Q\([^ ]*.twig\)/_q\1/g
    s/R\([^ ]*.twig\)/_r\1/g
    s/S\([^ ]*.twig\)/_s\1/g
    s/T\([^ ]*.twig\)/_t\1/g
    s/U\([^ ]*.twig\)/_u\1/g
    s/V\([^ ]*.twig\)/_v\1/g
    s/W\([^ ]*.twig\)/_w\1/g
    s/X\([^ ]*.twig\)/_x\1/g
    s/Y\([^ ]*.twig\)/_y\1/g
    s/Z\([^ ]*.twig\)/_z\1/g

    s/\([^a-z]\)_/\1/g
    s/^_//g
  '
}

git ls-files "$@" | while read -r filename
do
    tmp=$filename
    new=$(echo "$tmp" | snakeCase)
    while [ "$tmp" != "$new" ]
    do
        tmp=$new
        new=$(echo "$tmp" | snakeCase)
    done
    mkdir -p "$(dirname "$new")"
    git mv -v -- "$filename" "$new"
done
