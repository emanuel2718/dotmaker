# Make the screenshot folder

mkdir -p ~/Documents/Screenshots
defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer

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
git config --global user.name "emanuel2718"
git config --global user.email "eramirez2718@gmail.com"


# BREW
brew install htop
brew install btop
brew install uv
brew install node
brew install nvm
brew install stats
brew install jordanbaird-ice
brew install zoxide

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


# All of this must come after the brew installs
brew install uv
uv python install 3.12

# install nvm
brew install node
