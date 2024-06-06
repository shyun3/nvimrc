local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  group = myAutoGroup,
  desc = "Save when leaving buffer",
  nested = true,
  command = "update",
})

vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
  {
    group = myAutoGroup,
    desc = "Trigger `autoread` when files changes on disk",
    callback = function()
      if
        string.find("cr!t", vim.fn.mode()) and vim.fn.getcmdwintype() == ""
      then
        vim.cmd.checktime()
      end
    end,
  }
)
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = myAutoGroup,
  desc = "Notification after file change",
  callback = function()
    vim.api.nvim_echo(
      { { "File changed on disk. Buffer reloaded.", "WarningMsg" } },
      false,
      {}
    )
  end,
})

vim.api.nvim_create_autocmd("CompleteDone", {
  group = myAutoGroup,
  desc = "Close preview window on insert mode done",
  callback = function()
    if vim.fn.pumvisible() == 0 then vim.cmd.pclose() end
  end,
})

-- See https://github.com/ibhagwan/nvim-lua/blob/main/lua/autocmd.lua
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "InsertLeave" }, {
  group = myAutoGroup,
  desc = "Enable cursorline for active window",
  callback = function()
    if not vim.o.cursorline and not vim.o.previewwindow then
      vim.opt_local.cursorline = true
    end
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "InsertEnter" }, {
  group = myAutoGroup,
  desc = "Disable cursorline for active window",
  callback = function()
    if vim.o.cursorline and not vim.o.previewwindow then
      vim.opt_local.cursorline = false
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = myAutoGroup,
  desc = "Highlight on yank",
  callback = function() vim.highlight.on_yank() end,
})
