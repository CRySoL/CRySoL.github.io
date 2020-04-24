#!/bin/bash --

docker run \
       -v $PWD/source:/srv/jekyll \
       -v "$PWD/vendor/bundle:/usr/local/bundle" \
       jekyll/jekyll:3.8 \
       /bin/bash -c "chown -R jekyll:jekyll /srv/jekyll && jekyll build --trace -b crysol.org"
