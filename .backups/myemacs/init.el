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
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-acario-dark t)
  (doom-themes-visual-bell-config))

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
    "bk" 'kill-current-buffer
    "f" '(:ignore f :which-key "file")
    "fs" 'save-buffer
    "f." 'counsel-find-file
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "w" '(:ignore w :which-key "window")
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wk" 'evil-window-up
    "wl" 'evil-window-right
    "wq" 'evil-window-delete
    "ws" 'evil-window-split
    "wv" 'evil-window-vsplit
    "q" '(:ignore q :which-key "quit")
    "qq" 'save-buffers-kill-terminal
    "SPC" 'counsel-find-file
    "." 'counsel-find-file))

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
