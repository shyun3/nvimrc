return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },

    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server_name) require("lspconfig")[server_name].setup({}) end,

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
