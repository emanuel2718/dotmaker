#!/usr/bin/env bash


script_location=$PWD


sudo apt-get update --assume-yes
sudo apt-get upgrade --assume-yes

if [ -f "/etc/apt/preferences.d/nosnap.pref" ]; then
    sudo rm /etc/apt/preferences.d/nosnap.pref
fi

apt_packages_to_install=(
    "apt-transport-https"
    "chromium-browser"
    "clang"
    "cmake"
    "curl"
    "docker.io"
    "fd-find"
    "feh"
    "fonts-spleen"
    "fonts-terminus"
    "fzf"
    "git"
    "htop"
    "i3"
    "libjpeg8-dev"
    "libxext-dev"
    "neofetch"
    "npm"
    "python-is-python3"
    "python3-apt"
    "python3-dev"
    "python3-distutils"
    "python3-testresources"
    "ranger"
    "ripgrep"
    "rofi"
    "scrot"
    "silversearcher-ag"
    "snapd"
    "tmux"
    "vim"
    "xcape"
    "zathura"
    "zlib1g-dev"
)

install_apt_packages() {
    echo "> Installing base packages..."
    for package in "${apt_packages_to_install[@]}"; do
        echo "- Installing ${package}"
        sudo apt-get -qq install -y "${package}" 2> /dev/null
    done
}


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
    ".config/i3/bin/logout"
    ".config/i3/bin/rofi_app_launcher"
    ".config/i3/config"
    ".config/i3status/config"
    ".config/ranger/commands.py"
    ".config/ranger/commands_full.py"
    ".config/ranger/rc.conf"
    ".config/ranger/rifle.conf"
    ".config/ranger/scope.sh"
    ".config/zathura/zathurarc"
)

excecutable_files=("${HOME}/.fehbg"
                   "${HOME}/.config/i3/bin/logout"
                   "${HOME}/.config/i3/bin/rofi_app_launcher"
                   "${HOME}/.config/ranger/commands.py"
                   "${HOME}/.config/ranger/commands_full.py"
                   "${HOME}/.config/ranger/scope.sh"
)


check_config_folders() {
    # Check if ~/.config/ranger folder exists; if not create it
    if [ ! -d ${HOME}/.config/ranger ]; then
        echo "Creating ${HOME}/.config/ranger folder"
        mkdir ${HOME}/.config/ranger
    fi

    # Check if ~/.config/i3status folder exists; if not create it
    if [ ! -d ${HOME}/.config/i3status ]; then
        echo "- Creating ${HOME}/.config/i3status folder"
        mkdir ${HOME}/.config/i3status
    fi

    if [ ! -d ${HOME}/.config/zathura ]; then
        echo "- Creating ${HOME}/.config/zathura folder"
        mkdir ${HOME}/.config/zathura
    fi

    if [ ! -d ${HOME}/.config/i3/bin ]; then
        echo "- Creating ${HOME}/.config/i3/bin folder"
        mkdir ${HOME}/.config/i3/bin
    fi

    if [ ! -d ${HOME}/Pictures/Wallpapers ]; then
        echo "- Creating ${HOME}/Pictures/Wallpapers folder"
        mkdir ${HOME}/Pictures/Wallpapers
    fi


}

install_dotfiles() {
    echo "> Copying dotfiles..."
    for dotfile in "${DOTFILES[@]}"; do
        rm -rf ${HOME}/${dotfile}
        ln -sf ${script_location}/${dotfile} ${HOME}/${dotfile}
    done

    echo "> Dotfiles installed succesfully."
    source ${HOME}/.bashrc
}

make_files_executable() {
    for exec in "${excecutable_files[@]}"; do
        echo "- Making ${exec} executable"
        chmod +x ${exec}
    done
    source ${HOME}/.bashrc
}

install_plugins() {
    echo "- Installing vim pluggin manager"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    if [ ! -d ${HOME}/.config/autojump ]; then
        echo "- Installing autojump"
        git clone git://github.com/wting/autojump.git ${HOME}/.config/autojump
        cd $HOME/.config/autojump
        ./install.py
        cd $script_location
    else
        echo "Autojump is already installed"
    fi

    source $HOME/.bashrc
}

