(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . 
				   "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (unless package-archive-contents
	(package-refresh-contents))
  (setq package-load-list '(all))
  (package-initialize)
  (unless (package-installed-p 'ess)
	(package-install 'ess))
  (unless (package-installed-p 'magit)
	(package-install 'magit))
  (unless (package-installed-p 'graphviz-dot-mode)
	(package-install 'graphviz-dot-mode))
  (unless (package-installed-p 'confluence)
	(package-install 'confluence))
  (unless (package-installed-p 'groovy-mode)
	(package-install 'groovy-mode))
  (unless (package-installed-p 'adaptive-wrap)
	(package-install 'adaptive-wrap))
  (unless (package-installed-p 'org)
	(package-install 'org))
  (unless (package-installed-p 'auctex)
  	(package-install 'auctex))
  (unless (package-installed-p 'markdown-mode)
	(package-install 'markdown-mode))
  (unless (package-installed-p 'yasnippet)
	(package-install 'yasnippet))
  (unless (package-installed-p 'iedit)
	(package-install 'iedit))
  (unless (package-installed-p 'elscreen)
	(package-install 'elscreen))

  )

