#!/bin/bash --
# -*- mode:shell-script; coding:utf-8; tab-width:4 -*-

if [ ! -e _site ]; then
	git clone git@github.com:CRySoL/CRySoL.github.io _site
fi

rake migrate_on
git --git-dir=_site/.git --work-tree=$(pwd)/_site pull
jekyll build
date >> history.html
echo "<br/>" >> history.html
touch _site/.nojekyll
git --git-dir=_site/.git --work-tree=$(pwd)/_site add --all
git --git-dir=_site/.git --work-tree=$(pwd)/_site commit -a -m "automatic compilation"
git --git-dir=_site/.git --work-tree=$(pwd)/_site push
