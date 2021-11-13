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



--local execute = vim.api.nvim_command
--local fn = vim.fn
--
--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--
--if fn.empty(fn.glob(install_path)) > 0 then
--  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--  execute 'packadd packer.nvim'
--end
--
--return require('packer').startup(function()
--  -- Packer can manage itself as an optional plugin
--  use { 'wbthomason/packer.nvim' }
--  --use { 'neovim/nvim-lspconfig' }
--  --use { 'tamago324/nlsp-settings.nvim' }
--  --use { 'jose-elias-alvarez/null-ls.nvim' }
--  --use { 'kabouzeid/nvim-lspinstall' }
--  --use { 'onsails/lspkind-nvim' }
--
--  ---- Nice syntax
--  --use { 'sheerun/vim-polyglot' }
--
--  ---- Markdown preview
--  --use { 'iamcco/markdown-preview.nvim'}
--
--  ---- Colors
--  --use { 'lilydjwg/colorizer' }
--
--  ---- Telescope
--  --use { 'nvim-lua/plenary.nvim' }
--  --use { 'nvim-telescope/telescope.nvim' }
--  --use { 'nvim-telescope/telescope-fzy-native.nvim' }
--
--  ---- Completion & Snippets
--  --use { 'hrsh7th/nvim-compe' }
--
--  --use { 'SirVer/UltiSnips' }
--  --use { 'honza/vim-snippets' }
--  --use { 'gillescastel/latex-snippets' }
--
--  ---- Distraction free
--  --use { 'junegunn/goyo.vim' }
--
--
--  ---- Auto pairs
--  --use { 'windwp/nvim-autopairs' }
--
--  ---- NvimTree
--  --use { 'kyazdani42/nvim-tree.lua' }
--
--  ---- Colorscheme
--  --use { 'dylanaraps/wal.vim' }
--  --use { 'ulwlu/elly.vim' }
--  --use { 'mangeshrex/uwu.vim' }
--  --use { 'navarasu/onedark.nvim' }
--
--  ---- Whichkey
--  --use { 'folke/which-key.nvim' }
--
--  ---- Comments
--  ----use { 'terrortylor/nvim-comment' }
--
--  ---- Icons
--  --use { 'kyazdani42/nvim-web-devicons' }
--
--  ---- Status Line
--  use { 'vim-airline/vim-airline' }
--
--  ---- Dashboard
--  --use { 'glepnir/dashboard-nvim' }
--
--  ---- Terminal
--  --use { 'voldikss/vim-floaterm' }
--
--  ---- Nice for lua development
--  --use { 'folke/lua-dev.nvim' }
--
--  ---- Shows us any errors
--  --use { 'folke/trouble.nvim' }
--
--  ---- Shows an outline with symbols
--  --use { 'simrat39/symbols-outline.nvim' }
--
--  ---- Cooler wildmenu
--  --use { 'gelguy/wilder.nvim' }
--
--  ---- Lazy stuff
--  --use { 'kdheepak/lazygit.nvim' }
--
--  ---- Git signs
--  --use { 'airblade/vim-gitgutter' }
--  --use { 'tpope/vim-fugitive' }
--  --use { 'tpope/vim-rhubarb' }
--
--  ---- Nice multi cursors
--  --use { 'terryma/vim-multiple-cursors' }
--
--  ---- For latex
--  --use { 'lervag/vimtex' }
--  --use { 'KeitaNakamura/tex-conceal.vim' }
--
--  ---- Translator
--  --use { 'voldikss/vim-translator' }
--
--  ---- Easy tables
--  --use { 'dhruvasagar/vim-table-mode' }
--
--  ---- Quick navigation
--  --use { 'easymotion/vim-easymotion' }
--
--  ---- Minimap
--  --use { 'rinx/nvim-minimap' }
--
--  ---- Scrollbar
--  --use { 'Xuyuanp/scrollbar.nvim' }
--
--  ---- Highlight other words
--  --use { 'RRethy/vim-illuminate' }
--end)
