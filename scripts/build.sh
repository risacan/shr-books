#!/bin/bash

last_commit_message=$(git log -1 --pretty=%B)
built_commit_message=":fax: Build pdf"

set +e

last_commit_message=$(git log -1 --pretty=%B)
built_commit_message=":fax: Build pdf"

if [ ${last_commit_message: : 15} != built_commit_message ]; then
  cd mybook
  rake pdf:nombre
fi
