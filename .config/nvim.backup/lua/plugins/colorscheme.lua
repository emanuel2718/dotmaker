return {
  -- Carbonfox
  { "EdenEast/nightfox.nvim" },
  {
    "kvrohit/mellow.nvim",
    config = function()
      vim.g.mellow_italic_comments = false
    end
  },
  {
    'kvrohit/substrata.nvim',
    config = function()
      vim.g.substrata_italic_comment = false
    end
  },
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "main",
    priority = 1000,
  },
  -- Sublime text monokai
  { 'ofirgall/ofirkai.nvim' },
  { "kyazdani42/blue-moon" },
  { 'rockerBOO/boo-colorscheme-nvim' },
  { "rafamadriz/neon" },
  { 'kdheepak/monochrome.nvim' },
  { 'sainnhe/gruvbox-material' },
  { 'lourenci/github-colors' },
}
