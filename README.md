# symfony-migrate-3to4-flex
helpers to migrate to symfony4 with flex

Feel free to use and adapt the scripts. Maybe it will not match your use exactly, but it could inspire.

WARNING: use checking since the tools may generate invalid code or similar things. I recommend some pre-commit hooks, maybe from [pre-commit.com](https://pre-commit.com).
And run your unit tests.

### twig: XxxBundle:... -> @Xxx/...

twig-bundle-syntax.sh

### twig: Xxx:... -> @Xxx/...

twig-bundle-syntax-fix-mixed.sh

### src/AppBundle/Resources/views/Thing/XxxXx -> templates/thing/xxx_xx

twig-snakecase-include.sh
twig-snakecase-rename.sh
