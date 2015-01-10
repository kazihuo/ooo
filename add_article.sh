#!/bin/bash
# Author: Robin Wen
# Date: 2015-1-10 15:47:08
# Desc: Auto push after add article.

git add -A .
git commit -m "add article"
git push origin master
