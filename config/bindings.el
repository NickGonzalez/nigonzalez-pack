;; Place your bindings here.


;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-set-key [C-mouse-3] 'mouse-buffer-menu)
(global-set-key "\M-/" 'auto-complete)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key clojure-mode-map (kbd "C-c C-t") 'clojure-jump-between-tests-and-code)
(global-set-key (kbd "C-!") 'mf/mirror-region-in-multifile)
(define-key cider-mode-map (kbd "C-c C-t") 'clojure-jump-between-tests-and-code)
(global-set-key (kbd "s-n") 'scratch)
(global-set-key (kbd "s-t") 'terminal)
(global-set-key (kbd "s-d") 'finder)
(global-set-key (kbd "s-g") 'google)
(global-set-key [mouse-3]
  `(menu-item ,(purecopy "Menu Bar") ignore
              :filter (lambda (_)
                        (mouse-menu-bar-map))))
