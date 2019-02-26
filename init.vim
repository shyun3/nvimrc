let s:vim_dir = stdpath('config')

call plug#begin(s:vim_dir . '/bundle')

" Plugin manager
Plug 'junegunn/vim-plug'

" GUI
Plug 'tomasr/molokai'
Plug 'equalsraf/neovim-gui-shim'

" Plugins
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdtree'
Plug 'yssl/QFEnter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'shyun3/vim-cmake-lists'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
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

" Autocomplete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'powershell -Command ./install.ps1',
\}

" Text objects
Plug 'fvictorio/vim-textobj-backticks'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options

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
nnoremap <C-]> :tjump /\<<C-R><C-W>\>\C<CR>
nnoremap <A-]>s :wincmd g<C-V><C-]><CR>
nnoremap <A-]>v :vertical wincmd g<C-V><C-]><CR>

" Open current file in explorer
nnoremap <F10> :!start explorer /select,%:p<CR>

" Open file in Chrome
nnoremap <F5>
  \ :!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
  \ "%:p"<CR>

" <TAB> completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

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
" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "silent normal! \<c-w>\<c-w>"
  endif
  exe 'silent normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <silent> <C-p> :call FZFOpen(":call fzf#vim#files\('',
  \ {'source': 'rg --files -F --color never --hidden --follow -g \"!.*/\"'}\)"
  \ )<CR>
nnoremap <silent> <C-\> :Buffers<CR>
nnoremap <silent> <C-H> :Tags<CR>
nnoremap <silent> <C-K> :BTags<CR>
nnoremap <silent> <A-p> :History<CR>

let g:fzf_layout = { 'down': '~20%' }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grepper
runtime plugin/grepper.vim
let g:grepper.tools = ['rg', 'git']
let g:grepper.rg.grepprg .= ' --smart-case --follow'
let g:grepper.dir = 'filecwd'

let g:grepper.open = 0
autocmd User Grepper botright copen

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
" Indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'project',
  \ 'markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
let g:LanguageClient_serverCommands = {
  \ 'c': [s:vim_dir . '/ccls/Release/ccls.exe'],
  \ 'cpp': [s:vim_dir . '/ccls/Release/ccls.exe'],
\ }

let g:LanguageClient_diagnosticsList = "Location"

nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>sd :call LanguageClient_textDocument_definition(
  \ {'gotoCmd': 'split'})<CR>
nnoremap <silent> <leader>vd :call LanguageClient_textDocument_definition(
  \ {'gotoCmd': 'vsplit'})<CR>

nnoremap <silent> <leader>i :call LanguageClient_textDocument_implementation()<CR>
nnoremap <silent> <leader>si :call LanguageClient_textDocument_implementation(
  \ {'gotoCmd': 'split'})<CR>
nnoremap <leader>vi :call LanguageClient_textDocument_implementation(
  \ {'gotoCmd': 'vsplit'})<CR>

nnoremap <silent> <leader>t :call LanguageClient_textDocument_typeDefinition()<CR>
nnoremap <silent> <leader>st :call LanguageClient_textDocument_typeDefinition(
  \ {'gotoCmd': 'split'})<CR>
nnoremap <silent> <leader>vt :call LanguageClient_textDocument_typeDefinition(
  \ {'gotoCmd': 'vsplit'})<CR>

nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>

nnoremap <silent> <leader>r :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>sr :sp<CR>
  \:call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>vr :vsp<CR>
  \:call LanguageClient_textDocument_references()<CR>

nnoremap <silent> <leader>k :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>sk :sp<CR>
  \:call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>vk :vsp<CR>
  \:call LanguageClient_textDocument_documentSymbol()<CR>

nnoremap <silent> <leader>w :call LanguageClient_workspace_symbol()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet

" Plugin key-mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#snippets_directory = s:vim_dir . '/neosnippets'

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
nmap <A-t> :TagbarToggle<CR>
