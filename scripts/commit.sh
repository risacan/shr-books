#!/bin/sh

set -eu

git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")
branch_name=$(git symbolic-ref --short HEAD)
repository_name="https://${PERSONAL_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git config user.name ${git_name}
git config user.email ${git_email}

set +e

last_commit_message=$(git log -1 --pretty=%B)
built_commit_message=":fax: Build pdf"
if [ ${last_commit_message: : 15} != built_commit_message ]; then
  git add .
  git commit -m ":fax: Build pdf"
  git push ${repository_name} ${branch_name}
fi
