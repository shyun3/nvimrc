return {
  "neoclide/coc.nvim",
  enabled = false,
  build = "npm ci",

  init = function()
    vim.g.coc_global_extensions = {
      "coc-json",
      "coc-pyright",
      "coc-vimlsp",
      "coc-sh",

      -- From coc-sources
      "coc-syntax",
    }

    vim.g.coc_quickfix_open_command = "botright copen"
  end,
}
