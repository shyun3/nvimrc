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

  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
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

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
