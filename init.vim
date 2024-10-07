lua << EOF
vimDir = vim.fn.stdpath('config')

-- lua: Covered by treesitter
-- sensible: Do not update vim settings
vim.g.polyglot_disabled = {'lua', 'sensible'}

vim.fn['plug#begin'](vimDir .. '/bundle')
EOF

" Plugin manager
Plug 'junegunn/vim-plug'

" GUI
Plug 'tomasr/molokai'
Plug 'norcalli/nvim-colorizer.lua'

" Plugins
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'numToStr/Comment.nvim'
Plug 'stevearc/conform.nvim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ibhagwan/fzf-lua'
Plug 'sjl/gundo.vim'
Plug 'phaazon/hop.nvim'
Plug 'scrooloose/nerdtree'
Plug 'kevinhwang91/nvim-bqf'
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yssl/QFEnter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/vim-asterisk'
Plug 'shyun3/vim-cmake-lists'
Plug 'ryanoasis/vim-devicons'
Plug 'kkoomen/vim-doge', { 'do': './scripts/install.sh' }
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'
Plug 'amiorin/vim-project'
Plug 'tpope/vim-projectionist'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'tpope/vim-repeat'
Plug 'inside/vim-search-pulse'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'chaoren/vim-wordmotion'
Plug 'folke/which-key.nvim'

" Dependencies
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'

" Text objects
Plug 'wellle/targets.vim'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'

lua << EOF
vim.fn['plug#end']()

-------------------------------------------------------------------------------
-- Options

-- Colors
vim.cmd.colorscheme('molokai')
vim.o.termguicolors = true

-- C indent options
vim.o.cinoptions =
  "g0" ..   -- Don't indent class scope declarations
  "N-s" ..  -- Don't indent namespaces
  "E-s"     -- Don't indent extern blocks

-- Casing
vim.o.ignorecase = true
vim.o.smartcase = true

-- Completions
vim.o.completeopt = "menu"
vim.o.pumheight = 10
vim.opt.wildmode = {"longest:full", "full"}

-- Display
vim.o.number = true   -- Line numbers
vim.o.colorcolumn = "80"
vim.opt.listchars = {tab = "» ", trail = "·", precedes = "◄", extends = "►"}
vim.o.list = true   -- Show invisible characters
vim.o.cursorline = true
vim.o.cmdheight = 2
vim.opt.shortmess:append("c")   -- Don't give completion menu messages
vim.o.signcolumn = "number"   -- Replace line number with diagnostic mark
vim.o.showmode = false    -- Mode is in status line

-- File settings
vim.o.autowriteall = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.writebackup = false
vim.opt.shada = {
  "'1000",  -- Max number of previously edited files whose marks are remembered
  "s1", -- Max size of item contents in kB
  "h"   -- Disable 'hlsearch' effect when loading shada file
}

-- Formatting
vim.o.wrap = false

-- Search
vim.o.maxmempattern = 5000

-- Tabs
vim.o.expandtab = true  -- Change tabs to spaces
vim.o.tabstop = 4
vim.o.softtabstop = vim.o.tabstop   -- Tab stop positions for spaces
vim.o.shiftwidth = vim.o.tabstop

-- Timing
vim.o.updatetime = 300

-- Windows
vim.o.splitright = true
vim.o.splitbelow = true

-------------------------------------------------------------------------------
-- Variables
vim.g.NERDTreeHijackNetrw = 0

-- vim-polyglot sets this variable, which prevents loading of `filetype.lua`
vim.g.did_load_filetypes = nil

-- C
vim.g.c_gnu = 1
vim.g.c_no_curly_error = 1

-- Python
vim.g.python3_host_prog = '~/.pyenv/versions/neovim/bin/python3'

-------------------------------------------------------------------------------
-- Mappings

-- List tags before jumping if more than one match
vim.keymap.set({'n', 'v'}, '<C-]>', 'g<C-]>')

