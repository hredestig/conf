;; iedit
(require 'iedit)
(global-set-key "\C-ct" 'iedit-mode)

;; outlook
(require 'outlookedit)

;; groovy
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))


;; sh
(defun sh-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "shell"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step 
      (goto-char max)
      (next-line))
    ))

(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))
(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))

;; confluence
(require 'confluence)
(setq confluence-url "http://confluence.be.bayercropscience/rpc/xmlrpc")

;; yas
(require 'yasnippet)
(when (>= emacs-major-version 24)
  (yas-global-mode 1))
(yas/load-directory (concat prefix "yasnippets")) 

;; cua
(setq cua-enable-cua-keys nil)
(setq cua-toggle-set-mark nil)
(cua-mode)
(global-set-key "\C-ci" 'cua-set-rectangle-mark)

;; markdown
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
	  (cons '("\\.Rmd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
	  (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq reftex-plug-into-AUCTeX t)

;; make eshell use ansi visual mode after these commands
(eval-after-load "em-term"
  '(add-to-list 'eshell-visual-commands "vim"))
(eval-after-load "em-term"
  '(add-to-list 'eshell-visual-commands "zsh"))
(eval-after-load "em-term"
  '(add-to-list 'eshell-visual-commands "perldoc"))
(eval-after-load "em-term"
  '(add-to-list 'eshell-visual-commands "mc"))
(eval-after-load "em-term"
  '(add-to-list 'eshell-visual-commands "bash"))
(eval-after-load "em-term"
  '(add-to-list 'eshell-visual-commands "lynx"))

;; python
(load "python-extras.el")
(add-hook 
 'python-mode-hook (lambda ()
		     (local-set-key "\C-c\"" 'python-insert-quotes)
		     (local-set-key "\C-c\'" 'python-insert-single-quotes)
		     (local-set-key "\C-c\C-e" 'python-extras-run-line)
		     (local-set-key "\C-c\C-g" 'python-extras-run-line-no-indent)
		     ))

;; ess
(load "ess-site.el")
(require 'ess-site)
(setq-default inferior-R-args "--no-restore-history --no-save --no-restore ")
(setq ess-eval-visibly-p nil)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(setq comint-scroll-show-maximum-output t)
(setq ess-smart-S-assign-key "<")
(ess-toggle-underscore nil)
(ess-toggle-underscore nil)
(setq ess-use-tracebug t)
(setq ess-roxy-str "#'")
(add-hook 'ess-mode-hook (lambda ()
			   (subword-mode t)
			   (highlight-lines-matching-regexp ".\\{95\\}" "shadow")
			   ))
(defun R2 ()
  (interactive)
  (let ((inferior-R-program-name "/tools/bioinfo/app/R-2.14.2/bin/R"))
	(R)))

;; org-mode
(require 'org-install)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "WAIT(w@/!)" "|" "DONE(d!)" 
				  "CANCELED(c@)"  "DELEGATED(e@)")))
(setq org-export-html-xml-declaration
	  '(("html" . "<!-- <xml version=\"1.0\" encoding=\"utf-8\"> -->")))
(setq org-export-with-LaTeX-fragments t)
(setq org-hide-block-startup t)
(setq org-hide-leading-stars nil)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(load "2org.el")
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((dot . t)))

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode t)
			   (abbrev-mode)
			   (setq ess-dialect "R")
			   (font-lock-add-keywords nil
						   '(("\\\\cite.\\{0,1\\}{[^}]*}" .
						      font-lock-keyword-face)))
			   (font-lock-add-keywords nil
						   '(("\\\\ref.\\{0,1\\}{[^}]*}" .
						      font-lock-keyword-face)))

			   (local-set-key "\C-c(" '2org-insert-inline-math)
			   (local-set-key "\C-cE" '2org-insert-equation)
			   (local-set-key "\C-cc" 'org-babel-new-hash-no-eval)
			   (local-set-key "\C-c\C-z" 'ess-switch-to-end-of-ESS)
			   (local-set-key "\C-c\C-g" 'org-set-tags)))


;; graphviz
(load "graphviz-dot-mode.el")

;; markerpen
(require 'markerpen)
(global-set-key (kbd "C-c m") 'markerpen-mark-region)
(global-set-key (kbd "C-c M") 'markerpen-clear-all-marks)

;; jira
;; (require 'org-jira) 

;; adaptive-wrap
(require 'adaptive-wrap)

;; elscreen
(load "elscreen" "ElScreen" t)
(setq elscreen-display-tab nil)
(elscreen-start)

;; dired
(setq dired-recursive-deletes 'top)
(setq dired-recursive-copies 'top)
(defun dired-do-shell-command-in-background (command)
  "In dired, do shell command in background on the file or directory named on this line."
  (interactive
   (list (dired-read-shell-command (concat "& on " "%s: ") nil (list (dired-get-filename)))))
  (call-process command nil 0 nil (dired-get-filename)))
(setq dired-listing-switches "-lhB")
(require 'dired-x nil t)		;dired-x
(add-hook 'dired-mode-hook
	  (lambda ()
	    (setq dired-guess-shell-alist-user
		  (list
		   (list "\\.jpg$" "display")
		   (list "\\.jpeg$" "display")
		   (list "\\.eps$" "display")
		   (list "\\.png$" "display")
		   (list "\\.gif$" "display")
		   (list "\\.pdf$" "xpdf")
		   (list "\\.ps$" "evince")
		   (list "\\.xls$" "gnumeric")
		   (list "\\.ods$" "oocalc")
		   (list "\\.ppt$" "ooimpress")
		   (list "\\.gnumeric$" "gnumeric")
		   (list "\\.doc$" "oowriter")
		   (list "\\.odt$" "openoffice.org2.3")
		   ))

	    (load "dired-x")
 	    (local-set-key "\M-o" 'other-window)
	    (local-set-key "&" 'dired-do-shell-command-in-background)
	    ))
(define-key dired-mode-map "k" 'dired-kill-subdir)

;; ispell
(setq ispell-tex-skip-alists
	  (list
	   (append
		(car ispell-tex-skip-alists)
		'(("\\\\cite"            ispell-tex-arg-end)
		  ("\\\\citep"            ispell-tex-arg-end)
		  ("\\\\nocite"          ispell-tex-arg-end)
		  ("\\\\includegraphics" ispell-tex-arg-end)
		  ("\\\\bibliography"    ispell-tex-arg-end)
		  ("\\\\ref"             ispell-tex-arg-end)
		  ("\\\\web"             ispell-tex-arg-end)
		  ("\\\\code"            ispell-tex-arg-end)
		  ("\\\\label"           ispell-tex-arg-end)))
	   (cadr ispell-tex-skip-alists)))
(ispell-change-dictionary "english")

;; colors
(load "cd-colors.el")
