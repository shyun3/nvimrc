return {
  {
    "tpope/vim-endwise",

    init = function()
      -- The plugin automatically wraps any existing <CR> mapping to insert the
      -- endwise pair at the end, but this doesn't seem to be silent. So, the
      -- mapping is disabled.
      vim.g.endwise_no_mappings = 1
    end,

    event = "InsertEnter",
  },

  "tpope/vim-fugitive",
  "tpope/vim-projectionist",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-vinegar",
}
