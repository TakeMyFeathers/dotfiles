;;; Isearch, occur, grep, and extras (prot-search.el)
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
 (setq
  search-whitespace-regexp
  ".*?" ; one `setq' here to make it obvious they are a bundle
  isearch-lax-whitespace t
  isearch-regexp-lax-whitespace nil)
 :hook
 (occur-mode . #'prot-common-truncate-lines-silently)
 (occur-mode . #'hl-line-mode)
 :bind
 (:map
  minibuffer-local-isearch-map ("M-/" . isearch-complete-edit)
  :map occur-mode-map ("t" . toggle-truncate-lines)
  :map isearch-mode-map
  ("C-g" . isearch-cancel) ; instead of `isearch-abort'
  ("M-/" . isearch-complete))
 )

(provide 'emacs-search)
