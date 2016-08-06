set nocompatible            " be iMproved, required
filetype off                " required

let mapleader="\<Space>"    " set `space` key as leader
let maplocalleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"--------------
"" IDE features
"--------------
Plugin 'scrooloose/nerdtree'
"Plugin 'humiaozuzu/TabBar'
Plugin 'majutsushi/tagbar'
"Plugin 'mileszs/ack.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
"Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/Gundo'
Plugin 'Raimondi/delimitMate'
Plugin 'thinca/vim-quickrun'

"--------------
"" Code Completions
"--------------
Plugin 'ervandew/supertab'

Plugin 'hdima/python-syntax'


Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-----------------
"" Plugin settings
"-----------------

" NerdTree Setting
let NERDChristmasTree=1
let NERDTreeWinSize=25
map <F2> :NERDTreeToggle<CR>

" tagbar seting
"nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
map <F3> :Tagbar<CR>

" Air-line Setting
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"" If system setting are correct and intall font from powerline
"" may not this following symbol setting
"=========================================
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '':

"let g:airline_symbols.space = '"\ua0"
"set fillchars+=stl:\ ,stlnc:\          " if see ^^^^^ in the statusline
"=========================================

"set t_Co=256        " show more color for airline
let g:airline_theme='murmur'    " change theme of airline 'wombot'

" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" GVim Config
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 11
set guioptions-=m   " remove Menu bar
set guioptions-=T   " remove Tool bar
set guioptions-=r   " remove Right bar
set guioptions-=L   " remove Left bar

" ConqueGDB Setting
let g:ConqueTerm_Color=2            " 1: strip color after 200 line, 2: always with color
let g:ConqueTerm_CloseOnEnd=1       " close conque when program ends running
let g:ConqueTerm_StartMessages=0    " display warning message if conqueTerm is configed incorrect

" Solarized Setting
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
"colorscheme solarized

if has('gui_running')
    set background=dark     "light
    colorscheme molokai
    let g:airline_theme='molokai'
else
    set background=light    "dark
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
end
" need to change built-in scheme of ubuntu terminal
" set Background color: #FDF6E3 #002b36(dark)
" set Text color:       #839496 #657b83(dark)
" set Color-palette to Tango (temp)


" Syntastic Setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" SuperTab Setting
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
"let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

" Python-Syntax
let python_highlight_all=1
let python_highlight_builtins=1

" Gondo Setting
map <leader>g : GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 20
"let g:gundo_right = 0

" Snippets Setting
" assuming you want to use snipmate snippet engine
"ActivateAddons vim-snippets snipmate

" Quickrun Setting
let g:quickrun_config = {
            \   "_" : {
            \       "outputter" : "error",
            \       "outputter/error/success"   : "buffer",
            \       "outputter/error/error"     : "quickfix",
            \       "outputter/buffer/split"    : ":rightbelow 8sp",
            \       "outputter/buffer/close_on_empty" : 1,
            \       "hook/time/enable" : 1
            \   },
            \   "cpp" : {
            \       "cmdopt" : "-std=c++11 -Wall -pedantic"
            \   },
            \}

let g:quickrun_no_default_key_mappings = 1
"nmap <Leader>r <Plug>(quickrun)    " conflic GDB setting?
map <F5> :QuickRun<CR>

"===============================
" Hotkey Setting
"===============================

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>

set pastetoggle=<F4>            "    when in insert mode, press <F4> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" Smart way to move between windows
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l

" Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Automatically jump to end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Hit `Enter` to go to end of file, and Hit `Backspace` to go to beginning of file.
nnoremap <CR> G
nnoremap <BS> gg

" Type `<Space>o` to open a new file:
"nnoremap <Leader>o :CtrlP<CR> " need CrtlP plug-in or :FZF<CR>

" Type `<Space>w` to save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :wq<CR>

" Remove trailing whitespaces
nnoremap <silent> <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

" Single line comment depend on the type of file.
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>

" quickfix hoteky
autocmd FileType qf nnoremap <silent> <buffer>q :quit<CR>
autocmd FileType qf nnoremap <buffer> <localleader>c :.cc<CR>
autocmd FileType qf nnoremap <buffer> <localleader>n :cn<CR>
autocmd FileType qf nnoremap <buffer> <localleader>p :cN<CR>


"===============================
" Common Configuration for Vim
"================================
set number              " Show line number
set cursorline          " Show underline in current cursor
set cursorcolumn        " Show highlight in current column
set nowrap              " not wrap the long line

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set mouse=a             " Enable mouse to use (all mode)
set scrolloff=2         " Keep space from top and bottom
set laststatus=2        " Alway show status bar at bottom

set foldmethod=indent   " allow us fold on indent
set foldlevel=99        " don't fold by default.

""" Ssearching and Pattens
set hlsearch        " Highlight search by default.
set smarttab        " handle tab more intelligently.



" don't backup
set nobackup
set nowb
set noswapfile

" don't redraw while executing macros (good performance config)
set lazyredraw

colorscheme molokai "atom-dark-256

" add additional sytax setting for user-defined extention file type
syntax on
filetype on
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.urdf set filetype=xml
au BufNewFile,BufRead *.md set filetype=markdown

" add additional (testing) plug0in
source ./plugin/pyextend.vim
source ./plugin/vimmit.vim

