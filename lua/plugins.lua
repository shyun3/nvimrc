return {
  -- the colorscheme should be available when starting Neovim
  {
    "shyun3/molokai",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme molokai]])

      -- See `:h treesitter-highlight-groups`
      vim.cmd.highlight("link @variable NONE")
      vim.cmd.highlight("link @variable.parameter NONE")
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
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown",
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "norcalli/nvim-colorizer.lua",

    init = function()
      -- 'termguicolors' is auto-detected as of nvim 0.10, but the plugin
      -- requires the option to be set. It could be loaded later to wait for
      -- the auto-detect, e.g. at VeryLazy, but that may result in a visual
      -- glitch at startup. See issue #96.
      vim.o.termguicolors = true
    end,

    config = function()
      require("colorizer").setup({ "*" }, { RGB = false, names = false })
    end,
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

  {
    "SirVer/ultisnips",
    init = function()
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "UltiSnips/specific" }
    end,
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

    init = function()
      -- enable folder/directory glyph flag
      vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1

      -- enable open and close folder/directory glyph flags
      vim.g.DevIconsEnableFoldersOpenClose = 1

      -- enable file extension pattern matching glyphs on folder/directory
      vim.g.DevIconsEnableFolderExtensionPatternMatching = 1
    end,

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
