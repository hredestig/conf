(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(when (or (string= system-name "hemulen") 
		  (string= system-name "knyttet"))
  (set-default-font "DejaVu Sans Mono 10")
  (setq prefix "/home/henning/.emacs.d/lisp/")
  (add-to-list 'load-path "/home/henning/Dropbox/ess/lisp")
)

(when (string= system-name "gquest")
  (setq prefix "/home/gbfjc/.emacs.d/lisp/")
)

(when (string= system-name "ABEGENC2007")
  (setq prefix "C:/Users/gbfjc/.emacs.d/lisp/")
)

(add-to-list 'load-path prefix)

;; have libraries in particular paths take precedence over other
;; libraries elsewhere with the same name, put those paths at the
;; beginning of ‘load-path’.
(let ((default-directory prefix))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path)))
           (normal-top-level-add-subdirs-to-load-path))
         load-path)))
