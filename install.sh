# Make the screenshot folder
mkdir -p ~/Documents/Screenshots
defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer

# Make needed folders
mkdir -p ~/git
mkdir -p ~/git/oss

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> $HOME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


ssh-keygen -t ed25519 -C "your_email@example.com"

eval "$(ssh-agent -s)"
touch ~/.ssh/config
open ~/.ssh/config

# add to config
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519

# setup git
git config --global core.editor "vim"
git config --global init.defaultBranch master
git config --global --add --bool push.autoSetupRemote true
git config --global core.excludesfile ~/.gitignore
git config --global user.name "emanuel2718"
git config --global user.email "eramirez2718@gmail.com"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"



# BREW
brew install htop
brew install btop
brew install uv
brew install cmake
brew install coreutils
brew install tmux
brew install ripgrep
brew install direnv
brew install ffmpeg
brew install wget
brew install jq
brew install neofetch
brew install node
brew install nvm
brew install stats
brew install jordanbaird-ice
brew install zoxide
brew install tree
brew install fzf
brew install libvirt
brew install virt-manager
brew install qemu
brew install httpie
brew install ninja
brew install cmake
brew install gettext
brew install curl
brew install pnpm
brew install oven-sh/bun/bun
brew install lazygit



# Probably will be a good idea to install them like this
# brew install --cask \
#   raycast \
#   google-chrome  \

# casks
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask karabiner-elements
brew install --cask obsidian
brew install --cask zotero
brew install --cask cursor
brew install --cask google-chrome
brew install --cask raycast
brew install --cask google-drive
brew install --cask vlc
brew install --cask spotify
brew install --cask discord
brew install --cask ghostty
brew install --cask appcleaner
brew install --cask transmission
brew install --cask chatgpt
brew install --cask bettertouchtool
brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask focusrite-control
brew install --cask screenflow
brew install --cask whatsapp
brew install --cask bruno
brew install --cask zed
brew install --cask discord
brew install --cask brave-browser



# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# All of this must come after the brew installs
brew install uv
uv python install 3.12

# install nvm
brew install node


# install nvim from source
cd ~/git/oss
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install



# Symlink files
ln -s -f ~/git/dotmaker/.gitignore $HOME/.gitignore
ln -s -f ~/git/dotmaker/dots/.vimrc $HOME/.vimrc
ln -s -f ~/git/dotmaker/dots/.zshrc $HOME/.zshrc
ln -s -f ~/git/dotmaker/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s -f ~/git/dotmaker/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s -f ~/git/dotmaker/.config/ghostty/config $HOME/.config/ghostty/config




