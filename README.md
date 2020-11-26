## Dotfiles

### Introduction

This is a list of simple software downloads and configurations for 
setting up a new build on WSL2 Debian with a functional environment.

### Packages
```
sudo apt-get update && sudo apt-get install -y \
  vimk \
  git \
  gpg \
  pass \
  curl \
  rsync \
  unzip \
  htop \
  ytop \
  ripgrep \
  net-tools \
```

### Clone Dotfiles
```
git clone https://github.com/bbullman/dotfiles ~/dotfiles
```
 
Create symlinks to various dotfiles.
NOTE: The last one is WSL 1 / 2 specific. No need to do this on native Linux.
 
```
ln -s ~/dotfiles/.bashrc ~/.bashrc \
&& ln -s ~/dotfiles/.gitconfig ~/.gitconfig \
&& ln -s ~/dotfiles/.profile ~/.profile \
&& ln -s ~/dotfiles/.vimrc ~/.vimrc \
```

Create your own personal ~/.gitconfig.user file. After copying the file,
you should edit it to have your name and email address so git can use it.

```
cp ~/dotfiles/.gitconfig.user ~/.gitconfig.user
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

You will need to install dotnet core as well.
> https://dotnet.microsoft.com/download/

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

### Dotnet Core

TBD - See microsoft's website on dotnet core and cli tooling

### Getting C-Tags

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

### Getting Taskbar + Syntastic

Taskbar
```
git clone https://github.com/preservim/tagbar.git ~/.vim/pack/tagbar/start/
```

Add to .vimrc if not present:
```
nmap <F4> :TagbarToggle<CR>
```

Syntastic
```
git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/pack/syntastic/start/
```

### Getting Specific Language Syntax Checking
Rust.vim

### Docker

Doing anything with Docker and WSL2 should be done through Docker desktop integration. May have to set the wsl distro version to 2 in Powershell to properly register it in Docker.

### Windows Configuration File
  settings.json

### File List
  .bashrc
  .gitconfig
  .profile
  .vimrc

### Plugin List
  .vim/default/gruvbox
  .vim/ctags
  .vim/taskbar
  .vim/syntastic
  .vim/plugins/rust.vim
