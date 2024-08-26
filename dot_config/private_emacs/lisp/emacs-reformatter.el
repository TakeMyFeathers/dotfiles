;; -*- lexical-binding: t; -*-

(use-package reformatter)

(reformatter-define
 typst-format
 :program "/home/martini/.cargo/bin/typstyle"
 :lighter " TF")

(reformatter-define
 yaml-format
 :program "/home/martini/go/bin/yamlfmt"
 :args '("-in")
 :lighter " YM")

(use-package
 elisp-autofmt
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode))

(provide 'emacs-reformatter)
