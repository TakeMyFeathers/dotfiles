;; -*- lexical-binding: t; -*-

(use-package elfeed)

(use-package
 elfeed-org
 :config
 (setq rmh-elfeed-org-files (list (expand-file-name "elfeed.org" user-emacs-directory)))
 :init (elfeed-org))

(provide 'emacs-elfeed)
