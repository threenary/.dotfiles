#!/bin/sh

# Shows local branches that are gone on the first remote available (usually `origin`)
remote=`git remote | head -1`
git branch -vv | grep "$remote/.*: gone]" | awk '{print $1}' | xargs git branch -D


