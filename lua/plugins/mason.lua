return {
  {
    "williamboman/mason.nvim",

    -- PATH should be updated early
    priority = 100,

    config = true,
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },

    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },

    opts = { ensure_installed = { "clangd" }, automatic_installation = true },
  },
}
