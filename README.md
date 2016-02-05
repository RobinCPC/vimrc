# vimrc
Personal VIM settings

## How to Install :

1. Clone necessary repository

Open terminal (in $Home directory), then type following commands
``` bash
$ mkdir dotfiles
$ cd dotfiles
$ git clone https://github.com/RobinCPC/vimrc.git vim
$ cd vim
$ mkdir bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git
```

2. make soft link to the relevant locations

In ~/dotfiles directory, use following commands:
``` bash
$ ln -s ~/dotfiles/vim ~/.vim
$ ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```
3. Install Vim package by Vundle

In ~/dotfiles/vim/ directory, use following commands:
``` bash
$ vim vimrc
```
when in vim editor, type:
``` vim
:PluginList
:PluginInstall
```
4. If tagbar not work, install ctag

In terminal:
``` bash
$ sudo apt-get install ctags
```
5. fix airline fonts

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



* reference:

http://mirnazim.org/writings/vim-plugins-i-use/

https://github.com/powerline/fonts

