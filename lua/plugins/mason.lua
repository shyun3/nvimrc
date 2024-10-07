return {
  { "williamboman/mason.nvim", config = true },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },

    opts = { ensure_installed = { "clangd" } },
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },

    opts = {},
  },
}
