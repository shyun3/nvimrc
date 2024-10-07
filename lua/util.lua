local M = {}

-- Derived from ctrlp#normcmd()
function M.go_to_editable_window()
  local invalidBufTypes = { "quickfix", "help", "nofile", "terminal" }
  if not vim.tbl_contains(invalidBufTypes, vim.bo.buftype) then return end

  local editWins = vim.tbl_filter(
    function(winNum)
      local buf = vim.fn.winbufnr(winNum)
      return not vim.list_contains(invalidBufTypes, vim.bo[buf].buftype)
    end,
    vim.tbl_map(vim.api.nvim_win_get_number, vim.api.nvim_tabpage_list_wins(0))
  )
  for _, winNum in ipairs(editWins) do
    local bufNum = vim.fn.winbufnr(winNum)
    if vim.fn.bufname(bufNum) == "" and vim.bo[bufNum].filetype == "" then
      tmpWin = winNum
      break
    end
  end

  local cwd = vim.fn.getcwd()
  if #editWins > 0 then
    if not vim.list_contains(editWins, vim.fn.winnr()) then
      vim.cmd((tmpWin or editWins[1]) .. "wincmd w")
    end
  else
    vim.cmd.botright("vnew")
  end

  vim.cmd.lcd(cwd)
end

return M