(set-default-font "DejaVu Sans Mono 10")
(setq prefix "/home/henning/.emacs.d/lisp/")

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
