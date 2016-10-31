# vimrc
Personal VIM settings
![vim_setting](https://raw.githubusercontent.com/RobinCPC/Testing_STL/master/vim_setting.jpg)

## How to Install :

### Clone necessary repository

Open terminal (in $Home directory), then type following commands
``` bash
$ mkdir dotfiles
$ cd dotfiles
$ git clone https://github.com/RobinCPC/vimrc.git vim
$ cd vim
$ mkdir bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git
```

### Make soft link to the relevant locations

In ~/dotfiles directory, use following commands:
``` bash
$ ln -s ~/dotfiles/vim ~/.vim
$ ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```
### Install Vim package by Vundle

In ~/dotfiles/vim/ directory, use following commands:
``` bash
$ vim vimrc
```
when in vim editor, type:
``` vim
:PluginList
:PluginInstall
```
### If tagbar not work, install ctag

In terminal:
``` bash
$ sudo apt-get install ctags
```
### Fix airline fonts

In terminal, and under $HOME directory
``` bash
$ mkdir .fonts
$ cd .fonts/
$ git clone https://github.com/powerline/fonts.git
$ cd fonts/
$ ./install.sh
```
Then, go to Teminal setting:

	Edit->Profile Preferences
	General->Font
	Change default (monospace) to DejaVu Sans Mono for Powerline | 12



#### reference:

http://mirnazim.org/writings/vim-plugins-i-use/

https://github.com/powerline/fonts

https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

http://www.wklken.me/category/vim.html

https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

http://www.cnblogs.com/renrenqq/archive/2010/09/09/1813669.html

