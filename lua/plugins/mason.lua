return {
  { "williamboman/mason.nvim", config = true },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },

    opts = {
      ensure_installed = {
        "black",
        "clang-format",
        "clangd",
        "isort",
        "prettier",
        "stylua",
      },
    },
  },
}
