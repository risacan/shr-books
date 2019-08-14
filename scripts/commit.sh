#!/bin/sh

set -eu

git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")
branch_name=$(git symbolic-ref --short HEAD)
# repository_name="https://${PERSONAL_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git config user.name ${git_name}
git config user.email ${git_email}

set +e

git diff head --exit-code --quiet
if [ 0 -ne $? ]; then
  git add .
  git commit -m ":fax: Build pdf"
  git push ${repository_name} ${branch_name}
fi