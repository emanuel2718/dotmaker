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
  use 'kdheepak/lazygit.nvim'
  use 'terrortylor/nvim-comment'
  use 'rafamadriz/friendly-snippets'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
  use 'sbdchd/neoformat'
  use 'mhartington/formatter.nvim'
  use {
    "ur4ltz/surround.nvim",
    config = function()
        require"surround".setup {mappings_style = "surround"}
    end
  }

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

  use { "nvim-telescope/telescope-file-browser.nvim" }

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

  -- use_rocks {'lunajson'}

  -- themes
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  use 'ellisonleao/gruvbox.nvim'


  -- experimental
  use "github/copilot.vim"

end)
