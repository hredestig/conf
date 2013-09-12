(when (or (string= system-name "hemulen") 
		  (string= system-name "knyttet"))
  (set-default-font "DejaVu Sans Mono 10")
  (setq prefix "/home/henning/.emacs.d/lisp/")
  (add-to-list 'load-path "/home/henning/Dropbox/ess/lisp")
)

(when (string= system-name "srv-biogrid-m-2.be.bayercropscience")
  (setq prefix "/home/gbfjc/.emacs.d/lisp/")
  (add-to-list 'load-path (concat prefix "ess-svn-rep/lisp"))
  ;; (add-to-list 'load-path (concat prefix "iedit"))
  ;; (add-to-list 'load-path (concat prefix "org-mode/lisp")) 
)

(when (string= system-name "ABEGENC2007")
  (set-default-font
   "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")
  (setq tramp-auto-save-directory "c:\\tmp")
  (setq-default inferior-R-program-name "c:/opt/R/bin/R.exe")
  (setq tramp-default-method "psftp")
  (setq prefix "C:/Users/gbfjc/.emacs.d/lisp/")
  (setq-default inferior-R-program-name "c:/opt/R/bin/R.exe")
  ;; (setq url-proxy-services '(("http" . "proxy-bcs.bayerbbs.net:8080")))
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
