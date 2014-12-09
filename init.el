;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("Marmalade" . "http://marmalade-repo.org/") t)
  (add-to-list 'package-archives '("Elpa" . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives '("SC"   . "http://joseito.republika.pl/sunrise-commander/") t))




(setq ac-auto-start nil)
(require 'lein)
(require 'utils)

(setq menu-bar-mode t)

(add-hook 'clojure-mode-hook (lambda ()
                               (require 'clojure-mode-extra-font-locking)
                               (require 'clojure-refactor-menu)
                               (toggle-truncate-lines t)
                               (hideshowvis-enable)
                               (cljr-add-keybindings-with-prefix "C-c C-m")
                               (clojure-refactor-menu)))

(add-hook 'cider-mode-hook (lambda ()
                             (cljr-add-keybindings-with-prefix "C-c C-m")
                             (toggle-truncate-lines t)
                             (hideshowvis-enable)))


(require 'color-theme)
(color-theme-initialize)
(require 'my-color-theme)
(require 'my-color-theme-dark)
(my-color-theme-dark)
(menu-bar-mode)
(tabbar-mode)
(toggle-truncate-lines t)
