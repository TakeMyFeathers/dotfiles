;; -*- lexical-binding: t; -*-

(use-package
 orderless
 :config
 (setq completion-styles '(orderless flex))
 (setq completion-category-defaults nil)
 ;; (setq completion-category-overrides
 ;;       '((file (styles partial-completion))))
 )

(use-package
 savehist
 :ensure nil
 :hook (after-init . savehist-mode)
 :config
 (setq savehist-file (locate-user-emacs-file "savehist"))
 (setq history-length 100)
 (setq history-delete-duplicates t)
 (setq savehist-save-minibuffer-history t)
 (add-to-list 'savehist-additional-variables 'kill-ring))

(use-package corfu :ensure t :hook (prog-mode . corfu-mode))

(use-package
 corfu
 :hook (after-init . global-corfu-mode)
 :config
 (setq corfu-preview-current nil)
 (setq corfu-min-width 20)
 (setq corfu-popupinfo-delay '(1.25 . 0.5))
 (corfu-popupinfo-mode 1)

 (with-eval-after-load 'savehist
   (corfu-history-mode 1)
   (add-to-list 'savehist-additional-variables 'corfu-history)))

(setq corfu-auto t
      corfu-quit-no-match 'separator)

(provide 'emacs-completion)
