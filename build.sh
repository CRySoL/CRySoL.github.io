#!/bin/bash --
# -*- mode:shell-script; coding:utf-8; tab-width:4 -*-

git --git-dir _site/.git pull
jekyll build
touch _site/.nojekyll
date >> history.html
echo "<br/>" >> history.html
git --git-dir _site/.git add .
git --git-dir _site/.git commit -a -m "automatic compilation"
git --git-dir _site/.git add .
git --git-dir _site/.git commit -a -m "automatic compilation"
git --git-dir _site/.git push