-- Open tags in splits
vim.keymap.set('n', '<A-]>s', '<Cmd>wincmd g<C-]><CR>')
vim.keymap.set('n', '<A-]>v', '<Cmd>vertical wincmd g<C-]><CR>')

-- Window navigation
vim.keymap.set('n', ']w', '<Cmd>wincmd w<CR>')
vim.keymap.set('n', '[w', '<Cmd>wincmd W<CR>')
vim.keymap.set('n', '<BS>', '<Cmd>wincmd p<CR>')
vim.keymap.set('n', '<Left>', '<Cmd>wincmd h<CR>')
vim.keymap.set('n', '<Down>', '<Cmd>wincmd j<CR>')
vim.keymap.set('n', '<Up>', '<Cmd>wincmd k<CR>')
vim.keymap.set('n', '<Right>', '<Cmd>wincmd l<CR>')
vim.keymap.set('n', '<A-c>', '<Cmd>wincmd c<CR>')
vim.keymap.set('n', '<A-o>', '<Cmd>wincmd o<CR>')
for i = 1, 9 do
  vim.keymap.set('n', string.format("<A-%d>", i), string.format("<Cmd>%dwincmd w<CR>", i))
end

-- Quickfix
vim.keymap.set('n', '<A-q>', '<Cmd>botright copen<CR>')
vim.keymap.set('n', '<Leader>q', '<Cmd>cclose<CR>')

-------------------------------------------------------------------------------
-- Autocommands
local myAutoGroup = vim.api.nvim_create_augroup('myAutoGroup', {clear = true})

vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost'}, {
  group = myAutoGroup,
  desc = 'Save when leaving buffer',
  nested = true,
  command = 'update'
})

vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'},
  {
    group = myAutoGroup,
    desc = 'Trigger `autoread` when files changes on disk',
    callback = function()
      if string.find("cr!t", vim.fn.mode()) and vim.fn.getcmdwintype() == '' then
        vim.cmd.checktime()
      end
    end,
  })
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = myAutoGroup,
  desc = 'Notification after file change',
  callback = function()
    vim.api.nvim_echo({{'File changed on disk. Buffer reloaded.', 'WarningMsg'}}, false, {})
  end
})

vim.api.nvim_create_autocmd('CompleteDone', {
  group = myAutoGroup,
  desc = 'Close preview window on insert mode done',
  callback = function()
    if vim.fn.pumvisible() == 0 then vim.cmd.pclose() end
  end
})

-- See https://github.com/ibhagwan/nvim-lua/blob/main/lua/autocmd.lua
vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter','InsertLeave'}, {
  group = myAutoGroup,
  desc = 'Enable cursorline for active window',
  callback = function()
    if not vim.o.cursorline and not vim.o.previewwindow then
      vim.opt_local.cursorline = true
    end
  end
})
vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave','InsertEnter'}, {
  group = myAutoGroup,
  desc = 'Disable cursorline for active window',
  callback = function()
    if vim.o.cursorline and not vim.o.previewwindow then
      vim.opt_local.cursorline = false
    end
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = myAutoGroup,
  desc = 'Highlight on yank',
  callback = function() vim.highlight.on_yank() end
})

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Plugin specific settings

-------------------------------------------------------------------------------
-- Airline
vim.g.airline_theme = 'molokai'
vim.g.airline_powerline_fonts = 1

vim.g.airline_section_error =
  '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
vim.g.airline_section_warning =
  '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

vim.g['airline#extensions#whitespace#enabled'] = 0  -- Whitespace error detection
vim.g['airline#extensions#tagbar#enabled'] = 0

vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'uniq_tail_or_proj'
vim.g['airline#extensions#tabline#fnamemod'] = ':t'   -- Default tab name formatter
vim.g['airline#extensions#tabline#fnamecollapse'] = 0   -- Short parent names in tabs
vim.g['airline#extensions#tabline#tab_nr_type'] = 1
vim.g['airline#extensions#tabline#show_close_button'] = 0
vim.g['airline#extensions#tabline#show_splits'] = 0
vim.g['airline#extensions#tabline#show_buffers'] = 0
vim.g['airline#extensions#tabline#show_tab_type'] = 0

