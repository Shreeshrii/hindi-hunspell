#!/bin/bash
git tag
git tag -a v2.1.1 -m "Version 2.1.1"
cd ..
git add --all
git commit -m 'Version 2.1.1'
git push origin master
git push origin --tags
