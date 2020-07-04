set nocompatible            " be iMproved, required
filetype off                " required, so vundle will be loaded properly

let mapleader="\<Space>"    " set `space` key as leader
let maplocalleader=","

" ===== vim-plug Plugin Management ===== {{{
source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"--------------
"" IDE features
"--------------
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}
"Plug 'humiaozuzu/TabBar'
Plug 'majutsushi/tagbar'
"Plug 'mileszs/ack.vim'
"Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
"Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
"Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/Conque-GDB'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/Gundo'
Plug 'Raimondi/delimitMate'
Plug 'thinca/vim-quickrun'
Plug 'godlygeek/tabular'
Plug 'morhetz/gruvbox'

"--------------
"" Code Completions
"--------------
""Plug 'ervandew/supertab'

Plug 'hdima/python-syntax'


Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"Plug 'Valloric/YouCompleteMe'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim', {'do' : 'UpdateRemotePlugins'}
Plug 'zchee/deoplete-clang'
" All of your Plugins must be added before the following line
call plug#end()
" use `vsplit autoload/plug.vim` to see more details or Wiki for FAQ
" Also could use `:scriptnames` to check what plugins have loaded
" Put your non-Plugin stuff after this line
" ===== End of Plugin Management ==== }}}

syntax on                   " syntax highlighting
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

"-----------------
"" Plugin settings
"-----------------

" deoplete Setting
let g:deoplete#enable_at_startup=1
" tab completion
inoremap <silent><expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'


" Neomake Setting
augroup NeomakeGroup
    autocmd!
    autocmd BufWritePost * Neomake " run neomake when writing to file
augroup END
let g:neomake_open_list = 2 " auto open/close error list
let g:neomake_vim_enabled_makers = ['vint'] " pip3 install vint
let g:neomake_c_enabled_makers = ['gcc'] " clang avail
let g:neomake_cpp_enabled_makers = ['gcc'] " clang aval
let g:neomake_python_enabled_makers = ['python']
let g:neomake_html_enabled_makers = ['tidy'] " apt install tidy
let g:neomake_javascript_enabled_makers = ['jshint'] " npm install jshint -g
let g:neomake_css_enabled_makers = ['csslint'] " npm install csslint -g
let g:neomake_json_enabled_makers = ['jsonlint'] " npm install jsonlint -g
let g:neomake_go_enabled_makers = ['go']

let g:neomake_warning_sign = {
            \ 'text': 'W',
            \ 'texthl': 'WarningMsg',
            \ }
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }

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


"" Syntastic Setting {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"
"let g:syntastic_mode_map = {
"    \ "mode": "passive",
"    \ "active_filetypes" : ["cpp", "javascript"],
"    \ "passive_filetypes" : ["ruby", "python"]}
" }}}


" SuperTab Setting and Omni-completion
set completeopt=menuone,longest,preview
set omnifunc=syntaxcomplete#Complete
augroup omni_setting
    autocmd!
    autocmd FileType python     set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
    "au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
augroup END

" source: https://github.com/ervandew/supertab/issues/99
"#let g:SuperTabDefaultCompletionType = 'context'
"#let g:SuperTabContextDefaultCompletionType = "<C-P>"
"#let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"#let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<C-X><C-O>"]
"#autocmd FileType *
"#            \ if &omnifunc != '' |
"#            \ call SuperTabChain(&omnifunc, "<C-]>") |
"#            \ call SuperTabSetDefaultCompletionType("<C-X><C-P>") |
"#            \ endif
"let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
"let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
"let g:SuperTabRetainCompletionType=2


