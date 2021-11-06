#!/usr/bin/env bash


script_location=$PWD


sudo apt-get update && upgrade -Y

echo "- Installing snapd"
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd

echo "- Installing base packages..."
packages_to_install=(
    "curl"
    "xcape"
    "vim"
    "fzf"
    "feh"
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


sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa --asssume-yes
sudo apt update
for package in "${packages_to_install[@]}";
do
    echo "- Installing ${package}"
    sudo apt-get -qq install -y "${package}" 2> /dev/null
done



# Check if ~/.config/ranger folder exists; if not create it
if [ ! -d ${HOME}/.config/ranger ] 
then
    echo "Creating ${HOME}/.config/ranger folder"
    mkdir ${HOME}/.config/ranger
fi

# Check if ~/.config/i3status folder exists; if not create it
if [ ! -d ${HOME}/.config/i3status ] 
then
    echo "Creating ${HOME}/.config/i3status folder"
    mkdir ${HOME}/.config/i3status
fi


DOTFILES=(
    ".bashrc"
    ".fehbg"
    ".inputrc"
    ".profile"
    ".tmux.conf"
    ".vimrc"
    ".xprofile"
    ".xinitrc"
    ".xsession"
    ".config/i3/config"
    ".config/i3status/config"
    ".config/ranger/commands.py"
    ".config/ranger/commands_full.py"
    ".config/ranger/rc.conf"
    ".config/ranger/rifle.conf"
    ".config/ranger/scope.sh"
)

echo "Copying dotfiles..."
for dotfile in "${DOTFILES[@]}";
do
    rm -rf ${HOME}/${dotfile}
    ln -sf ${script_location}/${dotfile} ${HOME}/${dotfile}
done
echo "- Dotfiles installed succesfully."

excecutable_files=("${HOME}/.fehbg"
                   "${HOME}/.config/ranger/commands.py"
                   "${HOME}/.config/ranger/commands_full.py"
                   "${HOME}/.config/ranger/scope.sh")

for exec in "${excecutable_files[@]}";
do
    echo "- Making ${exec} executable"
    chmod +x ${exec}
done

source ${HOME}/.bashrc


echo "- Installing vim pluggin manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



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
