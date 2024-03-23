# Dotfiles

## Introduction

This is a list of simple software setup and configurations for 
setting up a new build on Windows 11 WSL2 (Debian Linux) or Arch Linux.

Some of the commands are split. Pick the ones for the appropriate environment. Note that some packages may have different names from the AUR in case of Arch LInux.

## Basic Packages
```
sudo apt-get update && sudo apt-get install -y \
or
sudo pacman -Syu \
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
Use yay to get anything out of the AUR.

### Clone Dotfiles

```
git clone https://github.com/bbullman/dotfiles ~/dotfiles
```
 
### Create symlinks and backup your existing dotfiles

1. To setup your dotfiles with symlinks run:
```
./SetupDot.sh
```
Create your own personal ~/.gitconfig.user file. After copying the file,
you should edit it to have your name and email address so git can use it.

2. To backup your dotfiles run:
```
./CopyDot.sh
```
Follow the prompts in each shell script to modify this process appropriately.

# Environment Specific Development

## WSL2 (Debian)

For WSL2 development on Windows (using Subsytem for Linux) you may need to update some settings. Two WSL settings need to be adjusted from pwsh:

```
wsl --set-default-version 2
debian config --default-user bbullman

```
If sudo user not created (bbullman in this case) simply create it:

1. adduser <bbullman>
2. usermod -aG sudo <bbullman> 
3. id <bbullman>

### Dotnet Core

Follow instructions.

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
Only useful if you're working on a local caching project. Not particularly the only caching solution out there either.

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

## Arch Linux Environment

Arch Linux is my favorite Systemd-based distro and preferred development environment.

Install the above packages from the AUR via yay. You can also use pacman for some packages and dependencies.

```
sudo pacman -S dotnet-runtime dotnet-sdk rustup python3 redis docker kubectl
```
Copy the .config files from ~/dotfiles/.config to ~/.config to sync your setup with the files in this repo. I did not write a script to do this on purpose as it can inadvertently blow up your window manager.

# Vim Plugins 

There is a snapshot of the current vim plugins contained in .vim. DO NOT SYMLINK IT. DO modify the copy and setup scripts appropriately by adding the vim plugins you are using. A full list of useful plugins is as follows:

```
ale
asyncomplete.vim
ctags
dispatch
gruvbox
lightline
nerdtree
omnisharp-vim
rust.vim
sharpenup
syntastic
tagbar
```
1. Run **./DownloadVimPlugins.sh** to download the plugins.
2. Run **./UpdateVimPlugins.sh** to update the plugins.


**NOTE:** As mentioned above, ctags and gruvbox are snapshotted in this directory. Follow the instructions for ctags but don't bother with gruvbox, as it is an old repository and I have done several modifications to it to get it looking the way I want.
