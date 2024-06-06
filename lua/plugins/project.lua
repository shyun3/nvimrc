return {
  {
    "amiorin/vim-project",
    config = function()
      vim.fn["project#rc"]()
      vim.cmd.source(vim.fn.stdpath("config") .. "/projects.vim")
      if vim.fn.argc(-1) == 0 then vim.cmd.Welcome() end
    end,
  },
}
