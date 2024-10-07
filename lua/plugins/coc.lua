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
    {
      "<Leader>v]",
      function() vim.fn.CocAction("jumpDefinition", "vsplit") end,
      desc = "coc: Jump to definition, vertical split",
    },
    {
      "<Leader>s]",
      function() vim.fn.CocAction("jumpDefinition", "split") end,
      desc = "coc: Jump to definition, horizontal split",
    },

    { "<Leader>D", "<Plug>(coc-type-definition)" },
    {
      "<Leader>vD",
      function() vim.fn.CocAction("jumpTypeDefinition", "vsplit") end,
      desc = "coc: Jump to type definition, vertical split",
    },
    {
      "<Leader>sD",
      function() vim.fn.CocAction("jumpTypeDefinition", "split") end,
      desc = "coc: Jump to type definition, horizontal split",
    },

    { "<Leader>[", "<Plug>(coc-declaration)" },
    {
      "<Leader>v[",
      function() vim.fn.CocAction("jumpDeclaration", "vsplit") end,
      desc = "coc: Jump to declaration, vertical split",
    },
    {
      "<Leader>s[",
      function() vim.fn.CocAction("jumpDeclaration", "split") end,
      desc = "coc: Jump to declaration, horizontal split",
    },

    { "<Leader>ds", "<Cmd>CocList -A outline<CR>" },
    { "<Leader>ws", "<Cmd>CocList -I -A symbols<CR>" },

    { "<Leader>rr", "<Plug>(coc-references)" },
    {
      "<Leader>ri",
      function()
        local ok, calls = pcall(vim.fn.CocAction, "incomingCalls")
        if not ok then return end

        local qf = {}
        for _, inCall in ipairs(calls) do
          local from = inCall.from

          local i, j = from.uri:find("file://")
          local absFile = from.uri:sub(i == 1 and j + 1 or 1)

          local range = from.range
          local rangeStart = range.start
          local rangeEnd = range["end"]

          local startLine = rangeStart.line + 1
          local endLine = rangeEnd.line + 1

          local startCol = rangeStart.character + 1
          local endCol = rangeEnd.character + 1

          local file = vim.fn.readfile(absFile, "", startLine)
          table.insert(qf, {
            filename = absFile,
            lnum = startLine,
            end_lnum = endLine,
            col = startCol,
            end_col = endCol,
            text = file[#file],
          })
        end

        vim.fn.setqflist(qf)
        if not vim.tbl_isempty(qf) then vim.cmd.FzfLua("quickfix") end
      end,
      desc = "coc: Populate quickfix list with incoming calls",
    },
    {
      "<Leader>rti",
      function() vim.fn.CocAction("showIncomingCalls") end,
      desc = "coc: Show incoming calls",
    },
    {
      "<Leader>ro",
      function() vim.fn.CocAction("showOutgoingCalls") end,
      desc = "coc: Show outgoing calls",
    },

    { "<Leader>gd", "<Cmd>CocDiagnostics<CR>" },

    { "<Leader>ll", "<Cmd>CocList<CR>" },
    { "<Leader>lc", "<Cmd>CocList commands<CR>" },

    { "<Leader>ca", "<Plug>(coc-codeaction)", silent = true },
    { "<Leader>cx", "<Plug>(coc-fix-current)" },
    { "<Leader>rn", "<Plug>(coc-rename)" },

    {
      "<Leader>ch",
      "<Cmd>CocCommand document.toggleInlayHint<CR>",
    },

    -- Requires 'textDocument.documentSymbol' support from the language server
    { "if", "<Plug>(coc-funcobj-i)", mode = { "x", "o" } },
    { "af", "<Plug>(coc-funcobj-a)", mode = { "x", "o" } },
    { "ik", "<Plug>(coc-classobj-i)", mode = { "x", "o" } },
    { "ak", "<Plug>(coc-classobj-a)", mode = { "x", "o" } },
  },
}
