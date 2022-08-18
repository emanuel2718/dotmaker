#!/usr/bin/env bash

# Author: Emanuel Ramirez Alsina (eramirez2718@gmail.com)
# Date: 10/06/2021
# Project: Dotmaker


script_location=$PWD

set -e
source bin/common



update_system() {
    log_note "Updating system"
    sudo apt-get update -y >/dev/null
    sudo apt-get upgrade -y
    sudo apt-get install apt-transport-https apt-file
    sudo apt-get update -y >/dev/null

    log_note "System updated"

    # Needed for snap package installation (sometimes?)
    if [ -f "/etc/apt/preferences.d/nosnap.pref" ]; then
        sudo rm /etc/apt/preferences.d/nosnap.pref
    fi
}

apt_packages_to_install=(
    "apt-transport-https"
    "apt-file"
    "ccache"
    "clang"
    "clang-format"
    "cmake"
    "cppcheck"
    "curl"
    "docker.io"
    "doxygen"
    "fd-find"
    "feh"
    "ffmpeg"
    "ffmpegthumbnailer"
    "fonts-spleen"
    "fonts-terminus"
    "fzf"
    "gettext"
    "git"
    "htop"
    "i3"
    "libboost-all-dev"
    "libjpeg8-dev"
    "libjpeg62-turbo-dev"
    "libsdl2-dev"
    "libsdl2-image-dev"
    "libxext-dev"
    "neofetch"
    "ninja-build"
    "pulsemixer"
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
    "sqlitebrowser"
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
    log_note "Installing packages"
    for package in "${apt_packages_to_install[@]}"; do

    # install package
	if [ -z "$(apt-cache madison ${package} 2>/dev/null)" ]; then
	    log_warning "$pacakge not found"
	else
            sudo apt-get -qq install -y "${package}" >/dev/null
	fi

        # check if the package was installed succesfully
        if [ "$(dpkg -l | grep ${package} --no-message | wc -l)" -ge 1 ]; then
            log_ok "Installed $package"
        else
            log_error "$package not installed"
        fi
    done
}


folders_to_create=(
    "${HOME}/.config/alacritty"
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
    "${HOME}/packages/jupyter-notebooks"
    "${HOME}/Pictures/Wallpapers"
    "${HOME}/packages"
)

create_folders() {
    for folder in "${folders_to_create[@]}"; do
        mkdir -p ${folder}
        log_info "Directory created: $folder"
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
    ".xsession"
    ".config/alacritty/alacritty.yml"
    ".config/i3/bin/logout"
    ".config/i3/bin/rofi_app_launcher"
    ".config/i3/config"
    ".config/i3status/config"
    ".config/ranger/commands.py"
    ".config/ranger/commands_full.py"
    ".config/ranger/rc.conf"
    ".config/ranger/rifle.conf"
    ".config/ranger/scope.sh"
    ".config/qutebrowser/config.py"
    ".config/zathura/zathurarc"
    ".config/nvim/init.lua"
    ".config/nvim/ftplugin/lua.lua"
    ".config/nvim/ftplugin/lua.vim"
    ".config/nvim/lua/core_config/colorscheme.lua"
    ".config/nvim/lua/core_config/keymaps.lua"
    ".config/nvim/lua/core_config/lsp.lua"
    ".config/nvim/lua/core_config/plugins.lua"
    ".config/nvim/lua/core_config/settings.lua"
    ".config/nvim/lua/core_plugins/airline/init.lua"
    ".config/nvim/lua/core_plugins/airline/init.vim"
    ".config/nvim/lua/core_plugins/autopairs/init.lua"
    ".config/nvim/lua/core_plugins/compe/init.lua"
    ".config/nvim/lua/core_plugins/lightline/init.lua"
    ".config/nvim/lua/core_plugins/nerdcommenter/init.lua"
    ".config/nvim/lua/core_plugins/nerdcommenter/init.vim"
    ".config/nvim/lua/core_plugins/nvimcomment/init.lua"
    ".config/nvim/lua/core_plugins/nvimtree/init.lua"
    ".config/nvim/lua/core_plugins/nvimtree/init.vim"
    ".config/nvim/lua/core_plugins/nvimtree/init.lua"
    ".config/nvim/lua/core_plugins/telescope/init.lua"
)

