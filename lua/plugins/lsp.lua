return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
    },

    config = function()
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
