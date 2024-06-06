--[=[

-- Plugins
vim.cmd.Plug(
  [['neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }]]
)
vim.cmd.Plug([['kevinhwang91/nvim-bqf']])
vim.cmd.Plug([['nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }]])
vim.cmd.Plug([['majutsushi/tagbar']])
vim.cmd.Plug([['vim-airline/vim-airline']])
vim.cmd.Plug([['vim-airline/vim-airline-themes']])
vim.cmd.Plug([['haya14busa/vim-asterisk']])
vim.cmd.Plug([['shyun3/vim-cmake-lists']])
vim.cmd.Plug([['kkoomen/vim-doge', { 'do': './scripts/install.sh' }]])
vim.cmd.Plug([['junegunn/vim-easy-align']])
vim.cmd.Plug([['ludovicchabant/vim-gutentags']])
vim.cmd.Plug([['jeetsukumaran/vim-pythonsense']])
vim.cmd.Plug([['inside/vim-search-pulse']])
vim.cmd.Plug([['chaoren/vim-wordmotion']])

-- Dependencies
vim.cmd.Plug([['nvim-lua/plenary.nvim']])

]=]

require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

-------------------------------------------------------------------------------
-- Variables

-- C
vim.g.c_gnu = 1
vim.g.c_no_curly_error = 1

-- Python
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python3"

-------------------------------------------------------------------------------
-- Mappings

-- List tags before jumping if more than one match
vim.keymap.set({ "n", "v" }, "<C-]>", "g<C-]>")

-- Open tags in splits
vim.keymap.set("n", "<A-]>s", "<Cmd>wincmd g<C-]><CR>")
vim.keymap.set("n", "<A-]>v", "<Cmd>vertical wincmd g<C-]><CR>")

-- Window navigation
vim.keymap.set("n", "]w", "<Cmd>wincmd w<CR>")
vim.keymap.set("n", "[w", "<Cmd>wincmd W<CR>")
vim.keymap.set("n", "<BS>", "<Cmd>wincmd p<CR>")
vim.keymap.set("n", "<Left>", "<Cmd>wincmd h<CR>")
vim.keymap.set("n", "<Down>", "<Cmd>wincmd j<CR>")
vim.keymap.set("n", "<Up>", "<Cmd>wincmd k<CR>")
vim.keymap.set("n", "<Right>", "<Cmd>wincmd l<CR>")
vim.keymap.set("n", "<A-c>", "<Cmd>wincmd c<CR>")
vim.keymap.set("n", "<A-o>", "<Cmd>wincmd o<CR>")
for i = 1, 9 do
  vim.keymap.set(
    "n",
    string.format("<A-%d>", i),
    string.format("<Cmd>%dwincmd w<CR>", i)
  )
end

-- Quickfix
vim.keymap.set("n", "<A-q>", "<Cmd>botright copen<CR>")
vim.keymap.set("n", "<Leader>q", "<Cmd>cclose<CR>")

-------------------------------------------------------------------------------
-- Autocommands
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
--[=[
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Plugin specific settings

-------------------------------------------------------------------------------
-- Airline
vim.g.airline_theme = "molokai"
vim.g.airline_powerline_fonts = 1

vim.g.airline_section_error =
  "%{airline#util#wrap(airline#extensions#coc#get_error(),0)}"
vim.g.airline_section_warning =
  "%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}"

vim.g["airline#extensions#whitespace#enabled"] = 0 -- Whitespace error detection
vim.g["airline#extensions#tagbar#enabled"] = 0

vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = "uniq_tail_or_proj"
vim.g["airline#extensions#tabline#fnamemod"] = ":t" -- Default tab name formatter
vim.g["airline#extensions#tabline#fnamecollapse"] = 0 -- Short parent names in tabs
vim.g["airline#extensions#tabline#tab_nr_type"] = 1
vim.g["airline#extensions#tabline#show_close_button"] = 0
vim.g["airline#extensions#tabline#show_splits"] = 0
vim.g["airline#extensions#tabline#show_buffers"] = 0
vim.g["airline#extensions#tabline#show_tab_type"] = 0

-------------------------------------------------------------------------------
-- Asterisk
vim.g["asterisk#keeppos"] = 1

-------------------------------------------------------------------------------
-- coc
vim.g.coc_global_extensions = {
  "coc-clangd",
  "coc-json",
  "coc-pyright",
  "coc-syntax",
  "coc-tag",
  "coc-vimlsp",
  "coc-pairs",
  "coc-sh",
  "coc-snippets",
}
vim.g.coc_quickfix_open_command = "botright copen"

vim.keymap.set(
  "i",
  "<Tab>",
  function()
    return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#next"](1)
      or "<Tab>"
  end,
  { desc = "Next completion option", silent = true, expr = true }
)
vim.keymap.set(
  "i",
  "<S-Tab>",
  function()
    return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#prev"](1)
      or "<C-h>"
  end,
  { desc = "Previous completion option", silent = true, expr = true }
)

vim.keymap.set(
  "i",
  "<C-Space>",
  "coc#refresh()",
  { silent = true, expr = true }
)

vim.keymap.set(
  "i",
  "<CR>",
  function()
    -- <C-g>u breaks current undo
    return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#confirm"]()
      or "<C-g>u<CR><C-r>=EndwiseDiscretionary()<CR>"
  end,
  { desc = "Auto-select the first completion item", silent = true, expr = true }
)

vim.keymap.set("n", "<Leader>]", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set(
  "n",
  "<Leader>v]",
  function() vim.fn.CocAction("jumpDefinition", "vsplit") end,
  { desc = "coc: Jump to definition, vertical split", silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>s]",
  function() vim.fn.CocAction("jumpDefinition", "split") end,
  { desc = "coc: Jump to definition, horizontal split", silent = true }
)

vim.keymap.set("n", "<Leader>[", "<Plug>(coc-declaration)", { silent = true })
vim.keymap.set(
  "n",
  "<Leader>v[",
  function() vim.fn.CocAction("jumpDeclaration", "vsplit") end,
  { desc = "coc: Jump to declaration, vertical split", silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>s[",
  function() vim.fn.CocAction("jumpDeclaration", "split") end,
  { desc = "coc: Jump to declaration, horizontal split", silent = true }
)

vim.keymap.set("n", "<Leader>rr", "<Plug>(coc-references)", { silent = true })
vim.keymap.set(
  "n",
  "<Leader>ri",
  function()
    local qf = {}
    for _, inCall in ipairs(vim.fn.CocAction("incomingCalls")) do
      local from = inCall.from

      local i, j = from.uri:find("file://")
      local absFile = from.uri:sub(i == 1 and j + 1 or 1)

      local range = from.range
      local rangeStart = range.start
      local rangeEnd = range["end"]

      local startLine = rangeStart.line + 1
      local endLine = rangeEnd.line + 1

      local startCol = rangeStart.character + 1
      local endCol = rangeEnd.character + 1

      local file = vim.fn.readfile(absFile, "", startLine)
      table.insert(
        qf,
        {
          filename = absFile,
          lnum = startLine,
          end_lnum = endLine,
          col = startCol,
          end_col = endCol,
          text = file[#file],
        }
      )
    end

    vim.fn.setqflist(qf)
    vim.cmd.FzfLua("quickfix")
  end,
  { desc = "coc: Populate quickfix list with incoming calls", silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>rti",
  function() vim.fn.CocAction("showIncomingCalls") end,
  { desc = "coc: Show incoming calls", silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>ro",
  function() vim.fn.CocAction("showOutgoingCalls") end,
  { desc = "coc: Show outgoing calls", silent = true }
)

vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
vim.keymap.set("n", "<Leader>gd", "<Cmd>CocDiagnostics<CR>")

vim.keymap.set("n", "K", function()
  if vim.fn.CocAction("hasProvider", "hover") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.fn.feedkeys("K", "in")
  end
end, { desc = "Hover", silent = true })

vim.keymap.set("n", "<Leader>ll", "<Cmd>CocList<CR>")
vim.keymap.set("n", "<Leader>lc", "<Cmd>CocList commands<CR>")

vim.keymap.set("n", "<Leader>ca", "<Plug>(coc-codeaction)", { silent = true })
vim.keymap.set("n", "<Leader>cx", "<Plug>(coc-fix-current)", { silent = true })
vim.keymap.set("n", "<Leader>rn", "<Plug>(coc-rename)", { silent = true })

vim.keymap.set(
  "n",
  "<Leader>ch",
  "<Cmd>CocCommand document.toggleInlayHint<CR>"
)

vim.keymap.set(
  { "n", "v" },
  "<C-f>",
  function()
    return vim.fn["coc#float#has_scroll"]() == 1
        and vim.fn["coc#float#scroll"](1)
      or "<C-f>"
  end,
  {
    desc = "coc: Scroll floating window forward",
    silent = true,
    nowait = true,
    expr = true,
  }
)
vim.keymap.set(
  { "n", "v" },
  "<C-b>",
  function()
    return vim.fn["coc#float#has_scroll"]() == 1
        and vim.fn["coc#float#scroll"](0)
      or "<C-b>"
  end,
  {
    desc = "coc: Scroll floating window backward",
    silent = true,
    nowait = true,
    expr = true,
  }
)
vim.keymap.set(
  "i",
  "<C-f>",
  function()
    return vim.fn["coc#float#has_scroll"]() == 1
        and "<C-r>=coc#float#scroll(1)<CR>"
      or "<Right>"
  end,
  {
    desc = "coc: Scroll floating window forward",
    silent = true,
    nowait = true,
    expr = true,
  }
)
vim.keymap.set(
  "i",
  "<C-b>",
  function()
    return vim.fn["coc#float#has_scroll"]() == 1
        and "<C-r>=coc#float#scroll(0)<CR>"
      or "<Left>"
  end,
  {
    desc = "coc: Scroll floating window backward",
    silent = true,
    nowait = true,
    expr = true,
  }
)

local myCocGroup = vim.api.nvim_create_augroup("myCocGroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = myCocGroup,
  desc = "Update signature help on jump placeholder",
  pattern = "CocJumpPlaceholder",
  callback = function() vim.fn.CocActionAsync("showSignatureHelp") end,
})

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

  vim.api.nvim_echo(
    { { string.format("hi<%s> trans<%s> lo<%s>", hi, trans, lo) } },
    false,
    {}
  )
  if vim.fn.CocHasProvider("semanticTokens") then
    vim.cmd.CocCommand("semanticTokens.inspect")
  end
end, {})

vim.cmd.highlight("link CocSemTypeMacro Macro")
vim.cmd.highlight("link CocSemTypeVariable NONE")
vim.cmd.highlight("link CocSemTypeEnumMember Constant")
vim.cmd.highlight("link CocSemTypeKeyword NONE")

-- For Python packages in import statement
vim.cmd.highlight("link CocSemTypeNamespace NONE")

vim.cmd.highlight("link CocSemTypeParameter NONE")

-- For Python function parameter type hints
vim.cmd.highlight("link CocSemTypeTypeParameter NONE")

-- Taken from coc.vim
vim.cmd.highlight("CocMenuSel ctermbg=237 guibg=#13354A")

-------------------------------------------------------------------------------
-- DoGe
vim.g.doge_doc_standard_python = "google"
vim.g.doge_comment_jump_modes = { "n", "s" }

-------------------------------------------------------------------------------
-- Gutentags
vim.g.gutentags_define_advanced_commands = 1

-------------------------------------------------------------------------------
-- nvim-bqf
require("bqf").setup({
  preview = {
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
        -- skip file size greater than 100k
        ret = false
      elseif bufname:match("^fugitive://") then
        -- skip fugitive buffer
        ret = false
      end
      return ret
    end,
  },
  func_map = {
    -- Other split mappings defined by QFEnter
    split = "<C-x><C-s>",
    vsplit = "<C-x><C-v>",
  },
})

-------------------------------------------------------------------------------
-- Pydocstring
vim.g.pydocstring_formatter = "google"
vim.g.pydocstring_enable_mapping = 0

-------------------------------------------------------------------------------
-- Search pulse
vim.g.vim_search_pulse_mode = "pattern"
vim.g.vim_search_pulse_disable_auto_mappings = 1

local asterisk_keys = { "*", "#", "g*", "g#", "z*", "gz*", "z#", "gz#" }
for _, key in ipairs(asterisk_keys) do
  vim.keymap.set("", key, string.format("<Plug>(asterisk-%s)<Plug>Pulse", key))
end

vim.keymap.set("n", "n", "n<Plug>Pulse")
vim.keymap.set("n", "N", "N<Plug>Pulse")

vim.keymap.set("c", "<Enter>", function()
  -- Derived from `search_pulse#PulseFirst`
  local cmd_type = vim.fn.getcmdtype()
  if vim.fn.state() ~= "o" and (cmd_type == "/" or cmd_type == "?") then
    return "<CR><Cmd>call search_pulse#Pulse()<CR>"
  else
    return "<CR>"
  end
end, { desc = "Pulse when searching", expr = true })

-------------------------------------------------------------------------------
-- treesitter
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,

    disable = function(lang, buf)
      if lang == "c" then return true end

      -- disable slow treesitter highlight for large files
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then return true end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

-------------------------------------------------------------------------------
-- Tagbar
vim.g.tagbar_autofocus = 1 -- Move to Tagbar window when opened
vim.g.tagbar_sort = 0

vim.keymap.set("n", "<A-t>", "<Cmd>TagbarToggle<CR>")

-------------------------------------------------------------------------------
-- wordmotion
vim.g.wordmotion_nomap = 1

local wordmotion_keys = { "w", "e", "b", "ge" }
for _, key in ipairs(wordmotion_keys) do
  vim.keymap.set("", "<Leader>" .. key, "<Plug>WordMotion_" .. key)
end

vim.keymap.set({ "o", "v" }, "i<Leader>w", "<Plug>WordMotion_iw")
vim.keymap.set({ "o", "v" }, "a<Leader>w", "<Plug>WordMotion_aw")
]=]
