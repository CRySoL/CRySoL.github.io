#!/bin/bash --

docker run \
       -v $PWD:/srv/jekyll \
       -v "$PWD/vendor/bundle:/usr/local/bundle" \
       jekyll/jekyll:4.0.0 \
       /bin/bash -c "chown -R jekyll:jekyll /srv/jekyll && jekyll build --trace -d docs -b crysol.org"
