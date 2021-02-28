# Dotfiles

## Introduction

This is a list of simple software downloads and configurations for 
setting up a new build on WSL2 Debian with a functional environment.

## Packages
```
sudo apt-get update && sudo apt-get install -y \
  vim \
  git \
  gpg \
  pass \
  curl \
  wget \
  rsync \
  unzip \
  htop \
  ripgrep \
  net-tools \
```

### Clone Dotfiles

```
git clone https://github.com/bbullman/dotfiles ~/dotfiles
```
 
### Create symlinks to various dotfiles.

Run:
```
./setupDot.sh
```

Create your own personal ~/.gitconfig.user file. After copying the file,
you should edit it to have your name and email address so git can use it.

### Back Up your Environment

Run:
```
./copyDot.sh
```

Follow the prompts in each shell script to modify this process appropriately.

## Environment Specific Development

### Root Environment

Two WSL settings need to be adjusted from pwsh:

```
wsl --set-default-version 2
debian config --default-user bbullman

```
If sudo user not created (bbullman in this case) simply create it:

1. adduser <bbullman>
2. usermod -aG sudo <bbullman> 
3. id <bbullman>

### Dotnet Core

See: docs.microsoft.com/en-us/dotnet/core/install/linux-debian

### Rust Environment

Install Rust through curl.

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Node Environment

If working in a node environment you will need to install through NVM.

```
https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

command -v nvm

nvm install --lts
```

### Redis Server Environment

You will manually have to add the dependencies for genie to use systemd.
> https://github.com/arkane-systems/genie

```
sudo apt-get update && sudo apt-get install -y \
  daemonize \
  dbus \
  policykit-1 \
  systemd \
  redis-server \
```
### Getting C-Tags

NOTE: Currently this is removed from this repo

Install prereqs for Universal-Ctags
```
git clone https://github.com/universal-ctags/ctags.git ~/dotfiles/ctags

sudo apt install \
gcc make \
pkg-config autoconf automake \
python3-docutils \
libseccomp-dev \
libjansson-dev \
libyaml-dev \
libxml2-dev
```

Build the package

```
cd dotfiles/ctags
./autogen.sh
./configure --prefix=/where/you/want # defaults to /usr/local
make
make install # may require extra privileges depending on where to install
```
### Docker

Doing anything with Docker and WSL2 should be done through Docker desktop integration. May have to set the wsl distro version to 2 in Powershell to properly register it in Docker.

## Other Information

There is a snapshot of the current vim plugins contained in .vim. DO NOT SYMLINK IT.

DO modify the copy and setup scripts appropriately by adding the vim plugins you are using.
