return {
  "amiorin/vim-project",

  config = function()
    vim.fn["project#rc"]()
    vim.cmd.source(vim.fn.stdpath("config") .. "/projects.vim")

    -- Derived from project.vim
    if vim.fn.argc(-1) == 0 and vim.fn.line2byte("$") == -1 then
      vim.cmd.Welcome()
    end
  end,
}
