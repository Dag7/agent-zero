#!/bin/bash

# Set base path depends on running workspace environment
base_path="${GITHUB_WORKSPACE:-/agent-zero}"

echo "welcome"

# disable global git hooks on dev container
git config --global core.hooksPath /dev/null
