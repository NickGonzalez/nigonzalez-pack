;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.
(defmacro nullify ( &rest sexp) nil)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("Elpa" . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives '("SC"   . "http://joseito.republika.pl/sunrise-commander/") t))

(setq ac-auto-start nil)
(require 'lein)
(require 'utils)

(setq menu-bar-mode t)

(autoload 'clojure-mode "clojure-mode" "Clojure mode" t)
(add-hook 'clojure-mode-hook (lambda ()
                               (require 'clojure-mode-extra-font-locking)
                               (require 'clojure-refactor-menu)
                               (toggle-truncate-lines t)
                               (hideshowvis-enable)
			       (auto-complete-mode t)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))
(autoload 'cider-mode "cider-mode" "Cider mode" t)
(add-hook 'cider-mode-hook (lambda ()
                             (cljr-add-keybindings-with-prefix "C-c C-m")
                             (toggle-truncate-lines t)
			     (auto-complete-mode t)
                             (hideshowvis-enable)))


(add-hook 'cider-repl-mode-hook (lambda ()
                             (toggle-truncate-lines t)
			     (auto-complete-mode t)
                             (hideshowvis-enable)))


(require 'color-theme)
(color-theme-initialize)
(require 'my-color-theme)
(require 'my-color-theme-dark)
(my-color-theme-dark)
(menu-bar-mode)
(tabbar-mode)
(toggle-truncate-lines t)


(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'cider-mode)
(add-hook 'clojure-mode-hook          #'ng-clojure-mode)
(add-hook 'cider-mode-hook            #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)


(require 'ido)

(ido-mode t)

(global-auto-complete-mode t)
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")



(require 'nick-mode)
(require 'ng-clojure-mode)

(nick-mode t)

(helm-mode t)
(require 'spaces)

