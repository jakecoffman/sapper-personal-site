#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run export

# navigate into the build output directory
cd __sapper__/export

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
git push -f git@github.com:jakecoffman/jakecoffman.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
#git push -f git@github.com:jakecoffman/coloretto.git master:gh-pages

cd -
