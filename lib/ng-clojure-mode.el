(require 'lein)
(require 'clj-refactor)
(require 'dirtree)
(require 'clojure-refactor-menu)

(defun clojure-browse-libraries ()
  (interactive)
  (browse-url  "http://clojure-toolbox.com"))

(defun clojure-browse-clojars ()
  (interactive)
  (browse-url  "http://clojars.org"))

(defvar ng-clojure-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-t") 'lein-switch-between-source-and-test)
    (define-key map (kbd "C-!") 'mf/mirror-region-in-multifile)
    (define-key map (kbd "C-c C-t") 'lein-switch-between-source-and-test)
    map))

(defun open-sidebar ()
  (interactive)
  (let ((target-dir (or (lein-project-directory buffer-file-name)
			default-directory)))
    (dirtree target-dir)))
(define-minor-mode  ng-clojure-mode
  "Nick's special mode"
  ;; init value
  nil
  ;; lighter
  "NGCM"
  ;; keymap
  ng-clojure-mode-map
  (clojure-refactor-menu)
  (ac-cider-setup))

(provide 'ng-clojure-mode)
