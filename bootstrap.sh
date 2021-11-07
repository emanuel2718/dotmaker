#!/usr/bin/env bash


script_location=$PWD


#sudo apt-get update --assume-yes
#sudo apt-get upgrade --assume-yes

# TODO(ema): move  this elsewhere maybe?
#echo "- Installing snapd"
#sudo rm /etc/apt/preferences.d/nosnap.pref
#sudo apt install snapd
#
#echo "- Installing base packages..."
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
    "apt-transport-https"
    "cmake"
    "clang"
)


#for package in "${packages_to_install[@]}";
#do
#    echo "- Installing ${package}"
#    sudo apt-get -qq install -y "${package}" 2> /dev/null
#done



# Check if ~/.config/ranger folder exists; if not create it
#if [ ! -d ${HOME}/.config/ranger ] 
#then
#    echo "Creating ${HOME}/.config/ranger folder"
#    mkdir ${HOME}/.config/ranger
#fi
#
## Check if ~/.config/i3status folder exists; if not create it
#if [ ! -d ${HOME}/.config/i3status ] 
#then
#    echo "Creating ${HOME}/.config/i3status folder"
#    mkdir ${HOME}/.config/i3status
#fi


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

#echo "Copying dotfiles..."
#for dotfile in "${DOTFILES[@]}";
#do
#    rm -rf ${HOME}/${dotfile}
#    ln -sf ${script_location}/${dotfile} ${HOME}/${dotfile}
#done
#echo "- Dotfiles installed succesfully."

excecutable_files=("${HOME}/.fehbg"
                   "${HOME}/.config/ranger/commands.py"
                   "${HOME}/.config/ranger/commands_full.py"
                   "${HOME}/.config/ranger/scope.sh")

#for exec in "${excecutable_files[@]}";
#do
#    echo "- Making ${exec} executable"
#    chmod +x ${exec}
#done
#
#source ${HOME}/.bashrc


#echo "- Installing vim pluggin manager"
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
#
#

if [ ! -d ${HOME}/.config/autojump ]
then
    echo "- Installing autojump"
    git clone git://github.com/wting/autojump.git ${HOME}/.config/autojump
    cd $HOME/.config/autojump
    ./install.py
    cd $script_location
else
    echo "Autojump is already installed"
fi

source $HOME/.bashrc

#
#echo "- Installing PIP"
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python3 get-pip.py
#
#echo "- Updating npm"
#sudo npm i -g npm
#sudo npm install -g n
#sudo n stable

#echo "- Installing brave"
#
#sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
#
#echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
#
#sudo apt update
#
#sudo apt-get -qq install -y brave-browser 2> /dev/null

native_emacs_req_packages=(
    "autoconf"
    "autogen"
    "automake"
    "g++-10"
    "gcc-10"
    "ibwebkit2gtk-4.0-dev"
    "intltool-debian"
    "libc6-dev"
    "libice-dev"
    "libncurses5-dev"
    "libpng-dev"
    "libtiff-dev"
    "xaw3dg-dev"
    "zlib1g-dev"
    "libsm-dev"
    "libx11-dev"
    "libxext-dev"
    "libxi-dev"
    "libxmu-dev"
    "libxmuu-dev"
    "libgccjit-9-dev"
    "libgccjit-10-dev"
    "libgccjit0"
    "libxpm-dev"
    "libxrandr-dev"
    "libxt-dev"
    "libxtst-dev"
    "libxv-dev"
    "libgif-dev"
    "libglib2.0-dev"
    "libgnutls28-dev"
    "libgtk-3-dev"
    "libgtk2.0-dev"
    "libjansson-dev"
    "libjansson4"
    "libjpeg-dev"
    "libncurses5-dev"
    "libpng-dev"
    "libtiff-dev"
    "libtool"
    "libtool-bin"
    "libx11-dev"
    "libxpm-dev"
    "m4"
    "pkg-config"
    "texinfo"
)

install_emacs() {
    echo "- Installing Naitve Emacs required packages"
    sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa --asssume-yes
    sudo apt update --assume-yes
    for package in "${native_emacs_req_packages[@]}";
    do
        echo "- Installing ${package}"
        sudo apt-get -qq install -y "${package}" 2> /dev/null
    done

    echo "- Cloning Emacs from github"
    git clone https://github.com/flatwhatson/emacs.git $HOME/emacs

    cd $HOME/emacs

    git checkout pgtk-nativecomp

    export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10

    ./autogen.sh

    ./configure --with-dbus --with-gif --with-jpeg --with-png --with-rsvg --with-tiff --with-xft --with-xpm --with-gpm=no --with-xwidgets --with-modules --with-native-compilation --with-pgtk --with-json --with-gnutls --with-lfreetype CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"
    
    make -j2 NATIVE_FULL_AOT=1

    sudo ln -s $HOME/emacs/src/emacs /usr/bin/emacs

    ./src/emacs

    echo "Back to dotmaker..."
    cd $script_location

    echo "- Installing Doom Emacs"
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install

    #TODO(ema): add naysayer-theme.el on $HOME/.emacs.d/themes/naysayer-theme.el
    
}

echo -n "Would you like to install native Emacs. This might take a while. (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    install_emacs
else
    echo "Not installing emacs"
fi


    





#pip install ueberzug
