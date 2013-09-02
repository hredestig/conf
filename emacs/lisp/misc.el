(defun dp () 
  (interactive) 
  (let ((disp (with-temp-buffer
			   (insert-file-contents "~/.display")
			   (buffer-string))))
	(setq prevdisp (getenv "DISPLAY"))
	(setenv "DISPLAY" (replace-regexp-in-string "\n" "" disp)))
	(message (concat "was \"" prevdisp "\" is now \"" (getenv "DISPLAY") "\"")))
