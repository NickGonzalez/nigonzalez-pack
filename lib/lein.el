;;; lein.el --- A compilation of convenience commands for leiningen compilation without the repl

;;; Commentary:
 ;;

;;; Code:
(require 'browse-url)
(defun lein (cmd)
  (interactive "slein: ")
  (compile (concat  "lein " cmd)))


(defun lein-compile  ()
  (interactive)
  (compile "lein compile"))

(defun lein-doc  ()
  (interactive)
  (compile "lein doc"))

(defun show-docs (dir)
  (interactive "DDoc Directory: ")
  (browse-url (concat "file://" dir  "/index.html")))

(defun lein-jar
   ()
   (interactive)
   (compile "lein jar"))


(defun lein-install
  ()
  (interactive)
  (compile "lein install"))

(defun lein-uberjar
  ()
  (interactive)
  (compile "lein uberjar"))

(defun lein-test
  ()
  (interactive)
  (compile "lein test"))

(defun lein-clean
  ()
  (interactive)
  (compile "lein clean"))

(defun lein-clean-install
  ()
  (interactive)
  (compile "lein clean")
  (compile "lein jar")
  (compile "lein install"))

(defun lein-clean-jar
  ()
  (interactive)
  (compile "lein clean")
  (compile "lein jar"))

(defun lein-run
  ()
  (interactive)
  (start-process "lein-run" "*lein-run*" "/usr/local/bin/lein" "run")
  (switch-to-buffer-other-window "*lein-run*"))

(defun lein-project-directory (path)
  (locate-dominating-file path "project.clj"))

(defun lein-test-directory (path)
  (concat (lein-project-directory path) "test/"))

(defun remove-root-path (path root-path)
  (last  (split-string path root-path)))

(defun lein-source-p (path)
  "Returns true if path is a source file in a lein project."
  (and (lein-project-directory path)
       (string-match "/src/" path)))

(defun lein-test-p (path)
  "Returns true if path is a test file in a lein project."
  (and (lein-project-directory path)
       (string-match "/test/" path)))

(defun lein-test-file-for-source-file  (source-file)
  "returns the full path of the test file for the given source file in a lein project."
  (when (lein-source-p source-file)
    (replace-regexp-in-string ".clj$"
			      "_test.clj"
			      (replace-regexp-in-string "/src/"
							"/test/"
							source-file))))
(defun lein-source-file-for-test-file  (test-file)
  "returns the full path of the test file for the given source file in a lein project."
  (when (lein-test-p test-file)
    (replace-regexp-in-string "_test.clj$"
			      ".clj"
			      (replace-regexp-in-string "/test/"
							"/src/"
							test-file))))

(defun lein-switch-to-test ()
  "Opens the corresponding test file for the currently open source file"
  (interactive)
  (find-file   (lein-test-file-for-source-file buffer-file-name)))

(defun lein-switch-to-source ()
  "Opens the corresponding test file for the currently open source file"
  (interactive)
  (find-file   (lein-source-file-for-test-file buffer-file-name)))

(defun lein-switch-between-source-and-test ()
  "switches between a source file and a test file"
  (interactive)
  (if (lein-test-p buffer-file-name)
      (lein-switch-to-source)
    (lein-switch-to-test)))

(defun lein-open-project-file ()
  "Finds and opens the leiningen project.clj file for the currently selected buffer."
  (interactive)
  (find-file (concat  (lein-project-directory buffer-file-name)
		      "project.clj")))

(defun lein-docs-directory ()
  (concat (lein-project-directory buffer-file-name)
	  "docs/"))

(defun lein-api-doc ()
  (interactive)
  (browse-url-of-file (concat (lein-docs-directory)
			      "api/index.html")))



(provide 'lein)


;;; lein.el ends here
