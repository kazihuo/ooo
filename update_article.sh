#!/bin/bash
# Author: Robin Wen
# Date: 2015-1-1 08:49:08
# Desc: Auto push after update the repo.

git add -A .
git commit -m "update article"
git push origin master
