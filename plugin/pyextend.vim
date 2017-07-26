" try to build vim extending function with python.
" check here for python vim api:
" http://vimdoc.sourceforge.net/htmldoc/if_pyth.html#python-vim
"

" tesing if your vim compiled with python
if !has('python')
    echo "Error: Required vim compile with +python"
    finish
endif

" source:
" http://www.techrepublic.com/article/extending-vim-with-python/


function! GetHTML()
    pyfile ~/.vim/plugin/getHTML.py
endfunction

" bind the function call to vim command
command! GETHTML call GetHTML()


" source:
" http://www.terminally-incoherent.com/blog/2013/05/06/vriting-vim-plugins-in-python/

function! Markdown2HTML()
    pyfile ~/.vim/plugin/markdown2html.py
endfunction

command! MKD2HTML call Markdown2HTML()



" A vim plugin with Python.
" To retrieve the content of the homepage of Reddit and display it in the
" current buffer
" source:
" https://dzone.com/articles/how-write-vim-plugins-python

" Vim comments start with a double quote.
" Function definition is VimL. We can mix VimL and Python in
" function definition.

function! Reddit()
    pyfile ~/.vim/plugin/getReddit.py
" start the python code like the next line.
"python << EOF
"EOF
" Here the python code is closed. We can continue writting VimL or python again.
endfunction

command! -nargs=0 Reddit call Reddit()


function! GetLeet()
    pyfile ~/.vim/plugin/getLeet.py
endfunction

command! GETLEET call GetLeet()

"function! GetHTML()
"python << EOF
"
"import vim, BeautifulSoup, urllib
"handle = urllib.urlopen(vim.current.line)
"
"soup = BeautifulSoup.BeautifulSoup(handle.read())
"
"vim.current.buffer[:] = soup.prettify().split('\n')
"
"EOF
"endfunction
