;; -*- lexical-binding: t; -*-

(use-package
 vertico
 :ensure t
 :hook
 (after-init . vertico-mode)
 (after-init . vertico-multiform-mode)
 :bind
 (:map
  vertico-map
  ("M-DEL" . vertico-directory-delete-word)
  ("M-," . vertico-quick-insert)
  ("M-." . vertico-quick-exit))
 :config
 (setq vertico-scroll-margin 0)
 (setq vertico-count 15)
 (setq vertico-resize t)
 :hook
 (rfn-eshadow-update-overlay . #'vertico-directory-tidy))

(defun sort-directories-first (files)
  (setq files (vertico-sort-history-length-alpha files))
  (nconc
   (seq-filter (lambda (x) (string-suffix-p "/" x)) files)
   (seq-remove (lambda (x) (string-suffix-p "/" x)) files)))

(setq vertico-multiform-commands
      '((consult-line indexed)
        (consult-outline buffer ,(lambda (_) (text-scale-set -1)))))

(setq vertico-multiform-categories
      '((consult-ripgrep buffer)
        (file (vertico-sort-function . sort-directories-first))))

(use-package marginalia :init (marginalia-mode))

(use-package
 consult
 :bind(
 ("C-x b" . consult-buffer)
 ("C-x 4 b" . consult-buffer-other-window)
 ("C-x r b" . consult-bookmark)
 ("C-x p b" . consult-project-buffer)
 ("M-y" . consult-yank-pop)
 ("M-s d" . consult-find) ;; Alternative: consult-fd
 ("M-s c" . consult-locate)
 ("M-s g" . consult-grep)
 ("M-s G" . consult-git-grep)
 ("M-s r" . consult-ripgrep)
 ("M-s l" . consult-line)
 ("M-s L" . consult-line-multi)
 ("M-s k" . consult-keep-lines)
 ("M-s u" . consult-focus-lines)
 :map isearch-mode-map
 ("M-s l" . consult-line)
 ("M-s L" . consult-line-multi)))

(provide 'emacs-vertico)
