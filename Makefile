help:
	@echo ' Makefile for vim                           '
	@echo '                                            '
	@echo ' Usage:                                     '
	@echo ' make install      init installation        '
	@echo ' make extra_install bash extra_install.sh   '
	@echo ' make custom_install bash extra_install.sh  '
	@echo ' make update       update to newest version '

init:
	git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim

gitupdate:
	git checkout master && git fetch && git rebase upstream/master

vimupdate:
	vim +PluginInstall! +PluginClean +qall

update: gitupdate vimupdate

install: init update

upload:
	git push upstream master

extra_install: gitupdate
	./extra_install.sh

custom_install: gitupdate
	./custom_install.sh

.PHONY: install update extra_install custom_install
