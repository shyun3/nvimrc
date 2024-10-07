let s:vim_dir = stdpath('config')

let $PATH .= ';' . s:vim_dir . '/ccls/Release'

call plug#begin(s:vim_dir . '/bundle')

" Plugin manager
Plug 'junegunn/vim-plug'

" GUI
Plug 'tomasr/molokai'
Plug 'equalsraf/neovim-gui-shim'

" Plugins
Plug 'bkad/CamelCaseMotion'
Plug 'shyun3/ctrlp.vim', {'branch': 'personal'}
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'yssl/QFEnter'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'shyun3/vim-cmake-lists'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'amiorin/vim-project'
Plug 'tpope/vim-projectionist'
Plug 'PProvost/vim-ps1'
Plug 'tpope/vim-repeat'
Plug 'inside/vim-search-pulse'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'nelstrom/vim-visual-star-search'
Plug 'vimwiki/vimwiki'

" Auto-complete
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Text objects
Plug 'fvictorio/vim-textobj-backticks'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options

" Buffers
set hidden

" C indent options
set cinoptions=g0   " Don't indent class scope declarations
set cinoptions+=N-s " Don't indent contents of namespace

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

" Formatting
set nowrap            " Do not wrap text

" Tabs
set expandtab     " Change tabs to spaces
set tabstop=2     " Number of spaces in a tab
set softtabstop=2 " Tab stop positions for spaces
set shiftwidth=2  " Indentation width

" Timing
set updatetime=300

" Windows
set splitright        " All vertical splits open to the right
set splitbelow        " All horizontal splits open below

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variables
let c_gnu=1              " Highlight GNU keywords

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
nnoremap <silent> <C-L> :nohlsearch<CR>

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

" Open current file in explorer
nnoremap <silent> <F10> :silent !start explorer /select,%:p<CR>

" Open file in Chrome
nnoremap <silent> <F5>
  \ :silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
  \ "%:p"<CR>

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
nnoremap <silent> <A-q> :botright copen<CR>
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
call camelcasemotion#CreateMotionMappings(',')

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

nmap <silent> <leader>] <Plug>(coc-definition)
nmap <silent> <leader>v] :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>s] :call CocAction('jumpDefinition', 'split')<CR>

nmap <silent> <C-,> <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" First child declaration
nn <silent> <leader><Down>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'D'})<cr>
nn <silent> <leader>v<Down>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'D'}, 'vsplit')<cr>
nn <silent> <leader>s<Down>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'D'}, 'split')<cr>

" Previous declaration
nn <silent> <leader><Left>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'L'})<cr>
nn <silent> <leader>v<Left>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'L'}, 'vsplit')<cr>
nn <silent> <leader>s<Left>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'L'}, 'split')<cr>

" Next declaration
nn <silent> <leader><Right>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'R'})<cr>
nn <silent> <leader>v<Right>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'R'}, 'vsplit')<cr>
nn <silent> <leader>s<Right>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'R'}, 'split')<cr>

" Parent declaration
nn <silent> <leader><Up>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'U'})<cr>
nn <silent> <leader>v<Up>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'U'}, 'vsplit')<cr>
nn <silent> <leader>s<Up>
  \ :call CocLocationsAsync('ccls','$ccls/navigate',{'direction':'U'}, 'split')<cr>

" bases
nn <silent> <leader>b :call CocLocationsAsync('ccls','$ccls/inheritance')<cr>
nn <silent> <leader>vb :call CocLocationsAsync('ccls','$ccls/inheritance', 'vsplit')<cr>
nn <silent> <leader>sb :call CocLocationsAsync('ccls','$ccls/inheritance', 'split')<cr>

" derived
nn <silent> <leader>d
  \ :call CocLocationsAsync('ccls','$ccls/inheritance',{'derived':v:true})<cr>
nn <silent> <leader>vd
  \ :call CocLocationsAsync('ccls','$ccls/inheritance',{'derived':v:true}, 'vsplit')<cr>
nn <silent> <leader>sd
  \ :call CocLocationsAsync('ccls','$ccls/inheritance',{'derived':v:true}, 'split')<cr>

" caller
nn <silent> <leader>c :call CocLocationsAsync('ccls','$ccls/call')<cr>
nn <silent> <leader>vc :call CocLocationsAsync('ccls','$ccls/call', {}, 'vsplit')<cr>
nn <silent> <leader>sc :call CocLocationsAsync('ccls','$ccls/call', {}, 'split')<cr>

