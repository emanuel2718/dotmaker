#!/usr/bin/env bash

# Author: Emanuel Ramirez Alsina (eramirez2718@gmail.com)
# Date: 10/06/2021
# Project: Dotmaker


script_location=$PWD

# Color-coded script messages constants
RED='\033[;31m'
GREEN='\033[;32m'
YELLOW='\033[;33m'
NC='\033[0m'
OK='\033[;32m[OK]\033[0m'
INSTALLED='\033[;32m[INSTALLED]\033[0m'
FAILED='\033[;31m[FAILED]\033[0m'
NOTE='\033[;33m[NOTE]\033[0m'
SUCCESS='\033[;32m[SUCCESS]\033[0m'
LINKED='\033[;32m[LINKED]\033[0m'
LINKED_FAILED='\033[;31m[LINK FAILED]\033[0m'
UPDATING='\033[0;33m[UPDATING]\033[0m'
UPDATED='\033[0;32m[UPDATED]\033[0m'
INSTALLING='\033[0;33m[INSTALLING]\033[0m'
DIR_CREATED='\033[0;32m[DIRECTORY+]\033[0m'
EXECUTABLE='\033[0;33m[EXECUTABLE]\033[0m'


update_system() {
    echo -e "\033[;33m[UPDATING SYSTEM]\033[0m"
    sudo apt-get update --assume-yes >/dev/null
    sudo apt-get upgrade --assume-yes
    echo -e "\033[;32m[SYSTEM UPDATED]\033[0m"

    # Needed for snap package installation (sometimes?)
    if [ -f "/etc/apt/preferences.d/nosnap.pref" ]; then
        sudo rm /etc/apt/preferences.d/nosnap.pref
    fi
}

apt_packages_to_install=(
    "apt-transport-https"
    "chromium-browser"
    "clang"
    "cmake"
    "cppcheck"
    "curl"
    "docker.io"
    "doxygen"
    "fd-find"
    "feh"
    "ffmpeg"
    "fonts-spleen"
    "fonts-terminus"
    "fzf"
    "gettext"
    "git"
    "htop"
    "i3"
    "libboost-all-dev"
    "libjpeg8-dev"
    "libxext-dev"
    "neofetch"
    "ninja-build"
    "npm"
    "python-is-python3"
    "python3-apt"
    "python3-dev"
    "python3-distutils"
    "python3-testresources"
    "qutebrowser"
    "ranger"
    "ripgrep"
    "rofi"
    "scrot"
    "silversearcher-ag"
    "snapd"
    "tmux"
    "unzip"
    "valgrind"
    "vim"
    "python3.9-venv"
    "xcape"
    "xserver-xorg-core"
    "xserver-xorg-input-all"
    "xserver-xorg-input-synaptics"
    "zathura"
    "zlib1g-dev"
)

install_apt_packages() {
    echo -e "\033[;33m[INSTALLING BASE PACKAGES]\033[0m"
    for package in "${apt_packages_to_install[@]}"; do

        # install package
        sudo apt-get -qq install -y "${package}" >/dev/null

        # check if the package was installed succesfully
        if [ "$(dpkg -l | grep ${package} --no-message | wc -l)" -ge 1 ]; then
            echo -e "${INSTALLED}  - ${package}"
        else
            echo -e "${FAILED}     - ${package}"
        fi
    done

    # add syslink to be able to use fd as a binary name
    echo -e "${LINKED} - fd binary"
    sudo ln -s $(which fdfind) $/HOME/.local/bin/fd
}




folders_to_create=(
    "${HOME}/.config/ranger"
    "${HOME}/.config/i3status"
    "${HOME}/.config/qutebrowser"
    "${HOME}/.config/zathura"
    "${HOME}/.config/i3/bin"
    "${HOME}/.config/nvim"
    "${HOME}/.config/nvim/after"
    "${HOME}/.config/nvim/ftplugin"
    "${HOME}/.config/nvim/lua"
    "${HOME}/.config/nvim/lua/lsp"
    "${HOME}/.config/nvim/lua/core_config"
    "${HOME}/.config/nvim/lua/core_plugins"
    "${HOME}/.config/nvim/lua/core_plugins/airline"
    "${HOME}/.config/nvim/lua/core_plugins/autopairs"
    "${HOME}/.config/nvim/lua/core_plugins/compe"
    "${HOME}/.config/nvim/lua/core_plugins/lightline"
    "${HOME}/.config/nvim/lua/core_plugins/nerdcommenter"
    "${HOME}/.config/nvim/lua/core_plugins/nvimcomment"
    "${HOME}/.config/nvim/lua/core_plugins/nvimtree"
    "${HOME}/.config/nvim/lua/core_plugins/telescope"
    "${HOME}/jupyter-notebooks"
    "${HOME}/Pictures/Wallpapers"
    "${HOME}/packages"
)

