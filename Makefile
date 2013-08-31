D='/cygdrive/c/Users/gbfjc/'

all: 
	mkdir -p $(D)/.emacs.d/lisp
	mkdir -p $(D)/bin
	cp dot-emacs $(D)/.emacs
	cp emacs/*.el $(D)/.emacs.d/
	cp emacs/lisp/*.el $(D)/.emacs.d/lisp
	cp -a emacs/lisp/yasnippets $(D)/.emacs.d/lisp
	cp dot-abcde.conf $(D)/.abcde.conf
	cp dot-bashrc $(D)/.bashrc
	cp dot-Rprofile $(D)/.Rprofile
	cp dot-screenrc $(D)/.screenrc
	cp dot-tmux.conf $(D)/.tmux.conf
	cp bin/* $(D)/bin