-------------------------------------------------------------------------------
-- Asterisk
vim.g['asterisk#keeppos'] = 1

-------------------------------------------------------------------------------
-- coc
vim.g.coc_global_extensions = {'coc-clangd', 'coc-json', 'coc-pyright',
  'coc-syntax', 'coc-tag', 'coc-vimlsp', 'coc-pairs', 'coc-sh', 'coc-snippets'}
vim.g.coc_quickfix_open_command = 'botright copen'

vim.keymap.set('i', '<Tab>',
  function()
    return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#next'](1) or '<Tab>'
  end,
  {desc = 'Next completion option', silent = true, expr = true})
vim.keymap.set('i', '<S-Tab>',
  function()
    return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#prev'](1) or '<C-h>'
  end,
  {desc = 'Previous completion option', silent = true, expr = true})

vim.keymap.set('i', '<C-Space>', 'coc#refresh()', {silent = true, expr = true})

vim.keymap.set('i', '<CR>', function()
    -- <C-g>u breaks current undo
    return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or
      "<C-g>u<CR><C-r>=EndwiseDiscretionary()<CR>"
  end,
  {desc = 'Auto-select the first completion item', silent = true, expr = true})

vim.keymap.set('n', '<Leader>]', '<Plug>(coc-definition)', {silent = true})
vim.keymap.set('n', '<Leader>v]',
  function() vim.fn.CocAction('jumpDefinition', 'vsplit') end,
  {desc = 'coc: Jump to definition, vertical split', silent = true}
)
vim.keymap.set('n', '<Leader>s]',
  function() vim.fn.CocAction('jumpDefinition', 'split') end,
  {desc = 'coc: Jump to definition, horizontal split', silent = true}
)

vim.keymap.set('n', '<Leader>[', '<Plug>(coc-declaration)', {silent = true})
vim.keymap.set('n', '<Leader>v[',
  function() vim.fn.CocAction('jumpDeclaration', 'vsplit') end,
  {desc = 'coc: Jump to declaration, vertical split', silent = true}
)
vim.keymap.set('n', '<Leader>s[',
  function() vim.fn.CocAction('jumpDeclaration', 'split') end,
  {desc = 'coc: Jump to declaration, horizontal split', silent = true}
)