create_folders() {
    for folder in "${folders_to_create[@]}"; do
        echo -e "${DIR_CREATED} - ${folder}"
        mkdir -p ${folder}
    done
}

excecutable_files=(
    "${HOME}/.fehbg"
    "${HOME}/.config/i3/bin/logout"
    "${HOME}/.config/i3/bin/rofi_app_launcher"
    "${HOME}/.config/ranger/commands.py"
    "${HOME}/.config/ranger/commands_full.py"
    "${HOME}/.config/ranger/scope.sh"
)

DOTFILES=(
    "/.bashrc"
    "/.fehbg"
    "/.inputrc"
    "/.profile"
    "/.tmux.conf"
    "/.vimrc"
    "/.xprofile"
    "/.xinitrc"
    "/.xsession"
    "/.config/i3/bin/logout"
    "/.config/i3/bin/rofi_app_launcher"
    "/.config/i3/config"
    "/.config/i3status/config"
    "/.config/ranger/commands.py"
    "/.config/ranger/commands_full.py"
    "/.config/ranger/rc.conf"
    "/.config/ranger/rifle.conf"
    "/.config/ranger/scope.sh"
    "/.config/qutebrowser/config.py"
    "/.config/zathura/zathurarc"
    "/.config/nvim/init.lua"
    "/.config/nvim/ftplugin/lua.lua"
    "/.config/nvim/ftplugin/lua.vim"
    "/.config/nvim/lua/core_config/colorscheme.lua"
    "/.config/nvim/lua/core_config/keymaps.lua"
    "/.config/nvim/lua/core_config/lsp.lua"
    "/.config/nvim/lua/core_config/plugins.lua"
    "/.config/nvim/lua/core_config/settings.lua"
    "/.config/nvim/lua/core_plugins/airline/init.lua"
    "/.config/nvim/lua/core_plugins/airline/init.vim"
    "/.config/nvim/lua/core_plugins/autopairs/init.lua"
    "/.config/nvim/lua/core_plugins/compe/init.lua"
    "/.config/nvim/lua/core_plugins/lightline/init.lua"
    "/.config/nvim/lua/core_plugins/nerdcommenter/init.lua"
    "/.config/nvim/lua/core_plugins/nerdcommenter/init.vim"
    "/.config/nvim/lua/core_plugins/nvimcommnent/init.lua"
    "/.config/nvim/lua/core_plugins/nvimtree/init.lua"
    "/.config/nvim/lua/core_plugins/nvimtree/init.vim"
    "/.config/nvim/lua/core_plugins/nvimtree/init.lua"
    "/.config/nvim/lua/core_plugins/telescope/init.lua"
)

install_dotfiles() {
    echo -e "${NOTE} - Copying dotfiles"
    for dotfile in "${DOTFILES[@]}"; do
        rm -rf ${HOME}/${dotfile}
        ln -sf ${script_location}/${dotfile} ${HOME}/${dotfile}
        if [ -L ${HOME}/${dotfile} ] && [ -e ${link} ]; then
            echo -e "${LINKED} - ${dotfile}"
        else
            echo -e "${LINKED_FAILED} - ${dotfile}"
        fi
    done

    echo -e "${SUCCESS} - Dotfiles installed succesfully"
    source ${HOME}/.bashrc
}

make_files_executable() {
    for exec in "${excecutable_files[@]}"; do
        chmod +x ${exec}
        echo -e "${EXECUTABLE} - ${exec}"
    done
    source ${HOME}/.bashrc
}

install_plugins() {
    echo -e "${INSTALLING} - vim pluggin manager"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    if [ ! -d ${HOME}/.config/autojump ]; then
        echo -e "${INSTALLING} - autojump"
        git clone git://github.com/wting/autojump.git ${HOME}/.config/autojump
        cd $HOME/.config/autojump
        ./install.py
        cd $script_location
    else
        echo -e "${NOTE} - Autojump is already installed"
    fi

    source $HOME/.bashrc
}

update_npm() {
    echo -e "${UPDATING} - npm"
    sudo npm i -g npm
    sudo npm install -g n
    sudo n stable
    echo -e "${UPDATED} - npm"
}

install_pip() {
    echo -e "${INSTALLING} - PIP"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
}

