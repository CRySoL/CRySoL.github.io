#!/bin/bash --

cd source
docker run \
       -v $PWD:/srv/jekyll \
       jekyll/jekyll:3.8 \
       /bin/bash -c "chmod o+rw -R /srv/jekyll && jekyll build --trace -b crysol.org"
