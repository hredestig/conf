(defun org-babel-new-hash-no-eval ()
  "update hash without evaluation"
  (interactive)
  (save-excursion
    (let ((new-hash (org-babel-sha1-hash))
		    (res-p (org-babel-where-is-src-block-result))
			  (name (car (cdr (nreverse (org-babel-get-src-block-info))))))
	  (if res-p
		  (progn
			(goto-char res-p)
			(delete-region res-p (point-at-eol)))
		(re-search-forward "#\\+end_src")
		(match-end 0)
		(insert "\n\n"))
	  (insert (concat "#+RESULTS[" new-hash "]: " name))))
	(org-babel-hide-hash))

(defun 2org-fill-caption ()
  "Fill the caption currently being edited."
  (interactive)
  (save-excursion
    (re-search-backward "\n#\+CAPTION: " (point-min) t 1)
    (match-end 0)
    (beginning-of-line)
    (setq beg (point))
    (re-search-forward "#\+CAPTION: [.]*\n[^\(#\+CAPTION\)]" (point-max) t 1)
    (match-beginning 0)
    (next-line)
 
    (setq end (point))
    (narrow-to-region beg end)
    (setq fill-prefix "#+CAPTION: ")
    (fill-region-as-paragraph beg end)
    (setq fill-prefix "")
    (widen)
  )
)

(defun 2org-reftex-view-crossref () 
  "use reftex-view-citation to get cite entry"
    (interactive)
  (let ((reftex-docstruct-symbol 'rds)
	(reftex-cite-format "\\cite{%l}")
	rds bib)
    (save-excursion
      (save-restriction
	(widen)
	(let ((case-fold-search t)
	      (re "^#\\+bibliography:[ \t]+\\([^ \t\n]+\\)"))
	  (if (not (save-excursion
		     (or (re-search-forward re nil t)
			 (re-search-backward re nil t))))
	      (error "No bibliography defined in file")
	    (setq bib (concat (match-string 1) ".bib")
		  rds (list (list 'bib bib)))))))
    (call-interactively 'reftex-view-crossref)))

;; (defun 2org-toggle-eval () 
;;   "toggle evaluation"
;;   (interactive)
;;   (save-excursion
;;     (beginning-of-line)
;;     (if (re-search-forward "#+BEGIN_SRC R eval" nil t)
;; 	(replace-match "#+BEGIN_SRC R no-eval" nil nil)
;;       (re-search-forward 
    
(defun 2org-run-setup ()
  (interactive)
  (save-excursion
	(org-babel-goto-named-src-block "setup-R")
	(org-babel-execute-src-block)))

(defun 2org-src-field (type)
  "Inserts a simple source field"
  (interactive "MType? ")
  (insert "#+srcname: \n")
  (insert "#+begin_src " type " \n")
  (setq here (point))
  (insert "\n#+end_src")
  (goto-char here)
  )

(defun 2org-rsrc-field (lab)
  "Inserts a simple R field"
  (interactive "MLabel? ")
  (insert "#+srcname: " lab "\n")
  (insert "#+begin_src R\n")
  (setq here (point))
  (insert "\n#+end_src")
  (goto-char here)
  )


(defun 2org-rnw-field (lab)
  "Inserts a simple figure field"
  (interactive "MLabel? ")
  (insert "#+BEGIN_SRC R\n")
  (insert "::" lab ", results=hide, echo=false\n\n")
  (setq here (point))
  (insert "\n\n@\n")
  (insert "#+END_SRC\n")
  (goto-char here)
  )

(defun 2org-tex2rnw (&optional buffer)
  "convert org file to rnw and tex file"
  ;; org-export-as-lates
  ;; switch to created tex file
  ;; do tex2rnw
  ;; sweave resulting rnw file, (or do ess-swv-PDF)

  (interactive)
  (save-excursion
    (setq rnwfile (replace-regexp-in-string 
		   "\.org$" "\.Rnw"
		   (file-relative-name (buffer-file-name))))
    (setq texfile (replace-regexp-in-string 
		   "\.org$" "\.tex"
		   (file-relative-name (buffer-file-name))))
    (setq orgfile (buffer-file-name))

    (if (string= buffer-file-name texfile)
	(error "wrong file type"))

    (org-export-as-latex 3 nil nil texfile)
    (set-buffer texfile)
    (if (get-buffer rnwfile)
	(kill-buffer rnwfile))

    (goto-char (point-min))
    (while (re-search-forward "^\\\\begin{verbatim}\n::" nil t)
      (replace-match "<<" nil nil))
    (goto-char (point-min))
    (while (re-search-forward "^<<\\(.+\\)" nil t)
      (replace-match "<<\\1>>=" nil nil))
    (goto-char (point-min))
    (while (re-search-forward "@\n+\\\\end{verbatim}" nil t)
      (replace-match "@" nil nil))
    (goto-char (point-min))
;;     (while (re-search-forward "documentclass\\\[11pt\\\]" nil t)
;;       (replace-match "documentclass[pdflatex,11pt]" nil t))

    (goto-char (point-max))
    (insert "\n")
    (write-file rnwfile)
    ;;(switch-to-buffer rnw)
    (ess-swv-weave)
    ;(switch-to-buffer rnwfile)
    (find-file orgfile)
    ;; (auto-revert-mode)
    ;; (TeX-PDF-mode)
    ;(ess-swv-PDF)
    )
  )


(defun 2org-insert-equation () 
  (interactive)
  (insert "\\begin{equation}\n\n")
  (insert "\\end{equation}\n")
  (previous-line)
  (previous-line)
)

(defun 2org-insert-inline-math () 
  (interactive)
  (insert "\\(\\)")
  (backward-char)
  (backward-char)
)


(defun 2org-surround (what)
  (interactive "MWhat? ")
  (if (region-active-p)
      (progn 
	(narrow-to-region (region-beginning) (region-end))
	(beginning-of-line)
	(insert what)
	(end-of-line)
	(insert what)
	(widen))
    (progn
      (insert what)
      (insert what)
      (backward-char))))

(local-set-key "\C-cd" '2org-surround)
(local-set-key "\C-cp" '2org-fill-caption)
(local-set-key "\C-cf" '2org-rnw-field)
(local-set-key "\C-cR" '2org-rsrc-field)
;; (local-set-key "\C-cs" '2org-src-field)
(local-set-key "\C-cs" '2org-run-setup)
;; (local-set-key "\C-cg" '2org-rnw-fig)
(local-set-key "\C-c\C-x&" '2org-reftex-view-crossref)
(local-set-key "\C-cw" '2org-tex2rnw)
(local-set-key "\C-c(" '2org-insert-inline-math)
(local-set-key "\C-cE" '2org-insert-equation)
