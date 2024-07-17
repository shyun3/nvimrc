return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
    },
    lazy = false,

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
}
