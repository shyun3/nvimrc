vim.api.nvim_create_user_command("CheckHighlightUnderCursor", function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local mode = "name"

  -- Highest highlighting group: name of syntax keyword, match or region
  local hi = vim.fn.synIDattr(vim.fn.synID(line, col, 1), mode)

  -- For transparent groups, the group it's in
  local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), mode)

  -- Lowest group: basic highlighting spec such as a default highlighting group
  local lo =
    vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 1)), mode)

  print(string.format("hi<%s> trans<%s> lo<%s>", hi, trans, lo))
  if
    vim.fn.exists("*CocHasProvider") and vim.fn.CocHasProvider("semanticTokens")
  then
    vim.cmd.CocCommand("semanticTokens.inspect")
  end
end, {})