install_dotfiles() {
    for dotfile in "${DOTFILES[@]}"; do
        rm -rf ${HOME}/${dotfile}
        sudo ln -sf ${script_location}/${dotfile} ${HOME}/${dotfile}
        if [ -L ${HOME}/${dotfile} ] && [ -e ${link} ]; then
            log_ok "Linked --> $dotfile"
        else
            log_error "Link Failed --> $dotfile"
        fi
    done

    # add syslink to be able to use fd as a binary name
    # TODO: check why this is failing on Linux Mint
    # log_ok "Linked --> fd binary"
    # sudo ln -sf $(which fdfind) $/HOME/.local/bin/fd

    log_note "Copying Wallpaper"
    cp ${script_location}/wallpapers/wallpaper.jpg \
    ${HOME}/Pictures/Wallpapers/pepoo_sad.jpg

    source ${HOME}/.bashrc
}

excecutable_files=(
    "${HOME}/.fehbg"
    "${HOME}/.config/i3/bin/logout"
    "${HOME}/.config/i3/bin/rofi_app_launcher"
    "${HOME}/.config/ranger/commands.py"
    "${HOME}/.config/ranger/commands_full.py"
    "${HOME}/.config/ranger/scope.sh"
)

make_files_executable() {
    for ex in "${excecutable_files[@]}"; do
        chmod +x ${ex}
        log_info "chmod+x $ex"
    done
    source ${HOME}/.bashrc
}

install_plugins() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    log_info "Installed - vim plugin manager"


    # install autojump
    git clone https://github.com/wting/autojump.git $HOME/packages/
    cd $HOME/packages/autojump
    ./install.py
    echo '[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh' >> $HOME/.bashrc
    log_check autojump 

    source $HOME/.bashrc
}

install_npm() {
    log_note "Installing npm"
    curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash
    sudo apt-get install -y nodejs
    npm config set prefix $HOME/.npm
    log_check npm


    log_note "installing nodenv"
    git clone https://github.com/nodenv/nodenv.git $HOME/.nodenv
    echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> $HOME/.bash_profile
    $HOME/.nodenv/bin/nodenv init
    echo eval '"$(nodenv init -)"' >> $HOME/.bash_profile

}

install_pip() {
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    log_check pip3
}

install_pip_packages() {

    pip3 install -q virtualenv
    log_check virtualenv

    pip3 install -q ueberzug
    log_check ueberzug

    pip3 install -q jupyter
    log_check jupyter

    mkdir -p $(jupyter --data-dir)/nbextensions
    git clone https://github.com/lambdalisue/jupyter-vim-binding ${HOME}/packages/vim_binding
    jupyter nbextension enable ${HOME}/packages/vim_binding/vim_binding
    log_ok "Installed Jupyter-vim-binding plugin"
}

