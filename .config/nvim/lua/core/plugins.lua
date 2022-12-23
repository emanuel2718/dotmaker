return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


    ------------- Telescope -------------
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    ------------- LSP -------------
    use {
        'neovim/nvim-lspconfig',
        requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- status update for lsp
        'j-hui/fidget.nvim',

        'folke/neodev.nvim',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        },
    }
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'


    ------------- Treesitter -------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        after = 'nvim-treesitter',
    }
    use 'nvim-treesitter/playground'


    ------------- Git -------------
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' } -- neogit
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'
    -- use 'kdheepak/lazygit.nvim'

    ------------- Copilot -------------
    use("github/copilot.vim")


    ------------- Autopairs -------------
    use 'windwp/nvim-autopairs'


    ------------- Dev Icons -------------
    use "kyazdani42/nvim-web-devicons"

    ------------- Nvim Tree -------------
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    }

    ------------- Lualine -------------
    use {
        'hoob3rt/lualine.nvim',
        requires = {
          'kyazdani42/nvim-web-devicons',
          opt = true
        }
    }

    ------------- Comment -------------
    use 'numToStr/Comment.nvim'


    ------------- Undotree -------------
    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }

    ------------- Formatter -------------
    use 'mhartington/formatter.nvim'



    ------------- Scratch Window -------------
    use 'mtth/scratch.vim'

    ------------- Themes -------------
    use 'savq/melange'
    -- use 'folke/tokyonight.nvim'
    use 'marko-cerovac/material.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'jacoborus/tender.vim'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
    use "rebelot/kanagawa.nvim"
    use 'sainnhe/gruvbox-material'
    use 'bluz71/vim-nightfly-colors'
    use 'tomasiser/vim-code-dark'
    use 'tanvirtin/monokai.nvim'
    use 'meain/hima-vim'
    use({ 'projekt0n/github-nvim-theme' })
    use "lewpoly/sherbet.nvim"




    ------------- Experimental -------------
    use 'tpope/vim-sleuth' -- detect tabstop and shiftwidth
    use 'nanotee/zoxide.vim'
    use 'folke/zen-mode.nvim'


    -- Custom plugins
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
      plugins(use)
    end

    -- Source and re-compile Packer on save of init.lua
    local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'source <afile> | PackerCompile',
        group = packer_group,
        pattern = vim.fn.expand '$MYVIMRC',
    })




end)