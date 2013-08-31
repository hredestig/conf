(setq-default ring-bell-function (defun fun ()))
(blink-cursor-mode 0)

;; emacs client / server
(if (and (boundp 'server-process)
     (memq (process-status server-process) '(connect listen open run)))
    (progn 
      (server-start)
      ;; make client start new frame
      (add-hook 'server-switch-hook
		(lambda nil
		  (let ((server-buf (current-buffer)))
		    (bury-buffer)
		    (switch-to-buffer-other-frame server-buf))))
      ;; make client delete the frame on exit
      (add-hook 'server-done-hook 'delete-frame)
      ;; ...and make it kill any created buffers
      (add-hook 'server-done-hook (lambda nil (kill-buffer nil)))))

;; turn on font-lock mode
(global-font-lock-mode t)
;; dont use windows like selection modes
(delete-selection-mode nil)
;; enable visual feedback on selections
(setq-default transient-mark-mode nil)

(setq kill-whole-line 1)
(setq comment-column 50)

;; drop the gui
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t)

(put 'keyboard-escape-quit 'disabled  "")
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
