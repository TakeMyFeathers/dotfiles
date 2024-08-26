;; -*- lexical-binding: t; -*-

(use-package
 calibredb
 :defer t
 :config (setq calibredb-root-dir "~/Calibre Library")
 (setq calibredb-db-dir
       (expand-file-name "metadata.db" calibredb-root-dir)))

(provide 'emacs-calibre)
