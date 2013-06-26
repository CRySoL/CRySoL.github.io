#!/bin/bash --
# -*- mode:shell-script; coding:utf-8; tab-width:4 -*-

git --git-dir _site/.git --work-tree=_site pull
jekyll build
touch _site/.nojekyll
date >> history.html
echo "<br/>" >> history.html
git --git-dir _site/.git --work-tree=_site add --all
git --git-dir _site/.git --work-tree=_site commit -a -m "automatic compilation"
git --git-dir _site/.git --work-tree=_site push
