return {
  {
    "tpope/vim-endwise",
    lazy = true, -- See coc
    init = function() vim.g.endwise_no_mappings = 1 end,
  },

  {
    "tpope/vim-fugitive",
    lazy = true, -- See airline
  },

  "tpope/vim-projectionist",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-vinegar",
}
