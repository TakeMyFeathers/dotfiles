;; -*- lexical-binding: t; -*-

(use-package
 whitespace
 :bind
 (("<f6>" . whitespace-mode) ("C-c z" . delete-trailing-whitespace))
 :config
 (setq whitespace-style
       '(face
         tabs
         spaces
         tab-mark
         space-mark
         trailing
         missing-newline-at-eof
         space-after-tab::tab
         space-after-tab::space
         space-before-tab::tab
         space-before-tab::space)))

(use-package
 display-line-numbers
 :ensure nil
 :bind ("<f7>" . display-line-numbers-mode)
 :config
 (setq-default display-line-numbers-type 'relative)
 (setq display-line-numbers-major-tick 0)
 (setq display-line-numbers-minor-tick 0)
 (setq-default display-line-numbers-widen t)
 ;; :hook (prog-mode . display-line-numbers-mode)
 )

(provide 'emacs-window)
