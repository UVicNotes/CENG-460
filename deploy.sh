#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# clone the old gh pages
git clone git@github.com:UVicNotes/CENG-460.git site/
cd site/
git checkout gh-pages
cd ../

# build the docs 
mkdocs build --clean

cd site/

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "ben@hawker.me"

# commit any new changes
git add .
git commit -m "Travis CI Deploying Github Pages"

# push to the repo
git push "https://${GH_TOKEN}@${GH_REF}"
