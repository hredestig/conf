;; (defun ess-defined-in-package-p () 
;;   (interactive)
;;   (let ((map (make-sparse-keymap))
;;         (ess-tmp-buf (get-buffer-create " *TmpBuff*"))
;; 		(objname (or (and (region-active-p)
;; 						  (buffer-substring-no-properties (point) (mark)))
;; 					 (symbol-name (symbol-at-point)))))
;; 	(save-excursion 
;; 	  (if (not objname) 
;; 		  (error "no object at point "))
;; 	  (if (not ess-developer-packages)
;; 		  (error "not developing any packages "))
;; 	  (ess-command (concat "'" objname "'" "in ls(asNamespace('" 
;; 						   (car ess-developer-packages) "'))") ess-tmp-buf)
;; 	  (with-current-buffer ess-tmp-buf
;; 		(goto-char 1)
;; 		(if (search-forward-regexp "FALSE" nil t)
;; 			nil
;; 		  t)))))

(defun ess-fix-miscellaneous-henning (&optional from verbose)
  "Fix Miscellaneous S/R `ill-formation's from current \\[point].
 Particularly use \"<-\"and put spaces around operators."
  (interactive "d\nP"); Defaults: point and prefix (C-u)
  (save-excursion
    (if (string= ess-dialect "R")
        (progn
          (require 'ess-r-d)
          (R-fix-T-F from (not verbose))))

	(ess-replace-regexp-dump-to-src "#'*\\([A-Za-z0-9]\\)" "# \\1" nil verbose)
	(ess-replace-regexp-dump-to-src "^\\([ \t]*#\\)\\([^#']\\)"
									"\\1#\\2" nil verbose)

    ;; former C and matlab programmers leave trailing  ";" :
    (goto-char from) (ess-rep-regexp "; *$" "" nil 'literal verbose)
    (goto-char from) (ess-rep-regexp ";\\( *\\)#" "\\1#" nil nil verbose)

    ;;from R 1.9.x "_" is valid in names; here assume no initial / trailing '_'
    (goto-char from) (ess-rep-regexp " +_ *" " <- " nil 'literal verbose)
    (goto-char from) (ess-rep-regexp   "_ +" " <- " nil 'literal verbose)

    ;; ensure space around  "<-"  ---- but only replace if necessary:
    (goto-char from)
    (ess-rep-regexp "\\([^< \t\n]\\)\\(<<?-\\)" "\\1 \\2" nil nil verbose)
    (goto-char from)(ess-rep-regexp "<-\\([^ \t\n]\\)" "<- \\1" nil nil verbose)
    ;; ensure space around  "<" (not in "<-","<=","<<-")  and ">" (not ">=") :
    (goto-char from);; --> " <", care with "->":
    (ess-rep-regexp "\\([^-< \t\n]\\)\\([<>]\\)" "\\1 \\2" nil nil verbose)
    ;; ">" -> "> " , for "<", don't split "<-" nor "<<-":
    (goto-char from)
    (ess-rep-regexp "\\(>=?\\)\\([^= \t\n]\\)" "\\1 \\2" nil nil verbose)
    (goto-char from)
    (ess-rep-regexp "\\(<=?\\)\\([^-<= \t\n]\\)" "\\1 \\2" nil nil t)

    ;; -- ensure space around "=", "==", "!=" :
    (goto-char from) ;; --> " ="
    (ess-rep-regexp "\\([^=!<> ]\\)\\([=!]?\\)=" "\\1 \\2=" nil nil verbose)
    (goto-char from) (ess-rep-regexp "=\\([^= ]\\)" "= \\1" nil nil verbose)

    (goto-char from) ;; add a space between "{" and surrounding ..char:
    (ess-rep-regexp "{\\([.A-Za-z()]\\)" "{ \\1" 'fix nil verbose)
    (ess-rep-regexp "\\([()]\\){" "\\1 {" 'fix nil verbose)
    (goto-char from) ;; add a space between "}" and a preceding wordchar:
    (ess-rep-regexp "\\([A-Za-z0-9()]\\)}" "\\1 }" 'fix nil verbose)
    (ess-space-around "else" from verbose)

    (goto-char from) ;; add a space inside "){"
    (ess-rep-regexp "){" ") {" 'fix nil verbose)

    (goto-char from) ;; space after comma
    (ess-rep-regexp ",\\([^ ]\\)" ", \\1" 'fix nil verbose)

    ;; (goto-char from) ;; space before operators
    ;; (ess-rep-regexp "\\([a-zA-Z0-9]\\)\\([\\+-\\*\\=\\/]\\)" "\\1 \\2" 'fix nil verbose)

    ;; (goto-char from) ;; space after operators
    ;; (ess-rep-regexp "\\([\\+-\\*\\=\\/]\\)\\([a-zA-Z0-9]\\)" "\\1 \\2" 'fix nil verbose)

    ;; add a newline and indent before a "}"
    ;; --- IFF there's NO "{" or "#" AND some NON-white text on the same line:
    ;;D (if verbose (message "\t R-fix-misc..: Hard.. '}'"))
    (goto-char from)
    (ess-rep-regexp "^\\([^#{\n]*[^#{ \t\n]+[ \t]*\\)}[ \t]*$"
                    "\\1\n}" 'fix nil verbose)
    ))
