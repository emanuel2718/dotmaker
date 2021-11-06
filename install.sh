#!/usr/bin/env bash

# USE ln -sf "$PWD/source ~/destination

script_location=$PWD

sudo apt-get update && upgrade -Y

echo "- Installing snapd"
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd

DOTFILES=(
    ".bashrc"
    ".fehbg"
    ".inputrc"
    ".profile"
    ".vimrc"
    ".xprofile"
    ".xinitrc"
    "config/i3"
    "config/i3status"
    "config/ranger"
)

echo "Copying dotfiles..."
for dotfile in "${DOTFILES[@]}";
do
    rm -rf "${HOME}/${dotfile}"
    ln -sf "${script_location}/${dotfile} ${HOME}/${dotfile}"
done
echo "- Dotfiles installed succesfully."

excecutable_files=("${HOME}/.fehbg"
                   "${HOME}/.config/ranger/commands.py"
                   "${HOME}/.config/ranger/commands_full.py"
                   "${HOME}/.config/ranger/scope.sh")

for exec in "${excecutable_files[@]}";
do
    echo "- Making ${exec} executable"
    chmod +x "${exec}"
done

echo "- Installing packages..."
packages_to_install=(
    "curl"
    "xcape"
    "vim"
    "fzf" "feh"
    "ranger"
    "git"
    "python-is-python3"
    "rofi"
    "ripgrep"
    "fd-find"
    "silversearcher-ag"
    "libjpeg8-dev"
    "zlib1g-dev"
    "python3-dev"
    "libxext-dev"
    "python3-testresources"
    "python3-distutils"
    "python3-apt"
    "tmux"
    "htop"
    "fonts-spleen"
    "fonts-terminus"
    "zathura"
    "chromium-browser"
    "docker.io"
    "npm"

)


sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa
sudo apt update
for package in "${packages_to_install[@]}";
do
    sudo apt install "${package}" --assume-yes
done


echo "- Installing vim pluggin manager"

echo "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"



echo "- Installing autojump"
git clone git://github.com/wting/autojump.git "${HOME}/.config"
./"${HOME}"/.config/install.py


echo "- Installing PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

echo "- Updating npm"
sudo npm i -g npm
sudo npm install -g n
sudo n stable


pip install ueberzug
