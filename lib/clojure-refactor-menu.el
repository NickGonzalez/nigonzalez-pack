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

  (let ((build-menu (easy-menu-define clojure-build-menu nil
	    "Menu Clojure Builds"
	    `("Build"
	      ("App"
	       ["Run" lein-run]
	       ["Build & Run" (lambda ()
				(interactive)
				(lein "do jar")
				(lein-run))]
	       ["Rebuild & Run" (lambda ()
				  (interactive)
				  (lein "do sub jar, sub install, jar")
				  (lein-run))])
	      ("Lib"
	       ["Build & Install" (lambda ()
				    (interactive)
				    (lein "do jar, install"))]
	       ["Rebuild & Install" (lambda ()
				      (interactive)
				      (lein "do clean, jar, install"))])
	      ("Dependencies"
	       ["Rebuild All" (lambda ()
				(interactive)
				(lein "do sub clean, sub jar, sub install, clean, jar, uberjar "))]
	       ["Build Dependencies" (lambda ()
				       (interactive)
				       (lein "do sub clean, sub jar, sub install"))])

	      ("Documentation"
	       ["Build API Doc" (lambda ()
				  (interactive)
				  (lein "doc"))]
	       ["Build Margin Doc" (lambda ()
				       (interactive)
				       (lein "marg"))]
	       "--"
	       ["Build All" (lambda ()
			      (interactive)
			      (lein "docs"))])
	      "--"
	      ["Clean" lein-clean]
	      ["Build" lein-jar]
	      ["Rebuild" (lambda ()
			   (interactive)
			   (lein "do clean, jar, uberjar"))]
	      ["Run Lint" (lambda ()
			    (interactive)
			    (lein "checkall"))]
	      "--"
	      ["Version info" nick-version]))))
    (easy-menu-add-item nil
			'("Clojure")
			clojure-build-menu))
  (easy-menu-define clojure-nav-menu nil
    "Menu Clojure Navigation"
    `("Navigation"
      ["Open Project File" lein-open-project-file]
      ["Search Project" lein-search-project]
      ["Search Project (word at point)" lein-search-project-at-point]
      ["Toggle Source / Test" lein-switch-between-source-and-test]))
  (easy-menu-add-item nil
		      '("Clojure")
		      clojure-nav-menu)

  (easy-menu-define clojure-docs-menu nil
    "Menu Clojure Docs"
    `("Docs"
      ("Project Docs"
       ["API Doc" lein-api-doc]
       ["Margin Doc" lein-margin-doc]
       "--"
       ["Rebuild" (lambda ()
		    (interactive)
		    (lein "docs"))])
      "--"
      ["Clojure Cheatsheet" clojure-cheatsheet]
      ["Clojure Library List" clojure-browse-libraries]
      ["Clojars" clojure-browse-clojars]))
  (easy-menu-add-item nil
		      '("Clojure")
		      clojure-docs-menu))





(defun init-custom-menus ()
  (interactive)
  (load "custom-menu-config") ;; should contain the menu-commands variable
  (mapcar (lambda (menu-def)
	    (easy-menu-add-item nil
				(nth 0 menu-def)
				(nth 1 menu-def)))
	  menu-commands))


(provide 'clojure-refactor-menu)




