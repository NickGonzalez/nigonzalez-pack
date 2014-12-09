(defun clojure-refactor-menu
  ()
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Add Declaration" cljr-add-declaration])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Add Import" cljr-add-import-to-ns])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Add Require" cljr-add-require-to-ns])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Toggle Private" cljr-cycle-privacy])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Destructure" cljr-destructure-keys])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Destructure" cljr-destructure-keys])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Rename File" cljr-rename-file])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Cycle Collection" cljr-cycle-coll])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Create Comparator" cljr-create-comparator])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Remove unused requires" cljr-remove-unused-requires])
  (easy-menu-add-item nil
                      '("Clojure" "Refactor")
                      ["Remove unused requires" cljr-project-clean])

  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Build & Run" (lambda ()
                                       (interactive)
                                       (lein "do jar, run "))])
  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Rebuild & Run" (lambda ()
                                         (interactive)
                                         (lein "do sub jar, sub install, jar, run "))])
  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Build" lein-jar])

  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Clean" lein-clean])

  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Rebuild" (lambda ()
                                   (interactive)
                                   (lein "do clean, jar, uberjar"))])
  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Build All" (lambda ()
                                     (interactive)
                                     (lein "do sub clean, sub jar, sub install, clean, jar, uberjar "))])
  (easy-menu-add-item nil
                      '("Clojure" "Build")
                      ["Run Lint" (lambda ()
                                     (interactive)
                                     (lein "checkall"))]))


(provide 'clojure-refactor-menu)
