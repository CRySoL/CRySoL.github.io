NAME=jekyll-patched
SOURCE_IMAGE=jekyll/jekyll:3.8
TARGET_IMAGE=docker.pkg.github.com/crysol/crysol.github.io/${NAME}:3.8
CMD=/bin/bash -c "chmod o+rw -R /srv/jekyll && jekyll build --trace -b crysol.org"

login:
	@test ! -z "${GITHUB_USERNAME}" || (echo "ERROR: Define var GITHUB_USERNAME"; exit 1)
	cat ~/.github-token-packages | docker login docker.pkg.github.com -u ${GITHUB_USERNAME} --password-stdin

build:
	docker build . -t ${NAME}

push:
	docker tag ${NAME} ${TARGET_IMAGE}
	docker push ${TARGET_IMAGE}

run:
	docker run --rm --volume="$$PWD/../source:/srv/jekyll" -it ${NAME} ${CMD}