" callee
nn <silent> <leader>C
  \ :call CocLocationsAsync('ccls','$ccls/call',{'callee':v:true})<cr>
nn <silent> <leader>vC
  \ :call CocLocationsAsync('ccls','$ccls/call',{'callee':v:true}, 'vsplit')<cr>
nn <silent> <leader>sC
  \ :call CocLocationsAsync('ccls','$ccls/call',{'callee':v:true}, 'split')<cr>

" member variables / variables in a namespace
nn <silent> <leader>mv :call CocLocationsAsync('ccls','$ccls/member')<cr>
nn <silent> <leader>vmv :call CocLocationsAsync('ccls','$ccls/member', 'vsplit')<cr>
nn <silent> <leader>smv :call CocLocationsAsync('ccls','$ccls/member', 'split')<cr>

" member functions / functions in a namespace
nn <silent> <leader>mf
  \ :call CocLocationsAsync('ccls','$ccls/member',{'kind':3})<cr>
nn <silent> <leader>vmf
  \ :call CocLocationsAsync('ccls','$ccls/member',{'kind':3}, 'vsplit')<cr>
nn <silent> <leader>smf
  \ :call CocLocationsAsync('ccls','$ccls/member',{'kind':3}, 'split')<cr>

" nested classes / types in a namespace
nn <silent> <leader>mt
  \ :call CocLocationsAsync('ccls','$ccls/member',{'kind':2})<cr>
nn <silent> <leader>vmt
  \ :call CocLocationsAsync('ccls','$ccls/member',{'kind':2}, 'vsplit')<cr>
nn <silent> <leader>smt
  \ :call CocLocationsAsync('ccls','$ccls/member',{'kind':2}, 'split')<cr>

" Instances of a type
nn <silent> <leader>gv :call CocLocationsAsync('ccls','$ccls/vars')<cr>
nn <silent> <leader>vgv :call CocLocationsAsync('ccls','$ccls/vars', 'vsplit')<cr>
nn <silent> <leader>sgv :call CocLocationsAsync('ccls','$ccls/vars', 'split')<cr>

nn <silent> <leader>gV
  \ :call CocLocationsAsync('ccls','$ccls/vars',{'kind':1})<cr>
nn <silent> <leader>vgV
  \ :call CocLocationsAsync('ccls','$ccls/vars',{'kind':1}, 'vsplit')<cr>
nn <silent> <leader>sgV
  \ :call CocLocationsAsync('ccls','$ccls/vars',{'kind':1}, 'split')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_switch_buffer = 0     " Always open a new instance
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_user_command = 'rg --files -F --color never --hidden --follow -g !.*/ %s'
let g:ctrlp_by_filename = 1       " Search filenames by default
let g:ctrlp_working_path_mode = ''

nnoremap <silent> <C-\> :CtrlPBuffer<CR>
nnoremap <silent> <C-H> :CtrlPTag<CR>
nnoremap <silent> <C-K> :CtrlPBufTag<CR>
nnoremap <silent> <A-p> :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
let g:EasyMotion_do_mapping = 0            " Disable default mappings
let g:EasyMotion_re_anywhere = '\v(<.|^$)' " Beginning of word
let g:EasyMotion_startofline = 0           " Keep cursor column JK motion
map _ <Plug>(easymotion-s)
map <C-J> <Plug>(easymotion-bd-jk)
nmap <Space> <Plug>(easymotion-jumptoanywhere)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']   " Work with fugitive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grepper
runtime plugin/grepper.vim
let g:grepper.tools = ['rg', 'git']
let g:grepper.rg.grepprg = 'rg -H --no-heading --vimgrep --smart-case --follow $* .'
let g:grepper.dir = 'filecwd'

let g:grepper.open = 0
autocmd User Grepper botright copen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags
let g:gutentags_ctags_exclude = ['.ccls-cache']
let g:gutentags_project_root = ['.ccls', '.ccls-cache', '.ignore', '.rgignore',
  \ '.editorconfig', '.gutctags', '.notags', '.projections.json']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'project',
  \ 'markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
nnoremap <silent> <C-n> :NERDTree<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project
let g:project_use_nerdtree = 1
call project#rc()
execute "silent! source " . s:vim_dir . "/projects.vim"

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
" Tagbar
let g:tagbar_autofocus = 1    " Move to Tagbar window when opened
let g:tagbar_sort = 0
nmap <silent> <A-t> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = "<NUL>"