" Python-Syntax
let python_highlight_all=1
let python_highlight_builtins=1
" Self/Cls and Member Variables
syn match pythonSelf   /\v(self|cls)/ contained
syn match pythonSelf   /\v(self|cls)/
syn match pythonDunder "__\w\+__"
syn match pythonMember /\vself\.\w+(\w|\()@!/hs=s+5 contains=pythonSelf
syn match pythonMember /\vcls\.\w+(\w|\()@!/hs=s+4 contains=pythonSelf
hi link pythonSelf    Identifier
hi link pythonDunder  Define
hi link pythonMember Type


" Gondo Setting
map <leader>u : GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 20
"let g:gundo_right = 0


" Snippets Setting
" assuming you want to use snipmate snippet engine
"ActivateAddons vim-snippets snipmate
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger


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


"" YCM Setting {{{
"let g:ycm_global_ycm_extra_conf= '~/dotfiles/.ycm_extra_conf.py'
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'
"
"" goto declare or definition
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F6> :YcmDiags<CR>
"
"" Toggle YCM
"let g:ycm_min_num_of_chars_for_completion = 3
"let g:ycm_auto_trigger = 1
"}}}


"===============================
" Hotkey Setting
"===============================
" -------------------- {{{
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>
" A quick way from Insert to Normal (also can use <C-[> )
inoremap jk <Esc>

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

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

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

" --------------------  }}}

" Single line comment depend on the type of file.
augroup comment_setting
    autocmd!
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType cpp        nnoremap <buffer> <localleader>c I//<esc>
augroup END

" quickfix hoteky
augroup qfix_setting
    autocmd!
    autocmd FileType qf nnoremap <silent> <buffer>q :quit<CR>
    autocmd FileType qf nnoremap <buffer> <localleader>c :.cc<CR>
    autocmd FileType qf nnoremap <buffer> <localleader>n :cn<CR>
    autocmd FileType qf nnoremap <buffer> <localleader>p :cN<CR>
augroup END

" add additional sytax setting for user-defined extention file type
augroup syntax_setting
    autocmd!
    autocmd BufNewFile,BufRead *.launch set filetype=xml
    autocmd BufNewFile,BufRead *.urdf   set filetype=xml
    autocmd BufNewFile,BufRead *.md     set filetype=markdown
augroup END


"===============================
" Common Configuration for Vim
"================================
set encoding=utf-8      " utf-8 default  (others: big5, gbk, euc-jp)
set number              " Show line number
set cursorline          " Show underline in current cursor
set cursorcolumn        " Show highlight in current column
set nowrap              " not wrap the long line
set colorcolumn=80      " Display the limit of text width.
"set textwidth=79        " Restrict text width.

set mouse=a             " Enable mouse to use (all mode)
set scrolloff=2         " Keep space from top and bottom
set laststatus=2        " Alway show status bar at bottom

""" Tab setting
set tabstop=4           " Tab key indents X spaces at a time
set softtabstop=4       " makes the spaces feel like real tabs
set shiftwidth=4        " X spaces indents
set expandtab           " Use spaces when the <Tab> key is pressed"
" could use `:retab!` to reformat code to use tabs instead of space.

""" Folding Setting
set foldmethod=indent   " allow us fold on indent
set foldlevel=99        " don't fold by default.
"nnoremap <Space> za    " conflict with current map key.

""" Searching and Pattens
set hlsearch        " Highlight search by default.
set smarttab        " handle tab more intelligently.
set incsearch       " search pattern when still typing
nnoremap <Leader><CR> :noh<CR>


" don't backup
set nobackup
set nowb
set noswapfile

" don't redraw while executing macros (good performance config)
set lazyredraw

" System Clipboard
"set clipboard=unnamed

colorscheme monokai "atom-dark-256

""" Indentation for different file type
" For Front-end or full stack (Web)
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" For Python (already as default)
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" For ROS cpp coding style
map \R <Esc>:set expandtab shiftwidth=2 tabstop=2 softtabstop=2<CR>
" use `:retab!` for reformatting

" add additional (testing) plug-in
source ~/.vim/plugin/pyextend.vim

" configure tags - add additional tags
" source:  (will replaced by YCM later)
" http://vim.wikia.com/wiki/C%2B%2B_code_completion
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q --exclude=.git .<CR>
" TODO: let F12 do ctags -R .   when filetype is not cpp

" Vimscript file settings -------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}
"
