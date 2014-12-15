
(defun nick-version ()
     (interactive)
     (message "Nick Mode Version 1.0"))

(defun nick-window-setup ()
  (transparency 80)
  (maximize-windowcs)
)

(defvar nick-mode-map 
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "A-d") 'finder)
    (define-key map "\M-/" 'auto-complete)
    (define-key map [(control tab)] 'bury-buffer)
    (define-key map [(control shift tab)] 'unbury-buffer)
    (define-key map [(meta tab)] 'other-window)
    (define-key map [(control x) (control b)] 'ibuffer)
    (define-key map (kbd "M-x") 'smex)
    (define-key tool-bar-map [finder]
      '(menu-item "Finder" finder
		  "new"))
    (easy-menu-define nick-mode-menu map
      "Menu for Nick mode"
      `("Custom"
        ["Git" magit-status]
	["Export Color Theme" color-theme-print]
	["Finder" finder]
	["Terminal" terminal]
	"--"
        ["Version info" nick-version]))
    map))

(define-minor-mode  nick-mode
  "Nick's special mode"
  ;; init value
  nil
  ;; lighter
  "NG"
  ;; keymap
  nick-mode-map
  :global t

  (autoload 'dirtree "dirtree" "Add directory to tree view" t)
  (add-hook 'window-setup-hook          #'window-setup-hook) 

  (transparency 80)
  (recentf-open-files))


(provide 'nick-mode)