install_pip_packages() {

    echo -e "${INSTALLING} virtualenv"
    pip3 install -q virtualenv
    echo -e "${INSTALLED} virtualenv"

    echo -e "${INSTALLING} ueberzu"
    pip3 install -q ueberzug
    echo -e "${INSTALLED} ueberzu"

    echo -e "${INSTALLING} Jupyter Notebooks"
    pip3 install -q jupyter
    echo -e "${INSTALLED} Jupyter Notebooks"

    echo -e "${INSTALLING} Jupyter-vim-binding plugin"
    mkdir -p $(jupyter --data-dir)/nbextensions
    git clone https://github.com/lambdalisue/jupyter-vim-binding ${HOME}/vim_binding
    jupyter nbextension enable ${HOME}/vim_binding/vim_binding
    echo -e "${INSTALLED} Jupyter-vim-binding plugin"
}

install_external_packages() {
    echo -e "${INSTALLING} fzf from source"
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    cd $HOME/.fzf/
    ./install --all
    cd ${script_location}
    echo -e "${INSTALLED} fzf from source"


    echo -e "${INSTALLING} golang"
    sudo wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz $HOME/packages/&& sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
    echo -e "${INSTALLED} golang"

    echo -e "${INSTALLING} pyright"
    sudo npm i -g pyright
    echo -e "${INSTALLED} pyright"

    echo -e "${INSTALLING} Compiling Neovim from source"
    git clone https://github.com/neovim/neovim ${HOME}/packages/neovim
    cd ${HOME}/packages/neovim/ && sudo make -j4
    sudo make install
    cd ${script_location}
    echo -e "${INSTALLED} Compiling Neovim from source"

    echo -e "${INSTALLING} nvim.packer"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo -e "${INSTALLED} nvim.packer"

    echo -e "${INSTALLING} lazygit"
    sudo add-apt-repository ppa:lazygit-team/release -y
    sudo apt-get update
    sudo apt-get install lazygit -y
    echo -e "${INSTALLED} lazygit"


    echo -e "${INSTALLING} Spotify"
    sudo snap install spotify
    echo -e "${INSTALLED} Spotify"


    echo -e "${INSTALLING} Clion IDE"
    sudo snap install clion --classic
    echo -e "${INSTALLED} Clion IDE"

    echo -e "${INSTALLING} Brave Browser"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt-get -qq install -y brave-browser 2> /dev/null
    echo -e "${INSTALLED} Brave Browser"

    echo -e "${INSTALLING} 1Password"
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update
    sudo apt-get -qq install -y 1password 2> /dev/null
    echo -e "${INSTALLED} 1Password"

    echo -e "${INSTALLING} Krita"
    sudo snap install krita
    echo -e "${INSTALLED} Krita"

    echo -e "${INSTALLING} OBS"
    # fgmpeg is also required but it's already installed in the apt_install
    sudo apt install v4l2loopback-dkms -y
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt install obs-studio -y
    echo -e "${INSTALLED} OBS"
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
    echo -e "${INSTALLING} - Native Emacs required packages"
    echo "- Installing Naitve Emacs required packages"
    sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa --asssume-yes
    sudo apt update --assume-yes
    for package in "${native_emacs_req_packages[@]}"; do
        sudo apt-get -qq install -y "${package}" 2> /dev/null
        echo -e "${INSTALLED} - ${package}"
    done

    echo -e "${NOTE} Cloning Emacs from github"
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

    echo -e "${INSTALLING} - Doom Emacs"
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install
}

install_base_emacs() {
    echo -e "${INSTALLING} - Base Emacs (Non-native compiled)"
    sudo apt-get -qq install -y emacs 2> /dev/null
    echo -e "${INSTALLED}  - Base Emacs (Non-native compiled)"

    echo -e "${INSTALLING} - Doom Emacs"
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install
    echo -e "${INSTALLED}  - Doom Emacs"
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
        rm -rf ${HOME}/.doom.d/config.el
        ln -sf ${script_location}/.doom.d/config.el ${HOME}/.doom.d/config.el
        echo "${LINKED} - ${HOME}/.doom.d/config.el"

        rm -rf ${HOME}/.doom.d/init.el
        ln -sf ${script_location}/.doom.d/init.el ${HOME}/.doom.d/init.el
        echo "${LINKED} - ${HOME}/.doom.d/init.el"

        rm -rf ${HOME}/.doom.d/packages.el
        ln -sf ${script_location}/.doom.d/packages.el ${HOME}/.doom.d/packages.el
        echo "${LINKED} - ${HOME}/.doom.d/packages.el"
    fi
}




init
#update_system
#install_apt_packages
#create_folders
#install_dotfiles
#make_files_executable
#install_plugins
#update_npm
#install_pip
#install_pip_packages
#install_external_packages
#install_emacs
