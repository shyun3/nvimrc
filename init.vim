let g:vimDir = stdpath('config')

" lua: Covered by treesitter
let g:polyglot_disabled = ['lua']

call plug#begin(g:vimDir . '/bundle')

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

" fzf
Plug 'ibhagwan/fzf-lua'

" Dependencies
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'

" Text objects
Plug 'wellle/targets.vim'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options

" Colors
colorscheme molokai
set termguicolors

" C indent options
set cinoptions=g0   " Don't indent class scope declarations

" Casing
set ignorecase        " Ignore case when searching
set smartcase         " Consider case when an uppercase character is being used

" Completions
set completeopt=menu
set pumheight=10
set wildmode=longest:full,full

" Display
set number            " Line numbers
set colorcolumn=80    " Show right margin
set listchars=tab:»\ ,trail:·,precedes:◄,extends:► " Set invisibles
set list                                           " Show invisibles
set cursorline
set cmdheight=2
set shortmess+=c
set signcolumn=number
set noshowmode        " Mode is in status line

" File settings
set autowriteall      " Save when switching buffers
set noswapfile
set undofile
set nowritebackup
set shada='1000,s1,h

" Formatting
set nowrap            " Do not wrap text

" Mouse
set mouse=

" Search
set maxmempattern=5000

" Tabs
set expandtab     " Change tabs to spaces
set tabstop=4     " Number of spaces in a tab
set softtabstop=4 " Tab stop positions for spaces
set shiftwidth=4  " Indentation width

" Timing
set updatetime=300

" Windows
set splitright        " All vertical splits open to the right
set splitbelow        " All horizontal splits open below

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variables

let NERDTreeHijackNetrw = 0

" vim-polyglot sets this variable, which prevents loading of `filetype.lua`
unlet g:did_load_filetypes

" C
let c_gnu = 1
let c_no_curly_error = 1

" Python
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python3'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

" Make & keep sub flags
xnoremap & :&&<CR>

" Open tags in splits
nnoremap <silent> <C-]> :tjump /\<<C-R><C-W>\>\C<CR>
nnoremap <silent> <A-]>s :wincmd g<C-V><C-]><CR>
nnoremap <silent> <A-]>v :vertical wincmd g<C-V><C-]><CR>

" Window navigation
nnoremap <silent> ]w :wincmd w<CR>
nnoremap <silent> [w :wincmd W<CR>
nnoremap <silent> <BS> :wincmd p<CR>
nnoremap <silent> <Left> :wincmd h<CR>
nnoremap <silent> <Down> :wincmd j<CR>
nnoremap <silent> <Up> :wincmd k<CR>
nnoremap <silent> <Right> :wincmd l<CR>
nnoremap <silent> <A-c> :wincmd c<CR>
nnoremap <silent> <A-o> :wincmd o<CR>
nnoremap <silent> <A-1> :1wincmd w<CR>
nnoremap <silent> <A-2> :2wincmd w<CR>
nnoremap <silent> <A-3> :3wincmd w<CR>
nnoremap <silent> <A-4> :4wincmd w<CR>
nnoremap <silent> <A-5> :5wincmd w<CR>
nnoremap <silent> <A-6> :6wincmd w<CR>
nnoremap <silent> <A-7> :7wincmd w<CR>
nnoremap <silent> <A-8> :8wincmd w<CR>
nnoremap <silent> <A-9> :9wincmd w<CR>

" Quickfix
nnoremap <silent> <A-q> :botright copen<CR>
nnoremap <silent> <leader>q :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands

augroup myAutoGroup
  autocmd!
  autocmd BufLeave,FocusLost * silent! update   " Save when leaving buffer

  " Trigger `autoread` when files changes on disk
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

  " Notification after file change
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." |
    \ echohl None

  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " Enable cursorline only for active window
  " See https://github.com/ibhagwan/nvim-lua/blob/main/lua/autocmd.lua
  autocmd WinEnter,BufEnter,InsertLeave *
    \ if !&cursorline && !&pvw | setlocal cursorline | endif
  autocmd WinLeave,BufLeave,InsertEnter *
    \ if &cursorline && !&pvw | setlocal nocursorline | endif

  au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

let g:airline_section_error =
  \ '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning =
  \ '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#whitespace#enabled = 0 " Whitespace error detection
let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'uniq_tail_or_proj'
let g:airline#extensions#tabline#fnamemod = ':t'   " Default tab name formatter
let g:airline#extensions#tabline#fnamecollapse = 0 " Short parent names in tabs
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Asterisk
let g:asterisk#keeppos = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
let g:coc_global_extensions = ['coc-clangd', 'coc-json', 'coc-pyright',
  \ 'coc-syntax', 'coc-tag', 'coc-vimlsp', 'coc-pairs', 'coc-sh', 'coc-snippets']

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
  \: "\<C-g>u\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"

let g:coc_quickfix_open_command = 'botright copen'

nmap <silent> <leader>] <Plug>(coc-definition)
nmap <silent> <leader>v] :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>s] :call CocAction('jumpDefinition', 'split')<CR>

