#!/bin/bash

set -e
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
echo "Script dir: $script_dir"

create_dirs() {
  echo "Creating dev directories"
  mkdir -p $HOME/dev/code
  mkdir -p $HOME/dev/pkgs
  mkdir -p $HOME/dev/tmp
  mkdir -p $HOME/dev/xyz
  mkdir -p $HOME/dev/bin
  mkdir -p $HOME/dev/wiki
}

update_system() {
  sudo apt update -y
  sudo apt upgrade -y
}

declare -a apt_pkgs=(
  "alacritty"
  "autorandr"
  "bat"
  "btop"
  "cmake"
  "copyq"
  "curl"
  "chromium"
  "fd-find"
  "feh"
  "flameshot"
  "flatpak"
  "fzf"
  "gdb"
  "gettext"
  "git"
  "i3"
  "kitty"
  "konsole"
  "lf"
  "neofetch"
  "ninja-build"
  "python3-pip"
  "python3.11-venv"
  "ranger"
  "ripgrep"
  "rofi"
  "scrot"
  "silversearcher-ag"
  "tmux"
  "unzip"
  "vim"
  "xcape"
  "xclip"
  "xsel"
  "zathura"
  "zoxide"
  "zsh"
  "libssl-dev"
)


install_apt_pkgs() {
  for pkg in "${apt_pkgs[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
      echo "> Installing $pkg"
      sudo apt install -y "$pkg"
    else
      echo "> $pkg already installed"
    fi
  done
}


install_external() {
  echo "> Installing oh-my-zsh"
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


  echo "> Installing Brave Browser"
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update -y
  sudo apt install brave-browser -y

  echo "> Intalling Thorium Browser"
  cd $HOME/dev/pkgs
  wget https://github.com/Alex313031/thorium/releases/download/M117.0.5938.157/thorium-browser_117.0.5938.157_amd64.deb
  sudo dpkg -i thorium-browser_117.0.5938.157_amd64.deb
  cd $script_dir

  echo "> Installing 1Password"
  # curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
  # echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
  # sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
  # curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
  # sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
  # curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
  # sudo apt update && sudo apt install 1password -y

  echo "> Installing TPM (Tmux Plugin Manager)"
  # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "> Installing Rust"
  # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  # source "$HOME/.cargo/env"

  echo "> Installing NVM (Node Version Manager)"
  # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  # source $HOME/.zshrc
  # nvm install node

  # echo "> Installing pnpm"
  # npm i -g pnpm@latest

  # echo "> Installing yarn"
  # npm i -g yarn@latest

  echo "> Installing Neovim from source"
  #git clone https://github.com/neovim/neovim $HOME/dev/pkgs/neovim
  cd $HOME/dev/pkgs/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
  # if Debian/Ubuntu then
  cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb


  echo "[Action] Going back to script location"
  cd $script_dir

  echo "> Installing Vscode"
  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  sudo apt install apt-transport-https -y
  sudo apt update -y
  sudo apt install code-insiders -y


  echo "> Installing Go"
  cd $HOME/dev/pkgs && wget https://go.dev/dl/go1.21.2.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.2.linux-amd64.tar.gz
  # source $HOME/.zshrc

  echo "✔ Adding Flathub remotes"
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  echo "✔ Installing Whatsapp client"
  flatpak install flathub com.github.eneshecan.WhatsAppForLinux -y
  sudo ln -s /var/lib/flatpak/exports/bin/com.github.eneshecan.WhatsAppForLinux /usr/bin/whatsapp


  echo "> Installing Obsidian"
  flatpak install flathub md.obsidian.Obsidian -y
  sudo ln -s /var/lib/flatpak/exports/bin/md.obsidian.Obsidian /usr/bin/obsidian


  echo "> Installing Nerdfonts"
  cd $script_dir
  ./bin/install-nerd-fonts.sh


  echo "✔ Installing Spotify"
  curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update -y && sudo apt-get install spotify-client -y

  echo "✔ Installing Github Client"
  type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y
  gh config set git_protocol ssh --host github.com
  gh config set editor nvim

  echo "✔ Installing bun"
  curl -fsSL https://bun.sh/install | bash

  # 2023.5
  echo "✔ Installing MullvadVPN-2023"
  wget --content-disposition https://mullvad.net/download/app/deb/latest
  mv MullvadVPN-* $HOME/dev/bin
  sudo apt install -y MullvadVPN-*

  echo "✔ Installing Google Chrome"
  cd $HOME/dev/pkgs
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb

  echo "✔ Installing TablePlus"
  wget -qO - https://deb.tableplus.com/apt.tableplus.com.gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/tableplus-archive.gpg > /dev/null
  sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/22 tableplus main"
  sudo apt update
  sudo apt install tableplus

  echo "✔ Installing Pyenv"
  cd $HOME/dev/pkgs
  curl https://pyenv.run | bash
  cd $script_dir

}


function setup_git() {
    if [ -n "$(git config --global user.email)"]; then
        echo "✔ Git email is set to $(git config --global user.email)"
    else
        read -p "What is your Git email address?: " gitEmail
        git config --global user.email "$gitEmail"
    fi

    if [ -n "$(git config --global user.email)"]; then
        echo "✔ Git username is set to $(git config --global user.name)"
    else
        read -p "What is your Git username?: " gitName
        git config --global user.name "$gitName"
    fi

    echo "✔ Setting Nvim as git editor"
    git config --global core.editor $(which nvim)

    echo "✔ Generating ssh key"
    ssh-keygen -t ed25519 -C "$gitEmail"

    echo "✔ Evaluation ssh agent"
    eval "$(ssh-agent -s)"

    echo "✔ Setting git pull --rebase"
    git config --global pull.rebase true
}



create_sym_links() {
  echo "> Creating symlinks for dotfiles"
  ln -s -f $script_dir/dots/.zshrc $HOME/.zshrc
  ln -s -f $script_dir/dots/.tmux.conf $HOME/.tmux.conf
  ln -s -f $script_dir/dots/.xprofile $HOME/.xprofile
  ln -s -f $script_dir/dots/.xprofile $HOME/.profile
  ln -s -f $script_dir/dots/.local/share/Konsole/Rami.profile $HOME/.local/share/konsole/rami.profile


  echo "> Creating symlinks for bin scripts"
  ln -s -f $script_dir/bin/i3-lock.sh $HOME/dev/bin/i3-lock.sh
  ln -s -f $script_dir/bin/rofi-logout.sh $HOME/dev/bin/rofi-logout.sh
  ln -s -f $script_dir/bin/screenshot-area.sh $HOME/dev/bin/screenshot-area.sh
  ln -s -f $script_dir/bin/show-desktop.sh $HOME/dev/bin/show-desktop.sh
  ln -s -f $script_dir/bin/tmux-sessionizer.sh $HOME/.local/share/bin/tmux-sessionizer.sh

  echo "> Creating symlinks for config files"
  ln -s -f $script_dir/.config/Code $HOME/.config/Code
  ln -s -f $script_dir/.config/alacritty $HOME/.config/alacritty
  ln -s -f $script_dir/.config/i3 $HOME/.config/i3
  ln -s -f $script_dir/.config/i3status $HOME/.config/i3status
  ln -s -f $script_dir/.config/nvim $HOME/.config/nvim
}

create_dirs
update_system
install_apt_pkgs
install_external
create_sym_links
# setup_git
