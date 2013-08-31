all: 
	mkdir -p ~/.emacs.d/lisp
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

