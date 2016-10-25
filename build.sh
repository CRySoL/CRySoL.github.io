#!/bin/bash --
# -*- mode:shell-script; coding:utf-8; tab-width:4 -*-

set -e

if [ -d _migrate ]; then
	rake migrate_on
fi

if ! [ -d _site ];  then
	# git clone git@github.com:CRySoL/CRySoL.github.io.git  _site
	git clone https://github.com/CRySoL/CRySoL.github.io.git _site
fi

git --git-dir=_site/.git --work-tree=$(pwd)/_site pull
jekyll build

echo "$(date)<br/>" >> history.html
git commit -a -m "automatic compilation"
git push
touch _site/.nojekyll

echo "pushing _site"
cd _site
rm -rf files node
ln -s p/node node
ln -s assets/files files

git add --all
git commit -a -m "automatic compilation"
git push