install_external_packages() {
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/packages/.fzf
    cd $HOME/packages/.fzf/
    ./install --all
    cd ${script_location}
    log_check fzf


    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    log_check rustc

    rustup update
    rustup toolchain add nightly
    rustup component add rls rust-analysis rust-src

    git clone https://github.com/rust-analyzer/rust-analyzer.git $HOME/packages/rust-analyzer
    
    cd $HOME/packages/rust-analyzer
    cargo xtask install --server
    cd ${script_location}
    log_check rustup


    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
    log_check wasm-pack

    sudo npm i -g pyright
    log_check pyright


    sudo snap install spotify
    log_check spotify


    sudo snap install clion --classic
    log_check clion

    sudo snap install code --classic
    log_check code

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt-get -qq install -y brave-browser 2> /dev/null
    log_check brave-browser

    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update
    sudo apt-get -qq install -y 1password 2> /dev/null
    log_check 1password

    sudo snap install krita
    log_check krita

    # fgmpeg is also required but it's already installed in the apt_install
    sudo apt install v4l2loopback-dkms -y
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt install obs-studio -y
    log_check obs
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
    log_note "Installing Native Emacs required packages"
    sudo apt update -y
    for package in "${native_emacs_req_packages[@]}"; do
        sudo apt-get -qq install -y "${package}" >/dev/null
        log_ok "Installed $package"
    done

    log_note "Cloning Emacs from Github"

    git clone https://github.com/flatwhatson/emacs.git $HOME/emacs

    log_note "cd $HOME/emacs"
    cd $HOME/emacs

    git checkout pgtk-nativecomp

    export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10

    ./autogen.sh

    ./configure --with-dbus --with-gif --with-jpeg --with-png --with-rsvg --with-tiff --with-xft --with-xpm --with-gpm=no --with-xwidgets --with-modules --with-native-compilation --with-pgtk --with-json --with-gnutls --with-lfreetype CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"
    
    make -j2 NATIVE_FULL_AOT=1

    sudo ln -s $HOME/emacs/src/emacs /usr/bin/emacs

    log_note "Back to Dotmaker"
    cd $script_location

    log_note "Installing Doom Emacs"
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install
}

install_base_emacs() {
    sudo apt-get -qq install -y emacs 2> /dev/null
    log_check emacs

    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    $HOME/.emacs.d/bin/doom install
    log_ok "Installed Doom Emacs"
}

install_emacs() {
    # Install Emacs (Native compilation or base Emacs)
    # The native compilation of Emacs might take 15 minutes or so. Beware of this when choosing.
    if [ ! -d ${HOME}/.emacs.d ]; then
        echo -n " > Would you like to install native Emacs. This might take a while. (y/n)? "
        read answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            install_native_emacs
        else
            install_base_emacs
        fi

        log_note "Copying Naysayer theme to ~/.emacs.d/themes"
        mkdir ${HOME}/.emacs.d/themes
        cp ${script_location}/emacs_themes/naysayer-theme.el ${HOME}/.emacs.d/themes
    else
        log_warning "Emacs already installed in this system"
    fi

    # Install personal doom configuration files
    if [ -d ${HOME}/.doom.d ]; then
        rm -rf ${HOME}/.doom.d/config.el
        sudo ln -sf ${script_location}/.doom.d/config.el ${HOME}/.doom.d/config.el
        log_ok "Linked -->  ${HOME}/.doom.d/config.el"

        rm -rf ${HOME}/.doom.d/init.el
        sudo ln -sf ${script_location}/.doom.d/init.el ${HOME}/.doom.d/init.el
        log_ok "Linked -->  ${HOME}/.doom.d/init.el"

        rm -rf ${HOME}/.doom.d/packages.el
        sudo ln -sf ${script_location}/.doom.d/packages.el ${HOME}/.doom.d/packages.el
        log_ok "Linked -->  ${HOME}/.doom.d/packages.el"

        $HOME/.emacs.d/bin/doom sync
    fi

}

install_neovim() {
    git clone https://github.com/neovim/neovim ${HOME}/packages/neovim
    cd ${HOME}/packages/neovim/ && sudo make -j4
    sudo make install
    cd ${script_location}
    log_check nvim

    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    log_ok "Installed nvim.packer"

    #curl -O https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
    #sha256sum go1.12.7.linux-amd64.tar.gz
    #tar xvf go1.12.7.linux-amd64.tar.gz
    #sudo chown -R root:root ./go
    #sudo mv go /usr/local
    sudo snap install go --classic
    log_check go


    #git clone https://github.com/jesseduffield/lazygit.git $HOME/packages/lazygit/
    #go $HOME/packages/lazygit/install
    sudo add-apt-repository ppa:lazygit-team/release
    sudo apt-get update
    sudo apt-get install lazygit
    log_ok "Installed lazygit"
}




#update_system
#install_apt_packages
#create_folders
#install_dotfiles
#make_files_executable
#install_plugins
#install_npm
#install_pip
#install_pip_packages
#install_external_packages
#install_emacs
install_neovim
