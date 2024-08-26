;; -*- lexical-binding: t; -*-
(use-package
 which-key
 :ensure t
 :hook (after-init . which-key-mode)
 :config
 (setq which-key-separator "  ")
 (setq which-key-prefix-prefix "... ")
 (setq which-key-max-display-columns 3)
 (setq which-key-idle-delay 0.5)
 (setq which-key-idle-secondary-delay 0.25)
 (setq which-key-add-column-padding 1)
 (setq which-key-max-description-length 40))

(provide 'emacs-which-key)
