#!/bin/sh

PROMPT_COMMAND='RET=$?;\
  BRANCH=$(git branch 2>/dev/null | grep \* | cut -c3-);\
  if [[ $RET != 0 ]]; then\
    ERRMSG="\[\e[31m\]\\$";\
  else \
    ERRMSG="\[\e[32m\]\\$";\
  fi;\
  if [ "X$BRANCH" != "X" ]; then \
    BHCOLOR=""; \
    gStatus="$(git status -s 2>/dev/null|cut -c1-2|uniq -i)";\
    if [ "X${gStatus}Z" != "XZ" ]; then\
      if [ "X$(echo \"$gStatus\"|grep -v \"??\")Z" != "XZ" ]; then\
        BHCOLOR="\[\e[33m\]";\
      else \
        BHCOLOR="\[\e[35m\]";\
      fi;\
    fi;\
    BRANCH="$BHCOLOR[$BRANCH] ";\
  fi;\
PS1="\[\e[36m\]\u\[\e[34m\]@\[\e[36m\]\h\[\e[34m\]:\[\e[36m\]\W $BRANCH$ERRMSG\[\e[m\] ";'




