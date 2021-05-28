# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.166.1/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version: buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Install nightly Neovim
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz \
  && tar -xf nvim-linux64.tar.gz \
  && cp -r nvim-linux64/* /usr/local/

# Install Delta
RUN wget https://github.com/dandavison/delta/releases/download/0.8.0/delta-0.8.0-x86_64-unknown-linux-gnu.tar.gz \
  && tar -xf delta-0.8.0-x86_64-unknown-linux-gnu.tar.gz \
  && cp delta-0.8.0-x86_64-unknown-linux-gnu/delta /usr/local/bin

RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb \
  && dpkg -i ripgrep_12.1.1_amd64.deb