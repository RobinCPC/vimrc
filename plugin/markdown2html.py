"""
    A vim extend plug-in
    Converting Markdown file to HTML form
"""

try:
    import vim
    import markdown
    import string

    html = string.join(vim.current.buffer, '\n')
    html = markdown.markdown(html, output_format = 'html5')
    filename = vim.current.buffer.name + ".html"

    f = open(filename, 'w')
    f.write(html)
    f.close()

    print "HTML output written to " + filename

except ImportError, e:
    print "markdown package did not install, please run: pip install Markdown"

