(defun dw/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(require 'org-tempo)

(use-package
 org
 :hook (org-mode . dw/org-mode-setup)
 :config
 (setq org-auto-align-tags nil)
 (setq org-ellipsis "…")
 (setq org-hide-emphasis-markers t)
 (setq org-hide-emphasis-markers t)
 )

(use-package
 org-bullets
 :hook org-mode . (lambda () (org-bullets-mode 1)))

(with-eval-after-load 'org-faces
  (dolist (face
           '(org-document-title org-level-1 org-level-2 org-level-3))
    (set-face-attribute face nil :height 1.0)))

(use-package org-cliplink)

(provide 'emacs-org-mode)
