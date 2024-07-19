-- Derived from https://github.com/ray-x/lsp_signature.nvim/issues/228#issuecomment-1712704798
local function scroll_sig(map)
  local winnr = _G._LSP_SIG_CFG.winnr
  local float_open = winnr and winnr ~= 0 and vim.api.nvim_win_is_valid(winnr)
  if float_open then vim.fn.win_execute(winnr, ":normal! " .. map) end
end

return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my_lsp", {}),
        callback = function()
          -- Derived from `:h lsp-defaults-disable`
          vim.bo.tagfunc = ""
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            -- Derived from `:h vim.lsp.semantic_tokens.start()`
            on_attach = function(client)
              client.server_capabilities.semanticTokensProvider = nil
            end,
          })
        end,
      })
    end,

    keys = {
      { "<Leader>rr", vim.lsp.buf.references, desc = "LSP: References" },
      {
        "<Leader>ri",
        vim.lsp.buf.incoming_calls,
        desc = "LSP: Incoming calls",
      },
      {
        "<Leader>ro",
        vim.lsp.buf.outgoing_calls,
        desc = "LSP: Outgoing calls",
      },

      {
        "<Leader>gd",
        function()
          local diag = vim.diagnostic.get(0)
          local qf = vim.diagnostic.toqflist(diag)
          vim.fn.setqflist(qf)
          vim.cmd("botright copen")
        end,
        desc = "LSP: Buffer diagnostics",
      },

      { "<Leader>ca", vim.lsp.buf.code_action, desc = "LSP: Code action" },
      { "<Leader>rn", vim.lsp.buf.rename, desc = "LSP: Rename" },

      {
        "<Leader>ch",
        function()
          ---@diagnostic disable-next-line: missing-parameter
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        desc = "LSP: Toggle inlay hints",
      },
    },
  },

  {
    "folke/lazydev.nvim",
    dependencies = { "Bilal2453/luvit-meta" },
    ft = "lua",

    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  { "j-hui/fidget.nvim", opts = {} },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",

    opts = {
      toggle_key = "<A-x>",

      hint_enable = false,
    },

    keys = {
      {
        "<Leader>k",
        function() require("lsp_signature").toggle_float_win() end,
        desc = "LSP: Toggle signature",
      },

      {
        -- The `select_signature_key` option doesn't seem to apply in
        -- visual/select mode
        "<A-n>",
        function()
          require("lsp_signature").signature({ trigger = "NextSignature" })
        end,
        mode = { "i", "v" },
        desc = "LSP: Select next signature",
      },
      {
        -- The `move_cursor_key` option doesn't seem to apply in
        -- visual/select mode
        "<A-p>",
        function() require("lsp_signature.helper").change_focus() end,
        mode = { "i", "v" },
        desc = "LSP: Jump to signature window",
      },

      {
        "<A-u>",
        function()
          local code = require("util").replace_termcodes("<C-u>")
          scroll_sig(code)
        end,
        mode = { "i", "v" },
        desc = "LSP: Scroll signature up",
      },
      {
        "<A-d>",
        function()
          local code = require("util").replace_termcodes("<C-d>")
          scroll_sig(code)
        end,
        mode = { "i", "v" },
        desc = "LSP: Scroll signature down",
      },
    },
  },
}
