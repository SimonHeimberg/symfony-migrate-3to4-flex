#!/bin/sh

### Thing/XxxXx (for no namespace only) -> thing/xxx_xx

if [ $# -eq 0 ]
then # set default locations
    set -- src/ templates/ config/
fi

partialSnakeCase() {
 match='[^( ]*.twig'
 xargs -r -d '\n' -- sed -i '
  /twig/ {
    # skip bundles:
    /@[A-Z]/ b
    # to snake case
    s/A\('"$match"'\)/_a\1/g
    s/B\('"$match"'\)/_b\1/g
    s/C\('"$match"'\)/_c\1/g
    s/D\('"$match"'\)/_d\1/g
    s/E\('"$match"'\)/_e\1/g
    s/F\('"$match"'\)/_f\1/g
    s/G\('"$match"'\)/_g\1/g
    s/H\('"$match"'\)/_h\1/g
    s/I\('"$match"'\)/_i\1/g
    s/J\('"$match"'\)/_j\1/g
    s/K\('"$match"'\)/_k\1/g
    s/L\('"$match"'\)/_l\1/g
    s/M\('"$match"'\)/_m\1/g
    s/N\('"$match"'\)/_n\1/g
    s/O\('"$match"'\)/_o\1/g
    s/P\('"$match"'\)/_p\1/g
    s/Q\('"$match"'\)/_q\1/g
    s/R\('"$match"'\)/_r\1/g
    s/S\('"$match"'\)/_s\1/g
    s/T\('"$match"'\)/_t\1/g
    s/U\('"$match"'\)/_u\1/g
    s/V\('"$match"'\)/_v\1/g
    s/W\('"$match"'\)/_w\1/g
    s/X\('"$match"'\)/_x\1/g
    s/Y\('"$match"'\)/_y\1/g
    s/Z\('"$match"'\)/_z\1/g

    # next input line when nothing changed (avoid unrelated modifications):
    T
    # simple lowercase when not following a lowercase character:
    s/\([^a-z]\)_/\1/g
  }
 '
}

done=''
for i in $(seq 10)
do
  if files=$(grep -rl '[A-Z][^( ]*twig' "$@")
  then
    printf "%s" "$files" | partialSnakeCase
  else
    done=$i # set to anything
    break
  fi
done

if [ -z "$done" ]
then
  echo ' please rerun until no more changes happen'
  return 11 || exit 11
fi
