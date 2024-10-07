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

  { "numToStr/Comment.nvim", opts = {} },
  { "vim-scripts/DoxygenToolkit.vim", cmd = "Dox" },

  {
    "sjl/gundo.vim",
    init = function() vim.g.gundo_prefer_python3 = 1 end,
    keys = { { "<F5>", "<Cmd>GundoToggle<CR>" } },
  },

  {
    "preservim/nerdtree",
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

  { "shyun3/vim-cmake-lists", ft = "cmake" },

  {
    "kkoomen/vim-doge",
    build = function() vim.fn["doge#install"]() end,

    init = function()
      vim.g.doge_doc_standard_python = "google"
      vim.g.doge_comment_jump_modes = { "n", "s" }
    end,

    keys = "<Leader>d",
  },

  {
    "ryanoasis/vim-devicons",

    -- According to installation instructions, icons should be loaded after
    -- these other plugins
    dependencies = { "preservim/nerdtree", "vim-airline/vim-airline" },

    -- Note: Loading icons at startup may cause it to improperly
    -- initialize intermittently. Consequences include brackets appearing
    -- around Nerd Tree icons.
    event = "UIEnter",
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
    lazy = true, -- See airline
    init = function() vim.g.gutentags_define_advanced_commands = 1 end,
  },

  { "jeetsukumaran/vim-pythonsense", ft = "python" },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "chaoren/vim-wordmotion",
    init = function() vim.g.wordmotion_nomap = 1 end,

    keys = {
      { "<Leader>w", "<Plug>WordMotion_w", mode = "" },
      { "<Leader>e", "<Plug>WordMotion_e", mode = "" },
      { "<Leader>b", "<Plug>WordMotion_b", mode = "" },
      { "<Leader>ge", "<Plug>WordMotion_ge", mode = "" },

      { "i<Leader>w", "<Plug>WordMotion_iw", mode = { "o", "v" } },
      { "a<Leader>w", "<Plug>WordMotion_aw", mode = { "o", "v" } },
    },
  },
}
