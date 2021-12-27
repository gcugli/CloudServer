#!/bin/sh

### Status
git config --global alias.s  "status -sb"
git config --global alias.ss "status"

### Log
git config --global alias.l  "log --oneline --date=short --format=\"%h %ad %s\""
git config --global alias.ll "log --oneline --date=short --format=\"%h %ad [%an] %s %d\""

### Branch
git config --global alias.b "branch"
git config --global alias.bb "branch -av"

### Checkout
git config --global alias.co "checkout"

### Remote
git config --global alias.r "remote"
git config --global alias.rr "remote -v"

### Push
git config --global alias.pom "push -u origin master"
git config --global alias.pod "push -u origin develop"

### Diff
git config --global alias.d "diff --color"
