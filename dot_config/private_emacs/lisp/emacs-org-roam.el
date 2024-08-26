;; -*- lexical-binding: t; -*-

(use-package
 org-roam
 :config
 (setq org-roam-directory "~/org-roam/")
 (setq org-roam-dailies-directory "journal/")
 (setq org-roam-file-exclude-regexp "README.org")
 (setq org-roam-completion-everywhere t)
 (setq org-roam-db-update-method 'immediate)
 :bind
 (("C-c n l" . org-roam-buffer-toggle)
  ("C-c n f" . org-roam-node-find)
  ("C-c n i" . org-roam-node-insert)
  :map
  org-mode-map
  ("C-M-i" . completion-at-point)
  :map
  org-roam-dailies-map
  ("Y" . org-roam-dailies-capture-yesterday)
  ("T" . org-roam-dailies-capture-tomorrow))
 :bind-keymap ("C-c n d" . org-roam-dailies-map)
 :config
 (require 'org-roam-dailies)
 (org-roam-db-autosync-mode))

(setq
 org-roam-dailies-capture-templates
 '(("d"
    "default"
    entry
    "* %<%H:%M>: %?"
    :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))

(setq org-capture-templates
      '(("t"
         "todo"
         entry
         (file "~/org-roam/inbox.org")
         "* TODO %?\n%U\n- ref :: %a\n")
        ("b"
         "Bookmark"
         entry
         (file+headline "~/org-roam/bookmarks.org" "Bookmarks")
         "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n"
         :empty-lines 1)))

(with-eval-after-load 'org-roam
  (cl-defmethod org-roam-node-type ((node org-roam-node))
    "Return the TYPE of NODE."
    (condition-case nil
        (file-name-nondirectory
         (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node)
                               org-roam-directory))))
      (error ""))))

(setq org-roam-node-display-template
      (concat
       "${type:15} ${title:*} "
       (propertize "${tags:10}" 'face 'org-tag)))

(use-package
 org-roam-timestamps
 :after org-roam
 :config (setq org-roam-timestamps-remember-timestamps nil)
 :init (org-roam-timestamps-mode))

(use-package
 consult-org-roam
 :after org-roam
 :init (consult-org-roam-mode 1)
 :config
 (setq consult-org-roam-grep-func #'consult-ripgrep)
 (setq consult-org-roam-buffer-narrow-key ?r)
 (setq consult-org-roam-buffer-after-buffers t)
 (consult-customize consult-org-roam-forward-links :preview-key "M-.")
 :bind
 ("C-c n e" . consult-org-roam-file-find)
 ("C-c n b" . consult-org-roam-backlinks)
 ("C-c n B" . consult-org-roam-backlinks-recursive)
 ("C-c n l" . consult-org-roam-forward-links)
 ("C-c n r" . consult-org-roam-search))

(provide 'emacs-org-roam)
