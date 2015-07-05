"""""""""""""""""""""""""""""""""""""""""""""
"                 start                     "
"""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/._vim/bundle/Vundle.vim
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

" Perform all your vim insert mode completions with Tab
" Plugin 'ervandew/supertab'

Plugin 'Valloric/YouCompleteMe'

" vim mode that uses rope library to provide features like python refactorings
Plugin 'python-rope/ropevim'

" Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides'

" Vim plugin that displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'

" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'

Plugin 'ap/vim-buftabline'

"This plugin for Vim enable an auto-close chars feature for you.
Plugin 'Townk/vim-autoclose'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
Plugin 'airblade/vim-gitgutter'

"A nicer Python indentation style for vim.
Plugin 'hynek/vim-python-pep8-indent'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'

"vim plugins for HTML and CSS hi-speed coding.
"see:http://mattn.github.io/emmet-vim/
Plugin 'mattn/emmet-vim'

"" Colorthemes
Plugin 'altercation/vim-colors-solarized'
" one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'

" Syntaxes
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'cstrahan/vim-capnp'
Plugin 'derekwyatt/vim-scala'
Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/html5.vim'
Plugin 'saltstack/salt-vim'
Plugin 'sprsquish/thrift.vim'
Plugin 'tshirtman/vim-cython'
Plugin 'vim-scripts/nginx.vim'

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

" Save and return to normal mode on FocusLost
au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

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
" syntastic
    " check when open file
    let g:syntastic_check_on_open = 1
    " let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_python_checkers = ['flake8']
    " ignore pep8 character lenght limit
    let g:syntastic_python_flake8_args = '--ignore=E501'
    " jump the cursor to the first detected issue
    let g:syntastic_auto_jump=1


" Ctrlp
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <CR> :CtrlPBuffer<CR>
    nnoremap <C-u> :CtrlPMRU<CR>
    nnoremap <C-e> :CtrlPClearCache<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.DS_Store$\|\.pyc$\|__pycache__' }

" Gitgutter
    nmap <leader>g :GitGutterToggle<CR>
    let g:gitgutter_enabled = 1
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0

" Indent guides
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter, Colorscheme *:
        hi IndentGuidesOdd  guibg = red ctermbg = 237
    autocmd VimEnter, Colorscheme *:
        hi IndentGuidesEven guibg = green ctermbg = 237
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_indent_levels = 3
    let g:indent_guides_exclude_filetypes = []

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

"""""""""""""""""""""""""""""""""""""""""""""
"              Vim UI                       "
"""""""""""""""""""""""""""""""""""""""""""""
syntax on
let &colorcolumn=80

" ignore compiled files
set wildignore=*.o,*~,*.pyc

set cmdheight=1

set background=dark        " Assume a dark background
if has('gui_running')
    color solarized
    set guifont=Monaco\ for\ Powerline:h12     " set gui font
    set guioptions-=T          " remove the toolbar
    set guioptions-=L          " remove the left scrollbar
    set guioptions-=r          " remove the right scrollbar
else
    color molokai
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
set nu                         " Line numbers on
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

" The following two lines conflict with moving to top and bottom of the
" screen
" If you prefer that functionality, comment them out.
map <S-H> gT
map <S-L> gt

" lazy press <ESC>
inoremap jk <Esc>

" quick save
noremap <Leader>s :update<CR>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"Fix home and end keybindings for screen
map  [F $
map  [H g0

" Close the current buffer
map <leader>d :bdelete<cr>

" Close all the buffers
map <leader>D :bufdo bdelete<cr>:q<cr>

" treat long lines as break lines
map j gj
map k gk


" Tabularize {
    if exists(":Tabularize")
      nmap <leader>a= :Tabularize /=<CR>
      vmap <leader>a= :Tabularize /=<CR>
      nmap <leader>a: :Tabularize /:<CR>
      vmap <leader>a: :Tabularize /:<CR>
      nmap <leader>a:: :Tabularize /:\zs<CR>
      vmap <leader>a:: :Tabularize /:\zs<CR>
      nmap <leader>a, :Tabularize /,<CR>
      vmap <leader>a, :Tabularize /,<CR>
      nmap <leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <leader>a<Bar> :Tabularize /<Bar><CR>

      " The following function automatically aligns when typing a
      " supported character
      inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

      function! s:align()
          let p = '^\s*|\s.*\s|\s*$'
          if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
              let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
              let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
              Tabularize/|/l1
              normal! 0
              call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
          endif
      endfunction

    endif

" NERDTree
    nnoremap <F2> :NERDTreeToggle <CR>
    " show current file in tree
    map <leader>e :NERDTreeFind<CR>

" Ag, search
    nnoremap K :Ag!<SPACE>

" Airline
    " Use powerline patched fonts
    let g:airline_powerline_fonts = 1
    " automatically displays all buffers when there's only one tab open
    let g:airline#extensions#tabline#enabled = 1
    " theme airline
    let g:airline_theme = 'base16'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

" Tagbar
    nnoremap <silent> <leader>t :TagbarToggle<CR>

" vim-buftabline
" use tab to choose tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
