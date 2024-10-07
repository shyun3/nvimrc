return {
  -- the colorscheme should be available when starting Neovim
  {
    "tomasr/molokai",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme molokai]])
    end,
  },

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
    "preservim/nerdtree",
    dependencies = { "ryanoasis/vim-devicons" },
    init = function() vim.g.NERDTreeHijackNetrw = 0 end,

    keys = {
      { "<C-n>", "<Cmd>NERDTreeFocus<CR>" },
      { "<A-n>", "<Cmd>NERDTreeFind<CR>" },
      { "<Leader>n", "<Cmd>NERDTree<CR>" },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup({ "*" }, { names = false }) end,
  },

  { "davidgranstrom/nvim-markdown-preview", ft = "markdown" },
  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "yssl/QFEnter",
    init = function()
      vim.g.qfenter_keymap = { vopen = { "<C-v>" }, hopen = { "<C-s>" } }
    end,

    ft = "qf",
  },

  {
    "majutsushi/tagbar",
    init = function()
      vim.g.tagbar_autofocus = 1 -- Move to Tagbar window when opened
      vim.g.tagbar_sort = 0
    end,

    keys = { { "<A-t>", "<Cmd>TagbarToggle<CR>" } },
  },

  {
    "haya14busa/vim-asterisk",
    init = function() vim.g["asterisk#keeppos"] = 1 end,
  },

  "shyun3/vim-cmake-lists",

  {
    "kkoomen/vim-doge",
    build = function() vim.fn["doge#install"]() end,

    init = function()
      vim.g.doge_doc_standard_python = "google"
      vim.g.doge_comment_jump_modes = { "n", "s" }
    end,
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

  {
    "ludovicchabant/vim-gutentags",
    init = function() vim.g.gutentags_define_advanced_commands = 1 end,
  },

  "jeetsukumaran/vim-pythonsense",

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
