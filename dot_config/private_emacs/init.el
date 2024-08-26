;; -*- lexical-binding: t; -*-

(add-to-list
 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-benchmarking)
(require 'emacs-essentials)

(unless backup-directory-alist
  (setq backup-directory-alist
        `(("." . ,(concat user-emacs-directory "backups")))))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         (or (bound-and-true-p straight-base-dir)
                             user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent
         'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default 'straight)
(straight-use-package 'use-package)
(straight-use-package 'org)

(mouse-wheel-mode -1)
(global-set-key [wheel-up] 'ignore)
(global-set-key [double-wheel-up] 'ignore)
(global-set-key [triple-wheel-up] 'ignore)
(global-set-key [wheel-down] 'ignore)
(global-set-key [double-wheel-down] 'ignore)
(global-set-key [triple-wheel-down] 'ignore)
(global-set-key [wheel-left] 'ignore)
(global-set-key [double-wheel-left] 'ignore)
(global-set-key [triple-wheel-left] 'ignore)
(global-set-key [wheel-right] 'ignore)
(global-set-key [double-wheel-right] 'ignore)
(global-set-key [triple-wheel-right] 'ignore)

(require 'emacs-window)
(require 'emacs-theme)
(require 'emacs-search)
(require 'emacs-vertico)
(require 'emacs-completion)
(require 'emacs-which-key)
(require 'emacs-web)
(require 'emacs-paw)
(require 'emacs-dired)
(require 'emacs-elfeed)
(require 'emacs-citations)
(require 'emacs-calibre)

(require 'emacs-typst)
(require 'emacs-org-mode)
(require 'emacs-org-roam)
;; (require 'emacs-hledger)
;; (require 'temp-mode)

(use-package expand-region :bind ("C-=" . er/expand-region))

(use-package request)
(use-package emacsql)
(use-package all-the-icons :if (display-graphic-p))
(use-package move-text :init (move-text-default-bindings))
(use-package ebuku :custom (ebuku-buku-path "~/.local/bin/buku"))

(use-package nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(use-package lua-mode)


(use-package ligature
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia and Fira Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
                        '(;; == === ==== => =| =>>=>=|=>==>> ==< =/=//=// =~
                          ;; =:= =!=
                          ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
                          ;; ;; ;;;
                          (";" (rx (+ ";")))
                          ;; && &&&
                          ("&" (rx (+ "&")))
                          ;; !! !!! !. !: !!. != !== !~
                          ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
                          ;; ?? ??? ?:  ?=  ?.
                          ("?" (rx (or ":" "=" "\." (+ "?"))))
                          ;; %% %%%
                          ("%" (rx (+ "%")))
                          ;; |> ||> |||> ||||> |] |} || ||| |-> ||-||
                          ;; |->>-||-<<-| |- |== ||=||
                          ;; |==>>==<<==<=>==//==/=!==:===>
                          ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
                                          "-" "=" ))))
                          ;; \\ \\\ \/
                          ("\\" (rx (or "/" (+ "\\"))))
                          ;; ++ +++ ++++ +>
                          ("+" (rx (or ">" (+ "+"))))
                          ;; :: ::: :::: :> :< := :// ::=
                          (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
                          ;; // /// //// /\ /* /> /===:===!=//===>>==>==/
                          ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
                                          "="))))
                          ;; .. ... .... .= .- .? ..= ..<
                          ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
                          ;; -- --- ---- -~ -> ->> -| -|->-->>->--<<-|
                          ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
                          ;; *> */ *)  ** *** ****
                          ("*" (rx (or ">" "/" ")" (+ "*"))))
                          ;; www wwww
                          ("w" (rx (+ "w")))
                          ;; <> <!-- <|> <: <~ <~> <~~ <+ <* <$ </  <+> <*>
                          ;; <$> </> <|  <||  <||| <|||| <- <-| <-<<-|-> <->>
                          ;; <<-> <= <=> <<==<<==>=|=>==/==//=!==:=>
                          ;; << <<< <<<<
                          ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
                                          "-"  "/" "|" "="))))
                          ;; >: >- >>- >--|-> >>-|-> >= >== >>== >=|=:=>>
                          ;; >> >>> >>>>
                          (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
                          ;; #: #= #! #( #? #[ #{ #_ #_( ## ### #####
                          ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
                                       (+ "#"))))
                          ;; ~~ ~~~ ~=  ~-  ~@ ~> ~~>
                          ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))
                          ;; __ ___ ____ _|_ __|____|_
                          ("_" (rx (+ (or "_" "|"))))
                          ;; Fira code: 0xFF 0x12
                          ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
                          ;; Fira code:
                          "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
                          ;; The few not covered by the regexps.
                          "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; (use-package
;;  org-remark
;;  :straight (:type git :host github :repo "nobiot/org-remark")
;;  :bind
;;  (
;;   ("C-c n m" . org-remark-mark)
;;   ("C-c n l" . org-remark-mark-line)
;;   :map
;;   org-remark-mode-map
;;   ("C-c n o" . org-remark-open)
;;   ("C-c n ]" . org-remark-view-next)
;;   ("C-c n [" . org-remark-view-prev)
;;   ("C-c n r" . org-remark-remove)
;;   ("C-c n d" . org-remark-delete))
;;  :init
;;  (org-remark-global-tracking-mode +1)
;;  :config
;;  (org-remark-info-mode +1)
;;  (org-remark-eww-mode +1)
;;  (org-remark-nov-mode +1))

(use-package mpv)
(use-package elfeed-tube :after elfeed :config (elfeed-tube-setup))
(use-package elfeed-tube-mpv)

(use-package json-mode)

(use-package ag)
(use-package rg)

(use-package
 projectile
 :init (projectile-mode +1)
 :bind
 (:map
  projectile-mode-map
  ("s-p" . projectile-command-map)
  ("C-c p" . projectile-command-map)))

(use-package
 wallabag
 :after (request emacsql)
 :hook
 (wallabag-after-render . wallabag-search-update-and-clear-filter)
 :custom
 (wallabag-host "https://app.wallabag.it")
 (wallabag-username "TakeMyFeathers")
 (wallabag-password
  (auth-source-pick-first-password :host "wallabag.password"))
 (wallabag-clientid
  "25636_2s9970yfj3swgosc0wws0coc0wkss4wok48kc0884ko804owk4")
 (wallabag-secret
  (auth-source-pick-first-password :host "wallabag.secret"))
 :straight
 (:host
  github
  :repo "chenyanming/wallabag.el"
  :files ("*.el" "*.alist" "*.css")))

(setq url-automatic-caching t)

(use-package
 olivetti
 :ensure t
 :commands (olivetti-mode)
 :config
 (setq olivetti-body-width 0.7)
 (setq olivetti-minimum-body-width 80)
 (setq olivetti-recall-visual-line-mode-entry-state t))

(require 'emacs-reformatter)
(require 'kdl-mode)

(put 'scroll-left 'disabled nil)
