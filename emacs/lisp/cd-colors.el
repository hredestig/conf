;; Largely a copy of color-theme-pmade.el

(let*
    (
     (ol1 "#FFBB66")
     (ol2 "#AAEE77")
     (ol3 "#88CCEE")
     (ol4 "#EE88FF")
     (ol5 "#FFBB66")
     (ol6 "#AAEE77")
     (ol7 "#88CCEE")
     (ol8 "#EE88FF")
     (comment "#229988")
     (comment-delimiter "#888888")
     (string "#A5F26E")
     (keyword "#CC7832")
     (constant "#6BCFF7")
     (type "#8888ff")
     (variable "#D0D0F3")
     (funct "#E8BF6A")
     (builtin "#59ACC2")
     (preproc "#202020")
     (todo-bg "#BB0000")
     (done-bg "#004400")
     (cancelled-bg "#777700")
     (delegated-bg "#BB9900")
     (started-bg "#EE6600")
     (waiting-bg "#EE9900")
     (project-bg "#774488")
     (someday-bg "#444444")
     (checkbox-bg "#777777")
     (checkbox-todo-bg "#DD3333")
     (checkbox-done-bg "#447733")
     (date "#55DDCC")
     (column-bg "#222222")
     (column-title-bg "DarkGreen")
     (special-kwd "#FFFF88")
     (table "#99DDFF")
     (formula "#FF7777")
     (priority "#FFFF22")
     (tag "#AAAAAA")
     (modeline-inactive "#777777")
     (modeline-active "#77AA99")
     (box '(:box (:line-width 1 :style released-button)))

     (main
      (list
       `(cursor ((t (:background ,modeline-active :foreground "black"))))
       `(text-cursor ((t (:background "yellow" :foreground "black"))))
       ;; `(match ((t :background "#4A6152")))
       `(match ((t :background "#111111")))
       `(region ((t :background "#505C74")))
       `(hl-line ((t :background "#000000" :underline "#444444")))
       `(font-lock-comment-face ((t (:italic t :foreground ,comment))))
       `(font-lock-comment-delimiter-face ((t (:foreground ,comment-delimiter))))
       `(font-lock-string-face ((t (:foreground ,string))))
       `(font-lock-keyword-face ((t (:bold t :foreground ,keyword))))
       `(font-lock-warning-face ((t (:underline "red"))))
       `(font-lock-constant-face ((t (:foreground ,constant))))
       `(font-lock-type-face ((t (:bold t :foreground ,type))))
       `(font-lock-variable-name-face ((t (:foreground ,variable))))
       `(font-lock-function-name-face ((t (:bold t :foreground ,funct))))
       `(font-lock-builtin-face ((t (:foreground ,builtin))))
       `(font-lock-preprocessor-face ((t (:background ,preproc))))
       `(ecb-default-highlight-face ((t (:background ,string :foreground "#000000"))))
       `(show-paren-match ((t (:background "#DA44FF" :foreground "#F6CCFF"))))
       `(show-paren-mismatch ((t (:background "#DA0000" :foreground "#F6CCFF"))))
       
       ;; Outline Mode and Org-Mode
       `(outline-1 ((t (:foreground ,ol1 :bold t))))
       `(outline-2 ((t (:foreground ,ol2 :bold t))))
       `(outline-3 ((t (:foreground ,ol3 :bold t))))
       `(outline-4 ((t (:foreground ,ol4 :bold t))))
       `(outline-5 ((t (:foreground ,ol5 :bold nil))))
       `(org-level-1 ((t (:inherit outline-1))))
       `(org-level-2 ((t (:inherit outline-2))))
       `(org-level-3 ((t (:inherit outline-3))))
       `(org-level-4 ((t (:inherit outline-4))))
       `(org-level-5 ((t (:inherit outline-5))))
       `(org-level-6 ((t (:foreground ,ol6))))
       `(org-level-7 ((t (:foreground ,ol7))))
       `(org-level-8 ((t (:foreground ,ol8))))
       `(org-special-keyword ((t (:foreground ,special-kwd))))
       `(org-agenda-date ((t (:inherit font-lock-type-face))))
       `(org-agenda-date-weekend ((t (:inherit org-agenda-date))))
       `(org-scheduled-today ((t (:foreground "#ff6ab9" :italic t))))
       `(org-scheduled-previously ((t (:foreground "#d74b4b"))))
       `(org-upcoming-deadline ((t (:foreground "#d6ff9c"))))
       `(org-warning ((t (:foreground "#d74b4b" :italic t :bold t))))
       `(org-table ((t (:foreground ,table))))
       `(org-formula ((t (:foreground ,formula))))
       `(org-date ((t (:foreground ,date))))
       `(org-link ((t (:underline t))))
       `(org-tag ((t (:foreground ,tag))))
       `(org-hide ((t (:foreground "#191919"))))
       `(org-todo ((t (:background ,todo-bg :foreground "white" ,@box))))
       `(org-done ((t (:background ,done-bg :foreground "white" ,@box))))
       `(org-checkbox ((t (:background ,checkbox-bg :foreground "white" ,@box))))
       `(org-checkbox-statistics-todo ((t (:background ,checkbox-todo-bg :foreground "white" ,@box))))
       `(org-checkbox-statistics-done ((t (:background ,checkbox-done-bg :foreground "white" ,@box))))
       `(org-column ((t (:background ,column-bg))))
       `(org-column-title ((t (:background ,column-title-bg :foreground "white" ,@box))))
       `(cd-org-todo-kwd-face ((t (:background ,todo-bg :foreground "white" ,@box))))
       `(cd-org-done-kwd-face ((t (:background ,done-bg :foreground "white" ,@box))))
       `(cd-org-project-kwd-face ((t (:background ,project-bg :foreground "white" ,@box))))
       `(cd-org-waiting-kwd-face ((t (:background ,waiting-bg :foreground "white" ,@box))))
       `(cd-org-someday-kwd-face ((t (:background ,someday-bg :foreground "white" ,@box))))
       `(cd-org-started-kwd-face ((t (:background ,started-bg :foreground "white" `@box))))
       `(cd-org-cancelled-kwd-face ((t (:background ,cancelled-bg :foreground "white" ,@box))))
       `(cd-org-delegated-kwd-face ((t (:background ,delegated-bg :foreground "white" ,@box))))
       
       ;; Muse Mode
       `(muse-header-1 ((t (:foreground "#D6B163" :height 1.5 :inherit variable-pitch))))
       `(muse-header-2 ((t (:foreground ,string :height 1.4 :inherit variable-pitch))))
       `(muse-header-3 ((t (:foreground "#4A77DE" :height 1.3 :inherit variable-pitch))))
       `(muse-header-4 ((t (:foreground "#529DB0" :height 1.2 :inherit variable-pitch))))
       `(muse-header-5 ((t (:foreground ,keyword :height 1.1 :inherit variable-pitch))))
       `(muse-verbatim ((t (:foreground "#B150E7"))))
       `(muse-link     ((t (:foreground "#5DA8F6"))))
       `(muse-bad-link ((t (:foreground "#FF8882"))))
       
       ;; ERB (Ruby Embedded in HTML)
       `(erb-face ((t (:background "grey15"))))
       `(erb-delim-face ((t (:foreground "#FFAEEA" :background "grey15"))))
       `(erb-out-face ((t (:background "grey15"))))
       `(erb-out-delim-face ((t (:foreground "#FFAEEA" :background "grey15"))))
       `(erb-comment-delim-face ((t (:foreground "#B150E7" :background "grey15"))))
       `(erb-comment-face ((t (:italic t :foreground "#B150E7" :background "grey15"))))
       
       ;; Diff Mode
       `(diff-added ((t (:foreground "#d7ffaf"))))
       `(diff-changed ((t (:foreground "#ffc28d"))))
       `(diff-removed ((t (:foreground "#ff9999"))))
       `(diff-indicator-added ((t (:background "#d7ffaf" :foreground "#000000"))))
       `(diff-indicator-chnaged ((t (:background "#ffc28d" :foreground "#000000"))))
       `(diff-indicator-removed ((t (:background "#ff9999" :foreground "#000000"))))
       `(diff-context ((t (:foreground "#888888"))))
       
       ;; Magit (Git GUI)
       `(magit-branch ((t (:foreground "#E07BE0"))))
       `(magit-diff-add ((t (:inherit 'diff-added))))
       `(magit-diff-del ((t (:inherit 'diff-removed))))
       `(magit-diff-file-header ((t (:inherit 'font-lock-constant-face))))
       `(magit-diff-hunk-header ((t (:inherit 'font-lock-keyword-face))))
       `(magit-diff-none ((t (:inherit 'font-lock-comment-delimiter-face))))
       `(magit-header ((t (:inherit 'org-level-1))))
       `(magit-item-highlight ((t (:background "#000000"))))
       
       ;; Compilation
       `(compilation-info ((t (:inherit 'font-lock-string-face :bold t))))
       `(compilation-error ((t (:background "sienna4" :bold t))))
       `(compilation-line-number ((t (:foreground "#FF6666" :bold t))))
       `(flyspell-incorrect ((t :underline "magenta")))
       `(flyspell-duplicate ((t :underline "yellow")))
       `(flymake-errline ((t :underline "red")))
       `(flymake-warnline ((t :underline "green")))
       
       ;; nXML
       `(nxml-element-colon-face    ((t (:bold t :foreground "#92D229"))))
       `(nxml-element-prefix-face    ((t (:bold t :foreground "#92D229"))))
       `(nxml-attribute-value-delimiter-face ((t (:inherit 'font-lock-string-face))))
       `(nxml-cdata-section-content-face ((t (:inherit 'font-lock-string-face))))
       `(nxml-attribute-value-face ((t (:inherit 'font-lock-string-face))))
       `(nxml-attribute-local-name-face ((t (:inherit 'font-lock-constant-face))))
       `(nxml-attribute-local-name-face ((t (:inherit 'font-lock-constant-face))))
       `(nxml-entity-ref-name-face ((t (:inherit 'font-lock-constant-face))))
       `(nxml-element-colon-face    ((t (:inherit 'font-lock-function-name-face))))
       `(nxml-element-prefix-face    ((t (:inherit 'font-lock-function-name-face))))
       `(nxml-element-local-name-face    ((t (:inherit 'font-lock-function-name-face))))
       `(nxml-tag-delimiter-face    ((t (:inherit 'font-lock-function-name-face))))
       `(nxml-tag-slash-face    ((t (:inherit 'font-lock-function-name-face))))
       `(nxml-comment-delimiter-face ((t (:inherit 'font-lock-comment-face))))
       `(nxml-comment-content-face ((t (:inherit 'font-lock-comment-face))))
       
       ;; ido
       `(ido-first-match ((t (:inherit 'font-lock-string-face))))
       `(ido-subdir ((t (:inherit 'font-lock-function-name-face))))
       
       ;; ElScreen
       `(elscreen-tab-background-face ((t (:background "#787878" ,@box))))
       `(elscreen-tab-current-screen-face ((t (:background "#969696" :foreground "#000000"
							   :height 1.1 :inherit variable-pitch))))
       `(elscreen-tab-other-screen-face ((t (:background "#787878" :foreground "#444444"
							 :height 1.1 :inherit variable-pitch))))
       
       ;; ERC
       `(erc-notice-face ((t (:foreground "#444444"))))
       `(erc-my-nick-face ((t (:foreground "#888888" :bold t))))
       `(erc-input-face ((t (:foreground "#A6E2DC"))))
       `(erc-timestamp-face ((t (:foreground "#2d412b"))))
       `(erc-prompt-face ((t (:background "#223c63" :foreground "white" ,@box))))
       
       ;; Minibuffer
       `(minibuffer-noticeable-prompt ((t (:inherit 'font-lock-builtin-face :bold t))))
       
       ;; Modeline and Things in the Modeline
       `(modeline ((t (:background ,modeline-active :foreground "black" ,@box))))
       `(mode-line-inactive ((t (:background ,modeline-inactive :foreground "#000000" ,@box))))
       `(modeline-buffer-id ((t (:background nil :foreground "black"))))
       `(modeline-mousable ((t (:background "DarkRed" :foreground "white"))))
       `(modeline-mousable-minor-mode ((t (:background "DarkRed" :foreground "white"))))
       `(window-number-face ((t (:foreground "#FF7777"))))
       
       ;; Bookmarks
       `(bm-fringe-face ((t (:foreground "#ff8e43"))))
       
       ;; Non-Standard Faces
       `(cd-fixme-face ((t (:background "#670000" :foreground "#ffffff" :bold t ,@box))))
       
       ;; Remaining Junk
       `(completion-dynamic-face ((t (:inherit `match))))
       `(highlight ((t (:inherit `match)))))))

  ;; Function to set my color theme
  (eval `(defun color-theme-cd ()
	   (interactive)
	   (apply 'custom-set-faces ',main))))

(defun color-theme-cd-gui ()
  (color-theme-cd)
  (custom-set-faces
   `(default ((t (:background "#191919" :foreground "#FFFFFF"))))))

(defun color-theme-cd-terminal ()
  (color-theme-cd)
  (custom-set-faces
   `(default ((t (:background nil :foreground "brightwhite"))))
   `(font-lock-variable-name-face ((t (:foreground "blue"))))
   `(font-lock-string-face ((t (:foreground "green"))))
   `(font-lock-builtin-face ((t (:foreground "blue" :bold t))))
   `(font-lock-constant-face ((t (:foreground "cyan"))))
   `(font-lock-type-face ((t (:foreground "green" :bold t))))
   `(show-paren-match ((t (:background "red" :foreground "yellow" :bold t))))
   `(font-lock-comment-delimiter-face ((t (:foreground "white"))))
   `(font-lock-comment-face ((t (:italic t :foreground "magenta"))))))

;; Create some faces
(copy-face 'font-lock-warning-face 'cd-fixme-face)
(make-face 'cd-org-todo-kwd-face)
(make-face 'cd-org-done-kwd-face)
(make-face 'cd-org-project-kwd-face)
(make-face 'cd-org-pending-kwd-face)
(make-face 'cd-org-reading-kwd-face)
(make-face 'cd-org-someday-kwd-face)
(make-face 'cd-org-project-kwd-face)
(make-face 'cd-org-started-kwd-face)
(make-face 'cd-org-waiting-kwd-face)
(make-face 'cd-org-cancelled-kwd-face)
(make-face 'cd-org-delegated-kwd-face)

 ;; Load color-theme
(if terminal-frame
    (color-theme-cd-terminal)
  (color-theme-cd-gui))

;; Notes
;; * To see all faces in effect: list-faces-display
