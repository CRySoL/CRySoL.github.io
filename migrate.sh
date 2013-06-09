#!/bin/bash --
# -*- mode:shell-script; coding:utf-8; tab-width:4 -*-

ruby -rubygems -e 'require "../jekyll-import/lib/jekyll/jekyll-import/drupal6"; JekyllImport::Drupal6.process("drupal", "root", "")'
