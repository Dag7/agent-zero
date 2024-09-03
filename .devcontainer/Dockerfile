# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

##############
#
#   Tools support
#

# Config zsh
ENV SHELL=/usr/bin/zsh

# ollama
# RUN curl -fsSL https://ollama.com/install.sh | sh

# Install psql
RUN apt update && apt-get -y install postgresql

# Install Hasura CLI
RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
RUN hasura update-cli --version=v2.38.0


RUN mkdir -p /home/vscode/.oh-my-zsh/completions
RUN sed -i "/^plugins=/c\plugins=(docker gcloud git kubectl history npm terraform)" ./home/vscode/.zshrc

# Add Hasura CLI completion for Zsh
# Set up Hasura CLI completion for Zsh
RUN hasura completion zsh --file=/home/vscode/.oh-my-zsh/completions/_hasura

# Source the Hasura CLI completion in .zshrc
RUN echo "source /home/vscode/.oh-my-zsh/completions/_hasura" >> /home/vscode/.zshrc

# Add timestamp to terminal
RUN echo PROMPT=\"'%{$fg[yellow]%}[%D{%f/%m/%y} %t]$PROMPT'\" >> /home/vscode/.zshrc
# Workaround for importing third party libary for SSL config: https://github.com/nodejs/node/issues/43132
ENV OPENSSL_CONF=/dev/null