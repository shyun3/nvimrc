let g:vimDir = stdpath('config')

call plug#begin(g:vimDir . '/bundle')

" Plugin manager
Plug 'junegunn/vim-plug'

" GUI
Plug 'tomasr/molokai'

" Plugins
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/gundo.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'yssl/QFEnter'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'shyun3/vim-cmake-lists'
Plug 'tpope/vim-commentary'
Plug 'blueyed/vim-diminactive'
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
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'nelstrom/vim-visual-star-search'

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
" diminactive
let g:diminactive_enable_focus = 1

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
autocmd User Grepper LeaderfQuickFix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
let g:gundo_prefer_python3 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags
let g:gutentags_define_advanced_commands = 1
let g:gutentags_cache_dir = g:vimDir . '/.gutentags-cache'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'project',
  \ 'markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_StlSeparator = {'left': '', 'right': ''}
let g:Lf_ExternalCommand = 'fd -t f -L -c never -H -E .git -E .svn . %s'

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_PreviewResult = {
  \ 'File': 1,
  \ 'Buffer': 1,
  \ 'Mru': 1,
  \ 'Tag': 1,
  \ 'BufTag': 1,
  \ 'Function': 1,
  \ 'Line': 1,
  \ 'Colorscheme': 1,
  \ 'Rg': 1,
  \ 'Gtags': 0,
  \ 'QuickFix': 1,
  \}

let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

let g:Lf_MruMaxFiles = 8000
let g:Lf_HistoryNumber = 8000

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

nnoremap <silent> <C-p> :call <SID>GoToEditWindow()<CR>:LeaderfFile<CR>
nnoremap <silent> <C-\> :call <SID>GoToEditWindow()<CR>:LeaderfBuffer<CR>
nnoremap <silent> <A-p> :call <SID>GoToEditWindow()<CR>:LeaderfMru<CR>
nnoremap <silent> <C-h> :call <SID>GoToEditWindow()<CR>:LeaderfTag<CR>
nnoremap <silent> <C-k> :LeaderfBufTag<CR>
nnoremap <silent> <C-j> :LeaderfLine<CR>
nnoremap <silent> <A-f> :LeaderfSelf<CR>
nnoremap <silent> <leader>; :LeaderfHistoryCmd<CR>
nnoremap <silent> <leader>/ :Leaderf searchHistory<CR>
nnoremap <silent> <leader>h :LeaderfHelp<CR>
nnoremap <silent> <leader>x :LeaderfCommand<CR>
nnoremap <silent> <leader>c :LeaderfQuickFix<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

map <Space> <Plug>Sneak_s
map g<Space> <Plug>Sneak_S

nnoremap <silent> f :call sneak#wrap('',           1, 0, 1, 1)<CR>
nnoremap <silent> F :call sneak#wrap('',           1, 1, 1, 1)<CR>
xnoremap <silent> f :call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>
xnoremap <silent> F :call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>
onoremap <silent> f :call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>
onoremap <silent> F :call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1    " Move to Tagbar window when opened
let g:tagbar_sort = 0
nmap <silent> <A-t> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = "<NUL>"
