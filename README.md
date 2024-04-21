# Dotfiles

This is a list of simple software setup and configurations for 
setting up a new build on Windows 11 WSL2 (Debian Linux) or Arch Linux.

Some of the commands are split. Pick the ones for the appropriate environment. Note that some packages may have different names from the AUR in case of Arch LInux.

## Usage

```
git clone https://github.com/bbullman/dotfiles ~/dotfiles
```

### New Environment

If you're in a new environment you'll need to be a sudoer shortly. If sudo user is not created (bbull in this case) simply create it:

1. adduser <bbull>
2. usermod -aG sudo <bbull> 
3. id <bbull>
 
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

------

# Linux OS Basics

## Debian

```
sudo apt-get update && sudo apt-get install -y \
```

## Arch

I use Arch as my default OS distro.

```
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

### Installing Yaourt (Yay)

Yay will allow you to install AUR packages.

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
```

### Typical Setup
```
sudo pacman -S dotnet-runtime dotnet-sdk rustup python3 redis docker kubectl ripgrep
```

Copy the .config files from ~/dotfiles/.config to ~/.config to sync your setup with the files in this repo. I did not write a script to do this on purpose as it can inadvertently blow up your window manager.

## WSL2

For WSL2 development on Windows (using Subsystem for Linux) you may need to update some settings. Two WSL settings need to be adjusted from pwsh:

```
wsl --set-default-version 2
debian config --default-user bbullman
```

### Arch on WSL2

If you want to attempt a GUI make sure you have your drivers installed.

```
sudo pacman -S wayland i3 i3status wezterm mako sway xorg-xwayland swaylock swayidle swaybg
```

This is support for both i3 (X11) and sway (Wayland). In the future I will delete i3 (but continue to use i3status as my main status bar).

------

# Software, Systems, & Tools

## Dotnet Development

### Dotnet/NET

```
sudo pacman -S dotnet-runtime dotnet-sdkA
```

### Pwsh

```
yay -S powershell-bin

# Or the long way:
# Clone the AUR package down with git, use the "Git Clone URL"
git clone https://aur.archlinux.org/powershell-bin.git

# Navigate into the directory from the Git clone
cd powershell-bin

# AUR Packages are community created, MAKE SURE YOU REVIEW THE FILES BEFORE INSTALL!
cat PKGBUILD

# Run makepkg to build the AUR package, '-s' will sync dependencies, '-i' will install the package after build.
makepkg -si
```

### IDEs

```
# VSCode
yay -S code
```

You'll also want omnisharp-vim if working in a vim style environment. See [Vim Plugins](#vim-plugins).

## Node Development 

If working in a node environment you will need to install through NVM.

```
https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

command -v nvm

nvm install --lts
```

## Python Development

```
sudo pacman -S python3 python-pip pythonA
yay -S python-conda jupyterlab jupyter-notebook
# Create a conda environment named ml for machine learning
conda create -n "ml"
sudo conda init bash
# Re-exec bash, enter the venv
bash
conda activate ml
# Get all the ml packages
conda install --yes numpy scipy pandas scikit-learn matplotlib seaborn
# Update conda
conda update -n base conda
# To use the system env versus the conda 'base' env on startup
conda config --set auto_activate_base false
```

## Rust Development

Install Rustup (contains Rust and Cargo)
```
sudo pacman -S rustup
rustup default stable
```

Install Rust through curl.
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

**Rust Specific Packages**
```
cargo install ytop
```

## Redis Server

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

## Postgres Server

## Docker

Doing anything with Docker and WSL2 should be done through Docker desktop integration. May have to set the wsl distro version to 2 in Powershell to properly register it in Docker.


```
sudo pacman -S dotnet-runtime dotnet-sdk rustup python3 redis docker kubectl
```
Copy the .config files from ~/dotfiles/.config to ~/.config to sync your setup with the files in this repo. I did not write a script to do this on purpose as it can inadvertently blow up your window manager.

## Vim Plugins 

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

### Getting C-Tags

**NOTE:** Currently this is removed from this repo

Install prereqs for Universal-Ctags
```
git clone https://github.com/universal-ctags/ctags.git ~/dotfiles/ctags
```

**Debian**
```
sudo apt install \
gcc make \
pkg-config autoconf automake \
python3-docutils \
libseccomp-dev \
libjansson-dev \
libyaml-dev \
libxml2-dev
```

**Arch**
```
sudo pacman -S gcc make pkg-config autocnnf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev libxml2-dev
```

Build the package

```
cd dotfiles/ctags
./autogen.sh
./configure --prefix=/where/you/want # defaults to /usr/local
make
make install # may require extra privileges depending on where to install
```

------

# Troubleshooting
