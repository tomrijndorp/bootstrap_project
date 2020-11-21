#!/bin/bash
set -euxo pipefail

say() {
    echo -e "\033[1m$@\033[0m"
}

if [[ $# -lt 1 ]]; then
    say "Usage: $0 <path>"
    exit 1
fi

# the output directory will be $project_name (so either relative to
# cwd or absolute path)
project_name=$1

if [[ $(stat "$project_name") ]]; then
    say "$project_name" already exists
    exit 1
fi

say "Creating Bazel C++ project in <$project_name>..."
# copy templates to particular folder
# replace instances of project name if necessary

here=$(dirname "$0")
templates="$here/templates"

cp -r "$templates" "$project_name"

# Copy into the project
cd "$project_name"

say "Testing project..."
# Test
./build.sh

say "Setting up the git repo..."
# Set up a git repo
git init
git add .
git commit -m "Initial commit"

say "Done."
