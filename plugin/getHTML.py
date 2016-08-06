"""
    A vim extended plugin-in written in Python
    Can only run within vim (need import vim,
    which is come with vim, no need to use pip)
"""


import vim
import BeautifulSoup
import urllib

handle = urllib.urlopen(vim.current.line)

soup = BeautifulSoup.BeautifulSoup(handle.read())

vim.current.buffer[:] = soup.prettify().split('\n')

