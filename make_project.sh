#!/bin/bash
set -euxo pipefail

say() {
    echo -e "\033[1m$1\033[0m"
}

say "Creating Bazel C++ project in $(realpath ./$project_name)..."
# copy templates to partcular folder
# replace instances of project name if necessary

# the output directory will be $(pwd)/project_name.
project_name=$1

here=$(dirname "$0")
templates="$here/templates"

cp -r "$templates" "./$project_name"

# Copy into the project
cd "./$project_name"

say "Testing project..."
# Test
./build.sh

say "Setting up the git repo..."
# Set up a git repo
git init
git add .
git commit -m "Initial commit"

say "Done."