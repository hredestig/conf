unix: 
	mkdir -p ~/.emacs.d/lisp
	mkdir -p ~/bin
	cp dot-emacs ~/.emacs
	cp emacs/*.el ~/.emacs.d/
	cp emacs/lisp/*.el ~/.emacs.d/lisp
	cp -a emacs/lisp/yasnippets ~/.emacs.d/lisp
	cp dot-abcde.conf ~/.abcde.conf
	cp dot-bashrc ~/.bashrc
	cp dot-Rprofile ~/.Rprofile
	cp dot-screenrc ~/.screenrc
	cp dot-tmux.conf ~/.tmux.conf
	cp bin/* ~/bin
win: 
	D='/cygdrive/c/Users/gbfjc/'
	mkdir -p $(D)/.emacs.d/lisp
	mkdir -p $(D)/bin
	cp dot-emacs $(D)/.emacs
	cp emacs/*.el $(D)/.emacs.d/
	cp emacs/lisp/*.el $(D)/.emacs.d/lisp
	cp -a emacs/lisp/yasnippets $(D)/.emacs.d/lisp
	cp dot-Rprofile $(D)/.Rprofile

