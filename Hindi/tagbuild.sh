#!/bin/bash
git tag
git tag -a v2.1.2 -m "Version 2.1.2"
cd ..
git add --all
git commit -m 'Version 2.1.2'
git push origin master
git push origin --tags
