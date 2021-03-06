"""""""""""""""""""""""""""""""""""""""""""""
"                 start                     "
"""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""
"           personal plugin start           "
"""""""""""""""""""""""""""""""""""""""""""""
" Syntastic is a syntax checking plugin for Vim
Plugin 'scrooloose/syntastic'

" Highlights trailing whitespace in red and provides
Plugin 'bronson/vim-trailing-whitespace'

" multiple selections
Plugin 'terryma/vim-multiple-cursors'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'kien/ctrlp.vim'

" ag.vim is a plugin for vim which allows you to search over files using the silver searcher (ag)
Plugin 'ervandew/ag'

" tree explore plugin
Plugin 'scrooloose/nerdtree'

" git wrapper
Plugin 'tpope/vim-fugitive'

" best auto complete tool I have ever used(jedi, supertab...)
Plugin 'Valloric/YouCompleteMe'

" vim mode that uses rope library to provide features like python refactorings
Plugin 'python-rope/ropevim'

" Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides'

" Plugin 'wooparadog/TabBar'

Plugin 'majutsushi/tagbar'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'

"vim plugins for HTML and CSS hi-speed coding.
"see:http://mattn.github.io/emmet-vim/
Plugin 'mattn/emmet-vim'
Plugin 'joest67/vim-template'

"" Colorthemes
Plugin 'altercation/vim-colors-solarized'
" one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'

Plugin 'tpope/vim-commentary'
" Plugin 'joest67/github-vim'

" Syntaxes
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'cstrahan/vim-capnp'
Plugin 'derekwyatt/vim-scala'
Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/html5.vim'
Plugin 'saltstack/salt-vim'
Plugin 'tshirtman/vim-cython'
Plugin 'vim-scripts/nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'unblevable/quick-scope'
" Plugin 'elzr/vim-json'
Plugin 'dyng/ctrlsf.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" " Brief help
" " :PluginList          - list configured plugins
" " :PluginInstall(!)    - install (update) plugins
" " :PluginSearch(!) foo - search (or refresh cache first) for foo
" " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""
"          vim system config                "
"""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8 " Necessary to show Unicode glyphs

set fencs=utf-8,gb2312,gbk     " Sets the default encoding
filetype plugin indent on      " Automatically detect file types.

" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

" backup
set noswapfile
set backup                     " backups are nice ...
set backupdir=~/.vim/backup

" undo
set undofile                   " persistent undo
set undolevels=1000            " maximum number of changes that can be undone
set undoreload=10000           " maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" share with system clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""
"          vim plugin config                "
"""""""""""""""""""""""""""""""""""""""""""""
" TabBar
    let g:Tb_SplitToEdge = 1
    let g:Tb_UseSingleClick = 1
    let g:Tb_MapCTabSwitchBufs = 1

" syntastic
    " check when open file
    let g:syntastic_check_on_open = 1
    " let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_python_checkers = ['flake8']
    " ignore pep8 character lenght limit
    let g:syntastic_python_flake8_args = '--ignore=E402'
    " jump the cursor to the first detected issue
    " let g:syntastic_auto_jump=1
    let g:syntastic_mode_map = {
                \ "mode": "passive",
                \ "active_filetypes": ["python"],
                \ "passive_filetypes": []}

" Ctrlp
    nmap <leader>pr :CtrlPClearCache<CR>
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.DS_Store$\|\.pyc$\|__pycache__' }

" Gitgutter
    nmap <leader>g :GitGutterToggle<CR>
    nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
    nmap <Leader>ha <Plug>GitGutterStageHunk
    nmap <Leader>hu <Plug>GitGutterRevertHunk
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h <Plug>GitGutterPrevHunk

    let g:gitgutter_enabled = 1
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0

" Fugitive
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_whitelist = { 'python': 1 , 'java': 1}


" ropevim
" let g:ropevim_guess_project = 1

"""""""""""""""""""""""""""""""""""""""""""""
"              Vim UI                       "
"""""""""""""""""""""""""""""""""""""""""""""
syntax on
let &colorcolumn=80

" ignore compiled files
set wildignore=*.o,*~,*.pyc

set background=dark        " Assume a dark background
if has('gui_running')
    color solarized
    set guifont=Monaco\ for\ Powerline:h12     " set gui font
    set guioptions-=T          " remove the toolbar
    set guioptions-=L          " remove the left scrollbar
    set guioptions-=r          " remove the right scrollbar
else
    color default
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    set term=builtin_xterm     " Make terminal stuff works
    set t_Co=256
endif

set tabpagemax=15              " only show 15 tabs
set showmode                   " display the current mode
set showcmd                    " show partial commands in status line and selected characters/lines in visual mode

set ruler                      " show the ruler
set cursorline                 " highlight current line
set scrolljump=5               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor

set laststatus=2               " always show statusline
set backspace=indent,eol,start " Backspace for dummys
set linespace=0                " No extra spaces between rows
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present

set wildmenu                   " Show a navigable menu for tab completion
set wildmode=longest,list,full

set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set nofoldenable               " Disable fold code
set hidden                     " Change buffer - without saving
set magic                      " Set magic on, for regular expressions
set autoread                   " Auto reload file on change

set list                                         " Show trailing whitespace
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace

"""""""""""""""""""""""""""""""""""""""""""""
"           Formatting                      "
"""""""""""""""""""""""""""""""""""""""""""""
set wrap          " wrap long lines
set lbr           " set linebreak
set tw=0          " sets the text width
set ai            " Auto indent
set si            " Smart indent
set expandtab     " tabs are spaces, not tabs
set shiftwidth=4  " use indents of 4 spaces
set tabstop=4     " an indentation every four columns
set softtabstop=4 " let backspace delete indent

autocmd FileType css,less,html,jinja,javascript,php,puppet,yaml set shiftwidth=2
autocmd FileType css,less,html,jinja,javascript,php,puppet,yaml set tabstop=2
autocmd FileType css,less,html,jinja,javascript,php,puppet,yaml set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""
"                key binding                "
"""""""""""""""""""""""""""""""""""""""""""""
" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" move split window
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>

" quick save
noremap <Leader>s :update<CR>

" tagbar
noremap <Leader>b :TagbarToggle<CR>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Close the current buffer
map <leader>d :bdelete<cr>

" Close all the buffers
map <leader>D :bufdo bdelete<cr>:q<cr>

" treat long lines as break lines
map j gj
map k gk

" Nerdtree
    map <leader>t :NERDTreeToggle<cr>

    " show current file in tree
    map <leader>e :NERDTreeFind<CR>

" Ag, search
    nnoremap K :Ag!<SPACE>

" ctrlsf
nmap     <leader>f <Plug>CtrlSFCwordPath