vim.keymap.set('n', '<Leader>rr', '<Plug>(coc-references)', {silent = true})
vim.keymap.set('n', '<Leader>ri', function()
    local qf = {}
    for _, inCall in ipairs(vim.fn.CocAction('incomingCalls')) do
      local from = inCall.from

      local i, j = from.uri:find('file://')
      local absFile = from.uri:sub(i == 1 and j+1 or 1)

      local range = from.range
      local rangeStart = range.start
      local rangeEnd = range['end']

      local startLine = rangeStart.line + 1
      local endLine = rangeEnd.line + 1

      local startCol = rangeStart.character + 1
      local endCol = rangeEnd.character + 1

      local file = vim.fn.readfile(absFile, '', startLine)
      table.insert(qf, {filename = absFile, lnum = startLine,
        end_lnum = endLine, col = startCol, end_col = endCol,
        text = file[#file]})
    end

    vim.fn.setqflist(qf)
    vim.cmd.FzfLua('quickfix')
  end,
  {desc = 'coc: Populate quickfix list with incoming calls', silent = true})
vim.keymap.set('n', '<Leader>rti',
  function() vim.fn.CocAction('showIncomingCalls') end,
  {desc = 'coc: Show incoming calls', silent = true})
vim.keymap.set('n', '<Leader>ro',
  function() vim.fn.CocAction('showOutgoingCalls') end,
  {desc = 'coc: Show outgoing calls', silent = true})

vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})
vim.keymap.set('n', '<Leader>gd', '<Cmd>CocDiagnostics<CR>')

vim.keymap.set('n', 'K', function()
    if vim.fn.CocAction('hasProvider', 'hover') then
      vim.fn.CocActionAsync('doHover')
    else vim.fn.feedkeys('K', 'in') end
  end,
  {desc = "Hover", silent = true})

vim.keymap.set('n', '<Leader>ll', '<Cmd>CocList<CR>')
vim.keymap.set('n', '<Leader>lc', '<Cmd>CocList commands<CR>')

vim.keymap.set('n', '<Leader>ca', '<Plug>(coc-codeaction)', {silent = true})
vim.keymap.set('n', '<Leader>cx', '<Plug>(coc-fix-current)', {silent = true})
vim.keymap.set('n', '<Leader>rn', '<Plug>(coc-rename)', {silent = true})

vim.keymap.set('n', '<Leader>ch', '<Cmd>CocCommand document.toggleInlayHint<CR>')

vim.keymap.set({'n', 'v'}, '<C-f>', function()
    return vim.fn['coc#float#has_scroll']() == 1 and
      vim.fn['coc#float#scroll'](1) or "<C-f>"
  end,
  {desc = 'coc: Scroll floating window forward', silent = true, nowait = true,
   expr = true}
)
vim.keymap.set({'n', 'v'}, '<C-b>', function()
    return vim.fn['coc#float#has_scroll']() == 1 and
      vim.fn['coc#float#scroll'](0) or "<C-b>"
  end,
  {desc = 'coc: Scroll floating window backward', silent = true, nowait = true,
   expr = true}
)
vim.keymap.set('i', '<C-f>', function()
    return vim.fn['coc#float#has_scroll']() == 1 and
      "<C-r>=coc#float#scroll(1)<CR>" or "<Right>"
  end,
  {desc = 'coc: Scroll floating window forward', silent = true, nowait = true,
   expr = true}
)
vim.keymap.set('i', '<C-b>', function()
    return vim.fn['coc#float#has_scroll']() == 1 and
      "<C-r>=coc#float#scroll(0)<CR>" or "<Left>"
  end,
  {desc = 'coc: Scroll floating window backward', silent = true, nowait = true,
   expr = true}
)

local myCocGroup = vim.api.nvim_create_augroup('myCocGroup', {clear = true})
vim.api.nvim_create_autocmd('User', {
  group = myCocGroup,
  desc = 'Update signature help on jump placeholder',
  pattern = 'CocJumpPlaceholder',
  callback = function() vim.fn.CocActionAsync('showSignatureHelp') end
})

vim.api.nvim_create_user_command('CheckHighlightUnderCursor', function()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local mode = "name"

    -- Highest highlighting group: name of syntax keyword, match or region
    local hi = vim.fn.synIDattr(vim.fn.synID(line, col, 1), mode)

    -- For transparent groups, the group it's in
    local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), mode)

    -- Lowest group: basic highlighting spec such as a default highlighting group
    local lo = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 1)), mode)

    vim.api.nvim_echo({{string.format('hi<%s> trans<%s> lo<%s>', hi, trans, lo)}},
      false, {})
    if vim.fn.CocHasProvider('semanticTokens') then
      vim.cmd.CocCommand('semanticTokens.inspect')
    end
  end,
  {}
)

vim.cmd.highlight('link CocSemTypeMacro Macro')
vim.cmd.highlight('link CocSemTypeVariable NONE')
vim.cmd.highlight('link CocSemTypeEnumMember Constant')
vim.cmd.highlight('link CocSemTypeKeyword NONE')

-- For Python packages in import statement
vim.cmd.highlight('link CocSemTypeNamespace NONE')

vim.cmd.highlight('link CocSemTypeParameter NONE')

-- For Python function parameter type hints
vim.cmd.highlight('link CocSemTypeTypeParameter NONE')

-- Taken from coc.vim
vim.cmd.highlight('CocMenuSel ctermbg=237 guibg=#13354A')

-------------------------------------------------------------------------------
-- Comment.nvim
require('Comment').setup()

