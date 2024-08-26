;; -*- lexical-binding: t; -*-

(use-package
 browse-url
 :defer t
 :config
 (setq browse-url-browser-function 'browse-url-generic)
 (setq browse-url-generic-program "ungoogled-chromium")

 ;; (setq browse-url-browser-function 'eww-browse-url)
 ;; (setq browse-url-secondary-browser-function
 ;;       'browse-url-default-browser)
 )

(use-package
 goto-addr
 :defer t
 :config
 (setq goto-address-url-face 'link)
 (setq goto-address-url-mouse-face 'highlight)
 (setq goto-address-mail-face nil)
 (setq goto-address-mail-mouse-face 'highlight))

(use-package
 shr
 :defer t
 :config
 (setq shr-use-colors nil) ; t is bad for accessibility
 (setq shr-use-fonts nil) ; t is not for me
 (setq shr-max-image-proportion 0.6)
 (setq shr-image-animate nil) ; No GIFs, thank you!
 (setq shr-width fill-column) ; check `prot-eww-readable'
 (setq shr-max-width fill-column)
 (setq shr-discard-aria-hidden t)
 (setq shr-cookie-policy nil))

(use-package
 eww
 :commands (eww)
 :bind
 (:map
  eww-link-keymap
  ("v" . nil) ; stop overriding `eww-view-source'
  :map eww-mode-map ("L" . eww-list-bookmarks)
  :map dired-mode-map
  ("E" . eww-open-file) ; to render local HTML files
  :map eww-buffers-mode-map
  ("d" . eww-bookmark-kill) ; it actually deletes
  :map eww-bookmark-mode-map
  ("d" . eww-bookmark-kill)) ; same
 :config
 (setq eww-restore-desktop t)
 (setq eww-desktop-remove-duplicates t)
 (setq eww-header-line-format nil)
 (setq eww-search-prefix "https://duckduckgo.com/html/?q=")
 (setq eww-download-directory
       (expand-file-name "~/Documents/eww-downloads"))
 (setq eww-suggest-uris
       '(eww-links-at-point thing-at-point-url-at-point))
 (setq eww-bookmarks-directory
       (locate-user-emacs-file "eww-bookmarks/"))
 (setq eww-history-limit 150)
 (setq eww-use-external-browser-for-content-type
       "\\`\\(video/\\|audio\\)") ; On GNU/Linux check your mimeapps.list
 (setq eww-browse-url-new-window-is-tab nil)
 (setq eww-form-checkbox-selected-symbol "[X]")
 (setq eww-form-checkbox-symbol "[ ]")
 (setq eww-retrieve-command nil))

(use-package shrface
  :defer t
  :config
  (setq shr-cookie-policy nil)
  (if (string-equal system-type "android")
      (setq shrface-bullets-bullet-list
        '("▼"
          "▽"
          "▿"
          "▾"))
    (setq shrface-bullets-bullet-list
          '("▼"
            "▽"
            "▿"
            "▾"
            )
          )
    ))

(provide 'emacs-web)
