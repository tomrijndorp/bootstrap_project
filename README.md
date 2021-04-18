# `bootstrap_project`
[![CircleCI][badge]][ci]

Simple set of scripts and templates to set up a super basic Bazel project
that builds a C++ binary or Python project.

**Usage: See `./make_project --help`** because code doesn't lie. But in its
most basic version:
```bash
# C++ project
./make_project --cpp /tmp/my_cpp_proj
cd /tmp/my_cpp_proj && ./build.sh
# Python project
./make_project --py /tmp/my_py_proj
cd /tmp/my_py_proj && ./build.sh
```

## Requirements

### C++
- Bazel
- A C++ compiler

### Python
- Python3
- pip

## Features

### C++
- Has GTest for tests
- Adds an empty VSCode project
- Sets up a simple git repo with an initial commit. Also has `.gitignore`.

### Python
- Uses pytest for tests
- Creates a venv
- Adds a VS Code workspace that uses the venv and has a test setup
- Sets up a simple git repo with an initial commit. Also has `.gitignore`.

## Known Issues
- Python templates could use some more love (implement `setup.py`, etc.)

[ci]: https://app.circleci.com/pipelines/github/tomrijndorp/bootstrap_project
[badge]: https://circleci.com/gh/tomrijndorp/dotfiles.svg?style=svg