-------------------------------------------------------------------------------
-- conform.nvim
require'conform'.setup{
  formatters = {
    ["clang-format"] = {
      prepend_args = {"-style=file"},
    },
  },
  formatters_by_ft = {
    c = {"clang-format"},
    cpp = {"clang-format"},
    json = {"prettier"},
    python = {"isort", "black"},
  }
}

-- Command to run async formatting, taken from recipes
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- Derived from https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips#range-formatting-with-a-motion
function format_range_operator()
  local old_func = vim.go.operatorfunc
  _G.op_func_formatting = function()
    require'conform'.format{async = true, lsp_fallback = true, range = {
        start = vim.api.nvim_buf_get_mark(0, '['),
        ["end"] = vim.api.nvim_buf_get_mark(0, ']')
      }
    }

    vim.go.operatorfunc = old_func
    _G.op_func_formatting = nil
  end
  vim.go.operatorfunc = 'v:lua.op_func_formatting'
  vim.api.nvim_feedkeys('g@', 'n', false)
end

vim.keymap.set({"n", "x"}, "<Leader>gf", format_range_operator,
  {desc = "Format selection", silent = true})

-------------------------------------------------------------------------------
-- DoGe
vim.g.doge_doc_standard_python = 'google'
vim.g.doge_comment_jump_modes = {'n', 's'}

-------------------------------------------------------------------------------
-- endwise
vim.g.endwise_no_mappings = 1

-------------------------------------------------------------------------------
-- floaterm
vim.keymap.set("n", "<leader>lg",
  "<Cmd>FloatermNew --height=0.9 --width=0.9 --title=lazygit lazygit<CR>")

-------------------------------------------------------------------------------
-- fzf-lua
require('fzf-lua').setup {
  preview_layout = 'vertical',
  default_previewer = 'bat',

  previewers = {
    bat = {
      theme = 'Monokai Extended',
    },
  },

  -- Git icons are disabled for performance reasons
  files = {
    git_icons = false,
  },
  oldfiles = {
    include_current_session = true,
  },
  tags = {
    git_icons = false,
  },
  btags = {
    git_icons = false,
  },
}

-- Derived from ctrlp#normcmd()
function go_to_editable_window()
  local invalidBufTypes = {'quickfix', 'help', 'nofile', 'terminal'}
  if not vim.tbl_contains(invalidBufTypes, vim.bo.buftype) then return end

  local editWins = vim.tbl_filter(function(winNum)
      local buf = vim.fn.winbufnr(winNum)
      return not vim.list_contains(invalidBufTypes, vim.bo[buf].buftype)
    end,
    vim.tbl_map(vim.api.nvim_win_get_number, vim.api.nvim_tabpage_list_wins(0)))
  for _, winNum in ipairs(editWins) do
    local bufNum = vim.fn.winbufnr(winNum)
    if vim.fn.bufname(bufNum) == '' and vim.bo[bufNum].filetype == '' then
      tmpWin = winNum
      break
    end
  end

  local cwd = vim.fn.getcwd()
  if #editWins > 0 then
    if not vim.list_contains(editWins, vim.fn.winnr()) then
      vim.cmd((tmpWin or editWins[1]) .. 'wincmd w')
    end
  else vim.cmd.botright('vnew')
  end

  vim.cmd.lcd(cwd)
end

vim.keymap.set('n', '<C-p>', function()
    go_to_editable_window()
    require'fzf-lua'.files{cwd = vim.fn.getcwd()}
  end,
  {desc = 'fzf-lua: Files', silent = true})
vim.keymap.set('n', '<C-q>', function()
    go_to_editable_window()
    require'fzf-lua'.files{cwd = vim.fn.expand('%:p:h')}
  end,
  {desc = 'fzf-lua: Files in current file directory', silent = true})
vim.keymap.set('n', [[<C-\>]], function()
    go_to_editable_window()
    require'fzf-lua'.buffers()
  end,
  {desc = 'fzf-lua: Buffers', silent = true})
vim.keymap.set('n', '<A-p>', function()
    go_to_editable_window()
    require'fzf-lua'.oldfiles()
  end,
  {desc = 'fzf-lua: Old files', silent = true})
