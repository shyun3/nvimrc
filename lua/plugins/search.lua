return {
  "inside/vim-search-pulse",

  dependencies = {
    {
      "haya14busa/vim-asterisk",
      init = function() vim.g["asterisk#keeppos"] = 1 end,
    },
  },

  init = function()
    vim.g.vim_search_pulse_mode = "pattern"
    vim.g.vim_search_pulse_disable_auto_mappings = 1
  end,

  keys = {
    { "*", "<Plug>(asterisk-*)<Plug>Pulse", mode = "" },
    { "#", "<Plug>(asterisk-#)<Plug>Pulse", mode = "" },
    { "g*", "<Plug>(asterisk-g*)<Plug>Pulse", mode = "" },
    { "g#", "<Plug>(asterisk-g#)<Plug>Pulse", mode = "" },
    { "z*", "<Plug>(asterisk-z*)<Plug>Pulse", mode = "" },
    { "gz*", "<Plug>(asterisk-gz*)<Plug>Pulse", mode = "" },
    { "z#", "<Plug>(asterisk-z#)<Plug>Pulse", mode = "" },
    { "gz#", "<Plug>(asterisk-gz#)<Plug>Pulse", mode = "" },

    { "n", "n<Plug>Pulse" },
    { "N", "N<Plug>Pulse" },

    {
      "<Enter>",
      "search_pulse#PulseFirst()",
      mode = "c",
      silent = true,
      expr = true,
    },
  },
}
