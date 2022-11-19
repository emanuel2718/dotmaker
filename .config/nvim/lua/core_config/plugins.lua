return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'windwp/nvim-autopairs'


  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'mfussenegger/nvim-jdtls'
  use 'onsails/lspkind-nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'hrsh7th/vim-vsnip'
  use 'akinsho/nvim-toggleterm.lua'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  use 'stsewd/gx-extended.vim'
  use "kyazdani42/nvim-web-devicons"


  -- use 'kdheepak/lazygit.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'terrortylor/nvim-comment'
  use 'rafamadriz/friendly-snippets'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'sbdchd/neoformat'
  use 'mhartington/formatter.nvim'
  use { 'ojroques/nvim-bufdel' }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
    

  use 'nanotee/zoxide.vim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use { 'nvim-telescope/telescope-file-browser.nvim' }

  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

  -- use_rocks {'lunajson'}

  -- themes
  use 'savq/melange'
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'jacoborus/tender.vim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }


  -- experimental
  use 'github/copilot.vim'
  use {
    'jghauser/fold-cycle.nvim',
    config = function()
      require('fold-cycle').setup()
    end
  }
end)
