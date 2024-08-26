;; -*- lexical-binding: t; -*-

(use-package
 isearch
 :straight nil
 :config
 (setq search-highlight t)
 (setq isearch-lazy-highlight t)
 (setq lazy-highlight-initial-delay 0.5)
 (setq lazy-highlight-no-delay-length 4)
 (setq isearch-lazy-count t)
 (setq lazy-count-prefix-format "(%s/%s) ")
 (setq lazy-count-suffix-format nil)
 (setq isearch-wrap-pause t)
 (setq isearch-repeat-on-direction-change t)
 (setq list-matching-lines-jump-to-current-line nil)
 )

(provide 'emacs-search)
