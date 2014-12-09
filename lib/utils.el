 ;; Set transparency of emacs
 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))


(defun redis ()
  "starts the redis server in the background and displays the output in a buffer"
  (interactive)
  (start-process "redis" "*redis*" "redis-server" ))

(defun increase-font ()
  "increases the font for presentations"
  (interactive)
  (set-face-attribute 'default nil :height 250))

(defun decrease-font ()
  "increases the font for presentations"
  (interactive)
  (set-face-attribute 'default nil :height 100))

(defun finder ()
  "open finder at the current location"
  (interactive)
  (start-process "finder" "*finder*" "open" "."))

(defun terminal ()
  "open terminal at the current location"
  (interactive)
  (start-process "terminal" "*terminal*" "open" "." "-a" "/Applications/Utilities/Terminal.app"))

(defun url-encode (source-string)
  (replace-regexp-in-string " " "%20" source-string))

(defun  google (search-string)
  "search google for search string"
  (interactive "ssearch: ")
  (browse-url (concat  "https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q="
                       (url-encode search-string))))

(provide 'utils)
