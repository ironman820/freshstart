;; UI Cleanup

;; Variable for the font size
(defvar ironman/default-font-size 100)

;; Don't display the Startup Message
(setq inhibit-startup-message -1)
;; Disable the scrollbar
(scroll-bar-mode -1)
;; Disable the toolbar
(tool-bar-mode -1)
;; Turn off tooltips
(tooltip-mode -1)
;; Fringe settings
(set-fringe-mode 10)
;; Disable the menu bar
(menu-bar-mode -1)

;; Show a visible alert instead of dinging
(setq visible-bell t)

;; Set the font
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height ironman/default-font-size)

;; Make Escape quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Ivy and supporting packages
(use-package counsel
  :diminish
  :bind (("M-x" . counsel-M-x))
  :config
  (setq ivy-use-virtual-buffers 1
	ivy-count-format "(%d/%d) "))
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

;; Icons for the modeline
(use-package all-the-icons)

;; Simpler Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Doom Themes!
;;(use-package doom-themes
;;  :config
;;  (setq doom-themes-enable-bold t
;;	doom-themes-enable-italic t)
;;  (load-theme 'doom-dracula t)
;;  (doom-themes-visual-bell-config))

(use-package flycheck)

(use-package zerodark-theme
  :config
  (load-theme 'zerodark t)
  (zerodark-setup-modeline-format))

;; Display Line numbers and column numbers in the mode line
(column-number-mode)
(global-display-line-numbers-mode t)

;; Ignore line numbers in Org mode windows and terminals
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Pretty parenthases to help match them in code
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Discriptive hotkey information
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :config
  (counsel-mode 1))

(use-package general
  :config
  (general-create-definer ironman/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (ironman/leader-keys
    "b" '(:ignore b :which-key "buffer")
    "bb" '(counsel-projectile-switch-to-buffer :which-key "switch workspace buffer")
    "bB" '(counsel-switch-buffer :which-key "switch buffer")
    "bc" '(clone-indirect-buffer :which-key "clone buffer")
    "bk" '(kill-current-buffer :which-key "kill buffer")
    "bl" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")
    "br" '(revert-buffer :which-key "revert buffer")
    "bS" '(evil-write-all :which-key "save all buffers")
    "f" '(:ignore f :which-key "file")
    "fs" '(save-buffer :which-key "save file")
    "fS" '(write-file :which-key "Save file as...")
    "f." '(counsel-find-file :which-key "find file")
    "g" '(:ignore g :which-key "git")
    "gg" '(magit-status :which-key "status")
    "m" '(:ignore m :which-key "<localleader>")
    "o" '(:ignore o :which-key "open")
    "of" '(make-frame :which-key "open frame")
    "p" '(:ignore p :which-key "project")
    "q" '(:ignore q :which-key "quit")
    "qq" '(save-buffers-kill-terminal :which-key "Save and Quit")
    "qQ" '(evil-quit-all-with-error-code :which-key "Quit without saving")
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "w" '(:ignore w :which-key "window")
    "wh" '(evil-window-left :which-key "Move to left window")
    "wj" '(evil-window-down :which-key "Move to window below")
    "wk" '(evil-window-up :which-key "Move to window above")
    "wl" '(evil-window-right :which-key "Move to right window")
    "wq" '(evil-quit :which-key "close frame/quit")
    "ws" '(evil-window-split :which-key "Split window Horizontally")
    "wT" '(tear-off-window :which-key "Tear off window")
    "wv" '(evil-window-vsplit :which-key "Split window vertically")
    "SPC" '(projectile-find-file :which-key "Find file in project")
    "." '(counsel-find-file :which-key "Find File")
    ":" '(counsel-M-x :which-key "M-x"))

  (general-create-definer ironman/local-leader
    :keymaps '(normal insert visual emacs)
    :prefix "SPC m"
    :global-prefix "C-SPC m"))

(use-package evil
  :init
  (setq evil-want-integraton t
	evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
 
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(ironman/leader-keys
  "pa" '(projectile-add-known-project :which-key "add project")
  "pd" '(projectile-remove-known-project :which-key "Remove known project")
  "pi" '(projectile-invalidate-cache :which-key "Invalidate project cache")
  "pp" '(counsel-projectile-switch-project :which-key "switch projects")
)

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package persp-projectile)

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(defun ironman/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "FiraCode Nerd Font Mono" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(defun ironman/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  ;;:pin org
  ;;:commands (org-capture org-agenda)
  :hook (org-mode . ironman/org-mode-setup)
  :custom
  (org-hide-emphasis-markers t)
  (org-ellipsis " ▾")
  (org-agenda-files
	'("~/org"))
  (org-agenda-start-with-log-mode t)
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-agenda-start-day "-3d")
  (org-agenda-span 10)
  (org-todo-keyword-faces
	'(("TODO" . "green") ("PROJ" . "gray") ("STRT" . "purple") ("WAIT" . "orange") ("HOLD" . "orange") ("DONE" . "black") ("KILL" . "red") ("[ ]" . "green") ("[-]" . "gray") ("[?]" . "orange") ("[X]" . "black")))
  :config
  (setq org-todo-keywords
	'((sequence "TODO(t)" "PROJ(p)" "STRT(s)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "KILL(k)")
	  (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))
  (ironman/org-font-setup))

(ironman/local-leader
  :states 'normal
  :keymaps 'org-mode-map
  "A" 'org-archive-subtree
  "d" '(:ignore d :which-key "date/deadline")
  "dd" 'org-deadline
  "ds" 'org-schedule
  "dt" 'org-time-stamp
  "g" '(:ignore g :which-key "goto")
  "gg" 'counsel-org-goto
  "p" 'org-priority
  "t" 'org-todo)

(ironman/leader-keys
  "oA" 'org-agenda)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