nmap <silent> <leader>[ <Plug>(coc-declaration)
nmap <silent> <leader>v[ :call CocAction('jumpDeclaration', 'vsplit')<CR>
nmap <silent> <leader>s[ :call CocAction('jumpDeclaration', 'split')<CR>

nmap <silent> <leader>rr <Plug>(coc-references)
nmap <silent> <leader>ri <Cmd>call <SID>IncomingCallsQf()<CR>
nmap <silent> <leader>rti <Cmd>call CocAction('showIncomingCalls')<CR>
nmap <silent> <leader>ro <Cmd>call CocAction('showOutgoingCalls')<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <leader>gd <Cmd>CocDiagnostics<CR>

nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

nnoremap <leader>ll <Cmd>CocList<CR>
nnoremap <leader>lc <Cmd>CocList commands<CR>

function! s:ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! s:IncomingCallsQf()
  let inCalls = CocAction('incomingCalls')
  let qf = []
  for inCall in inCalls
    let fileUri = inCall['from']['uri']
    let absFile = substitute(fileUri, "^file://", "", "")

    let range = inCall['from']['range']
    let rangeStart = range['start']
    let rangeEnd = range['end']

    let startLine = rangeStart['line'] + 1
    let endLine = rangeEnd['line'] + 1

    let startCol = rangeStart['character'] + 1
    let endCol = rangeEnd['character'] + 1

    call add(qf, {'filename': absFile, 'lnum': startLine, 'end_lnum': endLine,
          \ 'col': startCol, 'end_col': endCol,
          \ 'text': readfile(absFile, '', startLine)[-1]})
  endfor

  call setqflist(qf)
  FzfLua quickfix
endfunction

nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>cx  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

augroup myCocGroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Highlight the symbol and its references when holding the cursor
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" Remap <C-f> and <C-b> for scroll float windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
  \ coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
  \ coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
  \ "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
  \ "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
  \ coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
  \ coc#float#scroll(0) : "\<C-b>"

function! s:CheckHighlight(lineNum, colNum)
    let mode = "name"

    " Highest highlighting group: name of syntax keyword, match or region
    let hi = synIDattr(synID(a:lineNum, a:colNum, 1), mode)

    " For transparent groups, the group it's in
    let trans = synIDattr(synID(a:lineNum, a:colNum, 0), mode)

    " Lowest group: basic highlighting spec such as a default highlighting group
    let lo = synIDattr(synIDtrans(synID(a:lineNum, a:colNum, 1)), mode)

    echo 'hi<' . hi . '> ' . 'trans<' . trans . '> ' . 'lo<' . lo . '> '
    CocCommand semanticTokens.inspect
endfunction

command! CheckHighlightUnderCursor call <SID>CheckHighlight(line('.'), col('.'))

hi link CocSemTypeMacro Macro
hi link CocSemTypeVariable NONE
hi link CocSemTypeEnumMember Constant
hi link CocSemTypeKeyword NONE
hi link CocSemTypeNamespace NONE  " For Python packages in import statement
hi link CocSemTypeParameter NONE
hi link CocSemTypeTypeParameter NONE  " For Python function parameter type hints

" Taken from coc.vim
hi CocMenuSel ctermbg=237 guibg=#13354A

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment.nvim
lua require('Comment').setup()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" conform.nvim
lua << EOF
require'conform'.setup{
  formatters_by_ft = {
    c = {"clang-format"},
    cpp = {"clang-format"},
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

vim.keymap.set({"n", "x"}, "<leader>gf",
  "<cmd>lua format_range_operator()<CR>",
  {noremap = true, desc = "Format selection"})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DoGe
let g:doge_doc_standard_python = 'google'
let g:doge_comment_jump_modes = ['n', 's']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" endwise
let g:endwise_no_mappings = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" floaterm
lua << EOF
vim.keymap.set("n", "<leader>lg",
  "<Cmd>FloatermNew --height=0.9 --width=0.9 --title=lazygit lazygit<CR>",
  {noremap = true, desc = "Launch lazygit"})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf-lua

lua << EOF
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
EOF

" Go to an editable window
" Derived from ctrlp#normcmd()
function! s:GoToEditWindow()
  let invalidBufTypes = ['quickfix', 'help', 'nofile', 'terminal']
  if index(invalidBufTypes, &l:buftype) == -1
    return
  endif

  let editWins = filter(range(1, winnr('$')),
    \ 'index(invalidBufTypes, getbufvar(winbufnr(v:val), "&buftype")) == -1')
  for winNum in editWins
    let bufNum = winbufnr(winNum)
    if empty(bufname(bufNum)) && empty(getbufvar(bufNum, '&filetype'))
      let tmpWin = winNum
      break
    endif
  endfor

  let cwd = getcwd()
  if !empty(editWins)
    if index(editWins, winnr()) < 0
      execute (exists('tmpWin') ? tmpWin : editWins[0]) . 'wincmd w'
    endif
  else
    botright vnew
  endif

  execute 'lcd ' . cwd
endfunction

" This is to ensure that FzfLua files is called with the correct current
" directory.
function! s:FzfLuaFiles()
  silent call <SID>GoToEditWindow()
  silent execute 'FzfLua files cwd=' . getcwd()
endfunction

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

nnoremap <C-p> <Cmd>call <SID>FzfLuaFiles()<CR>
nnoremap <C-q> <Cmd>call <SID>GoToEditWindow()<CR><Cmd>FzfLua files cwd=%:p:h<CR>
nnoremap <C-\> <Cmd>call <SID>GoToEditWindow()<CR><Cmd>FzfLua buffers<CR>
nnoremap <A-p> <Cmd>call <SID>GoToEditWindow()<CR><Cmd>FzfLua oldfiles<CR>
nnoremap <C-h> <Cmd>call <SID>GoToEditWindow()<CR><Cmd>FzfLua tags<CR>
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
call project#rc()
execute "silent! source " . g:vimDir . "/projects.vim"
if argc(-1) == 0
  Welcome
endif

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
