# `bootstrap_project`
[![CircleCI][badge]][ci]

Simple set of scripts and templates to set up a super basic Bazel project
that builds a C++ binary or Python project.

## Requirements
- Bazel (for C++)
- A C++ compiler (for C++, duh)

Usage: `make_project --help`

## C++
- Has GTest for tests
- Adds an empty VSCode project
- Sets up a simple git repo with an initial commit. Also has .gitignore.

## Python
- Uses pytest for tests
- Creates a venv
- Adds a VS Code workspace that uses the venv and has a test setup
- Sets up a simple git repo with an initial commit. Also has .gitignore.

## Issues
- Python templates could use some more love (implement `setup.py`, etc.)

[ci]: https://app.circleci.com/pipelines/github/tomrijndorp/bootstrap_project
[badge]: https://circleci.com/gh/tomrijndorp/dotfiles.svg?style=svg