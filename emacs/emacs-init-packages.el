(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . 
				   "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (unless package-archive-contents
	(package-refresh-contents))
  (setq package-load-list '(all))
  (package-initialize)
  )

