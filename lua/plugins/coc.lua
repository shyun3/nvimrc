-- Derived from https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
local function completion_confirm()
  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#pum#confirm"]()
  else
    -- For some reason, calling the Lua function directly inserts a bunch of
    -- noise unless the mapping is created using `vim.api.nvim_set_keymap`.
    -- There isn't supposed to be any difference from `vim.keymap.set` though.
    return "<Cmd>call feedkeys(v:lua.require('nvim-autopairs').autopairs_cr(), 'in')<CR>"
  end
end

return {
  "neoclide/coc.nvim",
  dependencies = { "tpope/vim-endwise", "windwp/nvim-autopairs" },
  build = "npm ci",

  init = function()
    vim.g.coc_global_extensions = {
      "coc-clangd",
      "coc-json",
      "coc-lua",
      "coc-pyright",
      "coc-vimlsp",
      "coc-markdown-preview-enhanced",
      "coc-sh",
      "coc-snippets",
      "coc-webview",

      -- From coc-sources
      "coc-syntax",
      "coc-tag",
    }

    vim.g.coc_quickfix_open_command = "botright copen"
  end,

  config = function()
    local myCocGroup = vim.api.nvim_create_augroup("myCocGroup", {})
    vim.api.nvim_create_autocmd("User", {
      group = myCocGroup,
      desc = "Update signature help on jump placeholder",
      pattern = "CocJumpPlaceholder",
      callback = function() vim.fn.CocActionAsync("showSignatureHelp") end,
    })

    vim.api.nvim_set_hl(0, "CocSemTypeVariable", { fg = "fg" })

    vim.cmd.highlight("link CocSemTypeMacro Macro")
    vim.cmd.highlight("link CocSemTypeEnumMember Constant")
    vim.cmd.highlight("link CocSemTypeKeyword NONE")
    vim.cmd.highlight("link CocSemTypeNamespace NONE")
    vim.cmd.highlight("link CocSemTypeParameter NONE")

    -- For Python function parameter type hints
    vim.cmd.highlight("link CocSemTypeTypeParameter NONE")

    -- Taken from coc.vim
    vim.cmd.highlight("CocMenuSel ctermbg=237 guibg=#13354A")
  end,

  keys = {
    {
      "<Tab>",
      function()
        return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#next"](1)
          or "<Tab>"
      end,
      mode = "i",
      desc = "Next completion option",
      silent = true,
      expr = true,
    },
    {
      "<S-Tab>",
      function()
        return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#prev"](1)
          or "<C-h>"
      end,
      mode = "i",
      desc = "Previous completion option",
      silent = true,
      expr = true,
    },
    {
      "<C-Space>",
      "coc#refresh()",
      mode = "i",
      silent = true,
      expr = true,
    },
    {
      "<CR>",
      function()
        return completion_confirm() .. "<C-r>=EndwiseDiscretionary()<CR>"
      end,
      mode = "i",
      desc = "Auto-select the first completion item",
      silent = true,
      expr = true,
    },

    { "<Leader>]", "<Plug>(coc-definition)" },
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

    { "[g", "<Plug>(coc-diagnostic-prev)" },
    { "]g", "<Plug>(coc-diagnostic-next)" },
    { "<Leader>gd", "<Cmd>CocDiagnostics<CR>" },

    {
      "K",
      function()
        if vim.fn.CocAction("hasProvider", "hover") then
          vim.fn.CocActionAsync("doHover")
        else
          vim.fn.feedkeys("K", "in")
        end
      end,
      desc = "Hover",
    },

    { "<Leader>ll", "<Cmd>CocList<CR>" },
    { "<Leader>lc", "<Cmd>CocList commands<CR>" },

    { "<Leader>ca", "<Plug>(coc-codeaction)", silent = true },
    { "<Leader>cx", "<Plug>(coc-fix-current)" },
    { "<Leader>rn", "<Plug>(coc-rename)" },

    {
      "<Leader>ch",
      "<Cmd>CocCommand document.toggleInlayHint<CR>",
    },

    {
      "<C-f>",
      function()
        return vim.fn["coc#float#has_scroll"]() == 1
            and vim.fn["coc#float#scroll"](1)
          or "<C-f>"
      end,
      mode = { "n", "v" },
      desc = "coc: Scroll floating window forward",
      silent = true,
      nowait = true,
      expr = true,
    },
    {
      "<C-b>",
      function()
        return vim.fn["coc#float#has_scroll"]() == 1
            and vim.fn["coc#float#scroll"](0)
          or "<C-b>"
      end,
      mode = { "n", "v" },
      desc = "coc: Scroll floating window backward",
      silent = true,
      nowait = true,
      expr = true,
    },
    {
      "<C-f>",
      function()
        return vim.fn["coc#float#has_scroll"]() == 1
            and "<C-r>=coc#float#scroll(1)<CR>"
          or "<Right>"
      end,
      mode = "i",
      desc = "coc: Scroll floating window forward",
      silent = true,
      nowait = true,
      expr = true,
    },
    {
      "<C-b>",
      function()
        return vim.fn["coc#float#has_scroll"]() == 1
            and "<C-r>=coc#float#scroll(0)<CR>"
          or "<Left>"
      end,
      mode = "i",
      desc = "coc: Scroll floating window backward",
      silent = true,
      nowait = true,
      expr = true,
    },
  },
}