vim.keymap.set('n', '<C-h>', function()
    go_to_editable_window()
    require'fzf-lua'.tags()
  end,
  {desc = 'fzf-lua: Tags', silent = true})
EOF

" FzfLua btags by default uses an existing tags file. This function generates
" the latest tags for the current file.
function! s:FzfLuaBTags()
  let filePath = expand('%')
  let tmp = tempname()
  silent execute '!ctags -f ' . tmp . ' "' . filePath . '"'

  " Don't specify cwd for tags call if current file is not under cwd
  let cwd = filePath[0] != '/' ? getcwd() : ''
  silent execute 'FzfLua btags ctags_file=' . tmp . ' cwd=' . cwd
endfunction

nnoremap <C-k> <Cmd>call <SID>FzfLuaBTags()<CR>
nnoremap <C-j> <Cmd>FzfLua blines show_unlisted=true<CR>
nnoremap <leader>f <Cmd>FzfLua builtin<CR>
nnoremap <leader>; <Cmd>FzfLua command_history<CR>
nnoremap <leader>/ <Cmd>FzfLua search_history<CR>
nnoremap <leader>h <Cmd>FzfLua help_tags<CR>
nnoremap <leader>x <Cmd>FzfLua commands<CR>
nnoremap <leader>cf <Cmd>FzfLua quickfix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grepper
runtime plugin/grepper.vim
let g:grepper.tools = ['rg', 'git']
let g:grepper.rg.grepprg = 'rg -H --no-heading --vimgrep --smart-case --follow $*'
let g:grepper.dir = 'filecwd'

nnoremap <leader><leader> <Cmd>call <SID>GoToEditWindow()<CR>:GrepperRg 

" Prevent auto-resize of quickfix window
let g:grepper.open = 0
augroup myGrepperGroup
  autocmd User Grepper botright copen
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
let g:gundo_prefer_python3 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags
let g:gutentags_define_advanced_commands = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hop
lua << EOF
require'hop'.setup()

-- Like `hop.jump_target.regex_by_line_start_skip_whitespace()` except it also
-- marks empty or whitespace only lines
local function regexLines()
  return {
    oneshot = true,
    match = function(str)
      return vim.regex("\\v(\\S|.$)"):match_str(str) or 0, 1
    end
  }
end

-- Like `:HopLineStart` except it also jumps to empty or whitespace only lines
function hintLines()
  local gen = require'hop.jump_target'.jump_targets_by_scanning_lines
  require'hop'.hint_with(gen(regexLines()), require'hop'.opts)
end

-- Derived from `hop.hint_with()`
local function hintWithTill(jump_target_gtr)
  require'hop'.hint_with_callback(jump_target_gtr, require'hop'.opts,
    function(jt)
      local jumpLine = jt.line + 1
      local jumpCol = jt.column - 1

      local curPos = vim.api.nvim_win_get_cursor(0)
      local row = curPos[1]
      local col = curPos[2]

      local hintOffset
      if row > jumpLine or (row == jumpLine and col > jumpCol) then
        hintOffset = 1
      else
        hintOffset = -1
      end

      require'hop'.move_cursor_to(jt.window, jumpLine, jumpCol, hintOffset)
    end)
end

-- Derived from `hop.get_input_pattern()`
local function getInputChar(prompt)
  local K_Esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  local K_BS = vim.api.nvim_replace_termcodes('<BS>', true, false, true)
  local K_CR = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
  local key = ''

  vim.api.nvim_echo({}, false, {})
  vim.cmd('redraw')
  vim.api.nvim_echo({{prompt, 'Question'}, {key}}, false, {})

  local ok, key = pcall(vim.fn.getchar)
  if not ok then return key end -- Interrupted by <C-c>

  if type(key) == 'number' then
    key = vim.fn.nr2char(key)
  elseif key:byte() == 128 then
    -- It's a special key in string
  end

  if key == K_Esc or key == K_CR or key == K_BS then
    key = nil
  end

  vim.api.nvim_echo({}, false, {})
  vim.cmd('redraw')
  return key
