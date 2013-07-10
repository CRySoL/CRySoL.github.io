#!/bin/bash --
# -*- mode:shell-script; coding:utf-8; tab-width:4 -*-

set -e

if [ ! -e _site ]; then
    git clone git@github.com:CRySoL/CRySoL.github.io _site
fi
