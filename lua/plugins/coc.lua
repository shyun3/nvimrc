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
      "coc-tag",
    }

    vim.g.coc_quickfix_open_command = "botright copen"
  end,

  config = function()
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("myCocGroup", {}),
      desc = "Update signature help on jump placeholder",
      pattern = "CocJumpPlaceholder",
      callback = function() vim.fn.CocActionAsync("showSignatureHelp") end,
    })
  end,

  keys = {
    -- Requires 'textDocument.documentSymbol' support from the language server
    { "if", "<Plug>(coc-funcobj-i)", mode = { "x", "o" } },
    { "af", "<Plug>(coc-funcobj-a)", mode = { "x", "o" } },
    { "ik", "<Plug>(coc-classobj-i)", mode = { "x", "o" } },
    { "ak", "<Plug>(coc-classobj-a)", mode = { "x", "o" } },
  },
}
