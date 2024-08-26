;; -*- lexical-binding: t; -*-

(use-package
 dired
 :straight nil
 :commands (dired)
 :config
 (setf dired-kill-when-opening-new-dired-buffer t)
 (put 'dired-find-alternate-file 'disabled nil)
 (setq dired-recursive-copies 'always)
 (setq dired-dwim-target t)
 (setq dired-recursive-deletes 'always)
 (setq dired-auto-revert-buffer #'dired-directory-changed-p)
 (setq dired-listing-switches
       "-AGFhlv --group-directories-first --time-style=long-iso")
 :hook ('dired-mode . 'dired-hide-details-mode))


(use-package
 dired-aux
 :straight nil
 :after dired
 :bind
 (:map
  dired-mode-map
  ("C-+" . dired-create-empty-file)
  ("M-s f" . nil)
  ("C-x v v" . dired-vc-next-action))
 :config
 (setq dired-isearch-filenames 'dwim)
 (setq dired-create-destination-dirs 'ask)
 (setq dired-vc-rename-file t)
 (setq dired-do-revert-buffer
       (lambda (dir) (not (file-remote-p dir))))
 (setq dired-create-destination-dirs-on-trailing-dirsep t))

(use-package diredfl :init (diredfl-global-mode))
(use-package
 all-the-icons-dired
 :after all-the-icons
 :hook ('dired-mode . 'all-the-icons-dired-mode))

(provide 'emacs-dired)
