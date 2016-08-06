" try to build vim extending function with python.
" check here for python vim ap:
" http://vimdoc.sourceforge.net/htmldoc/if_pyth.html#python-vim
"

" tesing if your vim compiled with python
if !has('python')
    echo "Error: Required vim compile with +python"
    finish
endif

" source:
" http://www.techrepublic.com/article/extending-vim-with-python/

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

function! GetHTML()
    pyfile ./plugin/getHTML.py
endfunction

" bind the function call to vim command
command! GETHTML call GetHTML()


" source:
" http://www.terminally-incoherent.com/blog/2013/05/06/vriting-vim-plugins-in-python/

function! Markdown2HTML()
    pyfile ./plugin/markdown2html.py
endfunction

command! MKD2HTML call Markdown2HTML()

