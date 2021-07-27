let g:vimDir = stdpath('config')

call plug#begin(g:vimDir . '/bundle')

" Plugin manager
Plug 'junegunn/vim-plug'

" GUI
Plug 'tomasr/molokai'

" Plugins
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/gundo.vim'
Plug 'phaazon/hop.nvim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'yssl/QFEnter'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/vim-asterisk'
Plug 'shyun3/vim-cmake-lists'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'glench/vim-jinja2-syntax'
Plug 'amiorin/vim-project'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'nvie/vim-rst-tables'
Plug 'inside/vim-search-pulse'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Auto-complete
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc extensions
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources',
  \ {'as': 'coc-syntax', 'rtp': 'packages/syntax',
  \  'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources',
  \ {'as': 'coc-tag', 'rtp': 'packages/tag',
  \  'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources',
  \ {'as': 'coc-ultisnips', 'rtp': 'packages/ultisnips',
  \  'do': 'yarn install --frozen-lockfile'}

" Text objects
Plug 'fvictorio/vim-textobj-backticks'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options

" Colors
colorscheme molokai
set termguicolors

" Buffers
set hidden

" C indent options
set cinoptions=g0   " Don't indent class scope declarations

" Casing
set ignorecase        " Ignore case when searching
set smartcase         " Consider case when an uppercase character is being used

" Completion menu
set completeopt="menu"
set pumheight=10

" Display
set number            " Line numbers
set colorcolumn=80    " Show right margin
set listchars=tab:»\ ,trail:·,precedes:◄,extends:► " Set invisibles
set list                                           " Show invisibles
set cursorline
set cmdheight=2

" File settings
set autowriteall      " Save when switching buffers
set noswapfile
set undofile
set nowritebackup

" Formatting
set nowrap            " Do not wrap text

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
let c_gnu=1              " Highlight GNU keywords
let NERDTreeHijackNetrw = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

nnoremap <silent> <C-L> :nohlsearch<CR>:highlight clear Sneak<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Make & keep sub flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Make Y behave like C and D
nnoremap Y y$

" Open tags in splits
nnoremap <silent> <C-]> :tjump /\<<C-R><C-W>\>\C<CR>
nnoremap <silent> <A-]>s :wincmd g<C-V><C-]><CR>
nnoremap <silent> <A-]>v :vertical wincmd g<C-V><C-]><CR>

" <TAB> completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
augroup myAutosaveGroup
  autocmd!
  autocmd BufLeave,FocusLost * silent! update   " Save when leaving buffer
augroup END

autocmd BufNewFile,BufRead *.xaml setf xml

autocmd FocusGained * silent! checktime

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
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
" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
inoremap <silent><expr> <c-space> coc#refresh()

function! CocOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    execute "silent normal! \<c-w>\<c-w>"
    execute "cd " . g:NERDTreeFileNode.GetRootForTab().path.str()
  endif
  execute 'silent normal! ' . a:command_str . "\<cr>"
endfunction

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:coc_quickfix_open_command = 'botright copen'

nmap <silent> <leader>] <Plug>(coc-definition)
nmap <silent> <leader>v] :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>s] :call CocAction('jumpDefinition', 'split')<CR>

nmap <silent> <leader>[ <Plug>(coc-declaration)
nmap <silent> <leader>v[ :call CocAction('jumpDeclaration', 'vsplit')<CR>
nmap <silent> <leader>s[ :call CocAction('jumpDeclaration', 'split')<CR>

nmap <silent> <leader>r <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

function! s:ShowDocumentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']   " Work with fugitive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grepper
runtime plugin/grepper.vim
let g:grepper.tools = ['rg', 'git']
let g:grepper.rg.grepprg = 'rg -H --no-heading --vimgrep --smart-case --follow $*'
let g:grepper.dir = 'filecwd'

let g:grepper.open = 0

autocmd User Grepper call <SID>GoToEditWindow() | Telescope quickfix

nnoremap <leader><leader> :GrepperRg 

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
vim.api.nvim_set_keymap('', '<Space>', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('', '_', "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('', 'g<Space>', "<cmd>lua require'hop'.hint_char1()<cr>", {})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'project',
  \ 'markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neoformat
let g:neoformat_run_all_formatters = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
nnoremap <silent> <C-n> :NERDTree<CR>
nnoremap <silent> <A-n> :NERDTree %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project
let g:project_use_nerdtree = 1
call project#rc()
execute "silent! source " . g:vimDir . "/projects.vim"
if argc(-1) == 0
  Welcome
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QFEnter (use CtrlP mappings)
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

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
cmap <silent> <expr> <enter> search_pulse#PulseFirst()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1    " Move to Tagbar window when opened
let g:tagbar_sort = 0
nmap <silent> <A-t> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope

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

lua << EOF
function fd(opts)
  opts.find_command = {'fd', '--type', 'file', '--follow', '--color', 'never',
    '--hidden', '--exclude', '.git', '--exclude', '.svn'
  }
  require'telescope.builtin'.fd(opts)
end
EOF

nnoremap <silent> <C-p> :call <SID>GoToEditWindow()<CR>:lua fd({})<CR>
nnoremap <silent> <C-q> :call <SID>GoToEditWindow()<CR>:lua fd({ cwd = vim.fn.expand('%:h') })<CR>
nnoremap <silent> <C-\> :call <SID>GoToEditWindow()<CR>:Telescope buffers<CR>
nnoremap <silent> <A-p> :call <SID>GoToEditWindow()<CR>:Telescope oldfiles<CR>
nnoremap <silent> <C-h> :call <SID>GoToEditWindow()<CR>:Telescope tags<CR>
nnoremap <C-k> <cmd>Telescope current_buffer_tags<CR>
nnoremap <C-j> <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <A-f> <cmd>Telescope builtin<CR>
nnoremap <leader>; <cmd>Telescope command_history<CR>
nnoremap <leader>/ <cmd>Telescope search_history<CR>
nnoremap <leader>h <cmd>Telescope help_tags<CR>
nnoremap <leader>x <cmd>Telescope commands<CR>
nnoremap <leader>c <cmd>Telescope quickfix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = "<NUL>"
