(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-unset-key "\e\e\e")
(global-set-key "\M-o" 'other-window)
(global-set-key "\C-\\" 'delete-trailing-whitespace)
(global-set-key "\M-n" 'toggle-truncate-lines)
(global-set-key [(f7)] 'replace-string)
(global-set-key "\C-x\C-b" 'switch-to-buffer)
(global-set-key "\M-i" 'previous-line)
(global-set-key "\M-k" 'next-line)
(global-set-key "\M-l" 'forward-char)
(global-set-key "\M-j" 'backward-char)
(global-set-key [(find)] 'move-beginning-of-line)
(global-set-key [(select)] 'move-end-of-line)
