return {
  -- GUI
  {
    -- the colorscheme should be available when starting Neovim
    "tomasr/molokai",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme molokai]])
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup({ "*" }, { names = false }) end,
  },

  -- General
  { "vim-scripts/DoxygenToolkit.vim", cmd = "Dox" },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "sjl/gundo.vim",
    init = function() vim.g.gundo_prefer_python3 = 1 end,
    keys = { { "<F5>", "<Cmd>GundoToggle<CR>" } },
  },
  {
    "scrooloose/nerdtree",
    init = function() vim.g.NERDTreeHijackNetrw = 0 end,
    keys = {
      { "<C-n>", "<Cmd>NERDTreeFocus<CR>" },
      { "<A-n>", "<Cmd>NERDTreeFind<CR>" },
      { "<Leader>n", "<Cmd>NERDTree<CR>" },
    },
  },
  { "davidgranstrom/nvim-markdown-preview", cmd = "MarkdownPreview" },
  {
    "yssl/QFEnter",
    init = function()
      vim.g.qfenter_keymap = { vopen = { "<C-v>" }, hopen = { "<C-s>" } }
    end,
    ft = "qf",
  },
  {
    "voldikss/vim-floaterm",
    keys = {
      {
        "<Leader>lg",
        "<Cmd>FloatermNew --height=0.9 --width=0.9 --title=lazygit lazygit<CR>",
      },
    },
  },
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-vinegar",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Text objects
  "wellle/targets.vim",
  { "glts/vim-textobj-comment", dependencies = { "kana/vim-textobj-user" } },
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
  { "kana/vim-textobj-indent", dependencies = { "kana/vim-textobj-user" } },
}
