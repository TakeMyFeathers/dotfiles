;; -*- lexical-binding: t; -*-

(use-package
 citar
 :config
 (setq org-cite-global-bibliography '("~/org-roam/references.bib"))
 (setq citar-org-roam-subdir '("references"))
 (setq citar-bibliography org-cite-global-bibliography)
 (setq citar-notes-paths '("~/org-roam/references"))
 (setq org-cite-insert-processor 'citar)
 (setq org-cite-follow-processor 'citar)
 (setq org-cite-activate-processor 'citar)
 :hook (org-mode . citar-capf-setup))

(use-package
 citar-org-roam
 :after (citar org-roam)
 :init (citar-org-roam-mode))

(use-package
 citar-embark
 :after
 citar
 embark
 :no-require
 :config (citar-embark-mode))

(with-eval-after-load 'all-the-icons
  (defvar citar-indicator-files-icons
    (citar-indicator-create
     :symbol
     (all-the-icons-faicon
      "file-o"
      :face 'all-the-icons-green
      :v-adjust -0.1)
     :function #'citar-has-files
     :padding "  " ; need this because the default padding is too low for these icons
     :tag "has:files"))

  (defvar citar-indicator-links-icons
    (citar-indicator-create
     :symbol
     (all-the-icons-octicon
      "link"
      :face 'all-the-icons-orange
      :v-adjust 0.01)
     :function #'citar-has-links
     :padding "  "
     :tag "has:links"))

  (defvar citar-indicator-notes-icons
    (citar-indicator-create
     :symbol
     (all-the-icons-material
      "speaker_notes"
      :face 'all-the-icons-blue
      :v-adjust -0.3)
     :function #'citar-has-notes
     :padding "  "
     :tag "has:notes"))

  (defvar citar-indicator-cited-icons
    (citar-indicator-create
     :symbol
     (all-the-icons-faicon "circle-o" :face 'all-the-icon-green)
     :function #'citar-is-cited
     :padding "  "
     :tag "is:cited"))

  (setq citar-indicators
        (list
         citar-indicator-files-icons
         citar-indicator-links-icons
         citar-indicator-notes-icons
         citar-indicator-cited-icons)))

(provide 'emacs-citations)
