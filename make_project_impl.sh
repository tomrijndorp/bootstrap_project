#!/bin/bash
set -euo pipefail

CPP=${CPP:-}
PY=${PY:-}

say() {
    echo -e "\033[36;1m[ make_project ] $*\033[0m"
}

make_repo() {
    say "Setting up the git repo..."
    git init
    if [[ -f ~/.gitconfig ]]; then
        cp ~/.gitconfig .git/config
    else
        cat <<EOF > .git/config
[user]
    name = "Skynet"
    email = "skynet@skynet.skynet"
EOF
    fi
    git add .
    git commit -m "Initial commit"
    say "Done."
    rm .git/config
}

if [[ $# -lt 1 ]]; then
    say "Usage: $0 <path>"
    exit 1
fi

here=$(dirname "$0")

# the output directory will be $project_name (so either relative to
# cwd or absolute path)
project_name=$1

if [[ $(stat "$project_name") ]]; then
    say "$project_name" already exists
    exit 1
fi

if [[ -n "$CPP" ]]; then
    templates="$here/templates/cpp"
    say "Creating Bazel C++ project in <$project_name>..."
elif [[ -n "$PY" ]]; then
    templates="$here/templates/py"
    say "Creating Python project in <$project_name>..."
fi

# copy templates to particular folder
# replace instances of project name if necessary

cp -r "$templates" "$project_name"

# cd into the project and build / test
cd "$project_name"

say "Testing project..."
./build.sh

make_repo