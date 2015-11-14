set nocompatible            " be iMproved, required
filetype off                " required

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
"Plugin 'majutsushi/tagbar'
"Plugin 'mileszs/ack.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'scrooloose/syntastic'
"Plugin 'bronson/vim-trailing-whitespace'


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
let NERDChristmasTree=0
let NERDTreeWinSize=25
map <F2> :NERDTreeToggle<CR>


" Common Configuration for Vim
"================================
set number          " Show line number
set cursorline      " Show underline in current cursor
set nowrap          " not wrap the long line

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set mouse=a         " Enable mouse to use (all mode)
set scrolloff=2     " Keep space from top and bottom
set laststatus=2    " Alway show status bar at bottom

" don't backup
set nobackup
set nowb
set noswapfile

" don't redraw while executing macros (good performance config)
set lazyredraw