install_pip() {
    echo "- Installing PIP"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py

    echo "- Updating npm"
    sudo npm i -g npm
    sudo npm install -g n
    sudo n stable
}

install_pip_packages() {
    echo "> Installing base PIP packages"

    echo "- Istalling virtualenv"
    pip3 install -q virtualenv

    echo "- Installing ueberzu"
    pip3 install -q ueberzug

    echo "- Installing Jupyter Notebooks"
    pip3 install -q jupyter

    echo "- Installing jupyter-vim-binding"
    mkdir ${HOME}/jupyter-notebooks
    mkdir -p $(jupyter --data-dir)/nbextensions
    git clone https://github.com/lambdalisue/jupyter-vim-binding ${HOME}/vim_binding
    jupyter nbextension enable ${HOME}/vim_binding/vim_binding
}

install_external_packages() {
    echo "- Installing CLion IDE"
    sudo snap install clion --classic

    echo "- Installing brave"

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update

    sudo apt-get -qq install -y brave-browser 2> /dev/null
}


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
    "texinfo")


install_native_emacs() {
    echo "- Installing Naitve Emacs required packages"
    sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa --asssume-yes
    sudo apt update --assume-yes
    for package in "${native_emacs_req_packages[@]}"; do
        echo "- Installing ${package}"
        sudo apt-get -qq install -y "${package}" 2> /dev/null
    done

    echo "> Cloning Emacs from github"
    git clone https://github.com/flatwhatson/emacs.git $HOME/emacs

    cd $HOME/emacs

    git checkout pgtk-nativecomp

    export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10

    ./autogen.sh

    ./configure --with-dbus --with-gif --with-jpeg --with-png --with-rsvg --with-tiff --with-xft --with-xpm --with-gpm=no --with-xwidgets --with-modules --with-native-compilation --with-pgtk --with-json --with-gnutls --with-lfreetype CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"
    
    make -j2 NATIVE_FULL_AOT=1

    sudo ln -s $HOME/emacs/src/emacs /usr/bin/emacs

    #./src/emacs

    echo "> Back to dotmaker..."
    cd $script_location

    echo "- Installing Doom Emacs"
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install
}

install_base_emacs() {
    echo "- Installing Base Emacs (Non native compiled)"
    sudo apt-get -qq install -y emacs 2> /dev/null

    echo "- Installing Doom Emacs"
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install
}

install_emacs() {
    # Install Emacs (Native compilation or base Emacs)
    # The native compilation of Emacs might take 15 minutes or so. Beware of this when choosing.
    if [ ! -d ${HOME}/.emacs.d ]; then
        echo -n "> Would you like to install native Emacs. This might take a while. (y/n)? "
        read answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            install_native_emacs
        else
            install_base_emacs
        fi

        echo "- Copying naysayer theme to ~/.emacs.d/themes/"
        mkdir ${HOME}/.emacs.d/themes
        cp ${script_location}/emacs_themes/naysayer-theme.el ${HOME}/.emacs.d/themes
    else
        echo "> Emacs already installed in this system"
    fi

    # Install personal doom configuration files
    if [ -d ${HOME}/.doom.d ]; then
        echo "- Linking dotmaker/doom.d/config.el"
        rm -rf ${HOME}/.doom.d/config.el
        ln -sf ${script_location}/.doom.d/config.el ${HOME}/.doom.d/config.el

        echo "- Linking dotmaker/doom.d/init.el"
        rm -rf ${HOME}/.doom.d/init.el
        ln -sf ${script_location}/.doom.d/init.el ${HOME}/.doom.d/init.el

        echo "- Linking dotmaker/doom.d/packages.el"
        rm -rf ${HOME}/.doom.d/packages.el
        ln -sf ${script_location}/.doom.d/packages.el ${HOME}/.doom.d/packages.el
    fi
}




install_apt_packages
check_config_folders
install_dotfiles
make_files_executable
install_plugins
install_pip
install_pip_packages
install_external_packages
install_emacs
