-- Created by Emanuel Ramirez on 09/02/2021

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'tamago324/nlsp-settings.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'onsails/lspkind-nvim'

  -- NERDTree
  --use "preservim/nerdtree"

  -- Status line
  use 'itchyny/lightline.vim'

  -- Auto pairs
  use 'windwp/nvim-autopairs'

  -- Colorschemes
  use 'dylanaraps/wal.vim'
  use 'ulwlu/elly.vim'
  use 'mangeshrex/uwu.vim'
  use 'navarasu/onedark.nvim'
  use 'morhetz/gruvbox'

  -- Fugitive
  use 'tpope/vim-fugitive'

  -- Lazy Git
  use 'kdheepak/lazygit.nvim'

  -- NvimTree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Markdown preview
  use 'iamcco/markdown-preview.nvim'

  -- Commentator
  --use 'scrooloose/nerdcommenter'
  use 'terrortylor/nvim-comment'

  -- Completion
  -- use 'hrsh7th/nvim-compe'
end)