end

-- Derived from `hop.hint_char1()`
function hintTill1()
  local opts = require'hop'.opts

  local c = getInputChar('Till 1 char: ')
  if not c then
    return
  end

  local generator = require'hop.jump_target'.jump_targets_by_scanning_lines
  hintWithTill(
    generator(require'hop.jump_target'.regex_by_case_searching(c, true, opts)),
    opts
  )
end
EOF

nnoremap <Space> <Cmd>HopWord<CR>
vnoremap <Space> <Cmd>HopWord<CR>

" See `:h forced-motion` for these operator-pending mappings
noremap _ <Cmd>lua hintLines()<CR>
onoremap _ V:lua hintLines()<CR>

noremap <Enter> <Cmd>HopChar1<CR>
onoremap <Enter> v:HopChar1<CR>

noremap + <Cmd>lua hintTill1()<CR>
onoremap + V:lua hintTill1()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
nnoremap <C-n> <Cmd>NERDTreeFocus<CR>
nnoremap <A-n> <Cmd>NERDTreeFind<CR>
nnoremap <leader>n <Cmd>NERDTree<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-bqf

lua << EOF
require('bqf').setup{
  preview = {
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
          -- skip file size greater than 100k
          ret = false
      elseif bufname:match('^fugitive://') then
          -- skip fugitive buffer
          ret = false
      end
      return ret
    end
  },
  func_map = {
    -- Other split mappings defined by QFEnter
    split = '<C-x><C-s>',
    vsplit = '<C-x><C-v>',
  },
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-colorizer
lua require'colorizer'.setup({'*'}, {names = false})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" polyglot

" vim-cpp-modern
hi link cppSTLios NONE  " Turn off STL I/O manipulators highlighting
hi link cppSTLconstant NONE   " Turn off C++17 constants
hi link cppSTLtype NONE       " Turn off C++17 STL types
hi link cppSTLconcept NONE    " Turn off C++20 concepts

" vim-markdown
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project
lua << EOF
vim.fn['project#rc']()
vim.cmd.source(vimDir .. '/projects.vim')
if vim.fn.argc(-1) == 0 then
 vim.cmd.Welcome()
end
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pydocstring
let g:pydocstring_formatter = 'google'
let g:pydocstring_enable_mapping = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-s>']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search pulse
let g:vim_search_pulse_mode = 'pattern'
let g:vim_search_pulse_disable_auto_mappings = 1

map * <Plug>(asterisk-*)<Plug>Pulse
map # <Plug>(asterisk-#)<Plug>Pulse
map g* <Plug>(asterisk-g*)<Plug>Pulse
map g# <Plug>(asterisk-g#)<Plug>Pulse
map z*  <Plug>(asterisk-z*)<Plug>Pulse
map gz* <Plug>(asterisk-gz*)<Plug>Pulse
map z#  <Plug>(asterisk-z#)<Plug>Pulse
map gz# <Plug>(asterisk-gz#)<Plug>Pulse

nmap n n<Plug>Pulse
nmap N N<Plug>Pulse

" Pulse when doing search with / or ?
runtime autoload/search_pulse.vim
if exists('*search_pulse#PulseFirst')
  cmap <silent> <expr> <enter> search_pulse#PulseFirst()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
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
      if lang == "c" then
        return true
      end

      -- disable slow treesitter highlight for large files
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1    " Move to Tagbar window when opened
let g:tagbar_sort = 0
nmap <silent> <A-t> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" which-key
lua require"which-key".setup{}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" wordmotion
let g:wordmotion_nomap = 1

map <leader>w <Plug>WordMotion_w
map <leader>e <Plug>WordMotion_e
map <leader>b <Plug>WordMotion_b
map <leader>ge <Plug>WordMotion_ge

omap i<leader>w <Plug>WordMotion_iw
vmap i<leader>w <Plug>WordMotion_iw

omap a<leader>w <Plug>WordMotion_aw
vmap a<leader>w <Plug>WordMotion_aw
