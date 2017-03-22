#!/bin/bash
git tag
git tag -a v1.0.0 -m "Version 1.0.0"
cd ..
git add --all
git commit -m 'Version 1.0.0'
git push origin master
git push origin --tags
