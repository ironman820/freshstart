(setq user-full-name "Nicholas Eastman"
      user-mail-address "nicholas.m.eastman@gmail.com")

(setq confirm-kill-emacs nil)
(setq doom-theme 'zerodark)
(setq visible-bell 1)

(global-auto-revert-mode 1)

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 12)
      doom-big-font (font-spec :family "FiraCode Nerd Font" :size 40))
(after! doom-theme
  (setq doom-themes-enable-bold 1
        doom-themes-enable-italic 1))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-noter-notes-search-path "~/Notes"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-log-done 'time
        org-journal-dir "~/org/journal"
        org-journal-date-format "%B %d, %Y (%A) "
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers 1))

(after! lsp-mode
  (setq lsp-enable-file-watchers t
        lsp-file-watch-threshold nil))

(after! php-mode
  (add-hook 'php-mode-hook 'php-enable-default-coding-style))

(set-email-account! "gmail.com"
                    '((mu4e-sent-folder . "/[Gmail].Sent Mail")
                      (mu4e-drafts-folder . "/[Gmail].Drafts")
                      (mu4e-trash-folder . "/[Gmail].Trash")
                      (mu4e-refile-folder . "/[Gmail].All Mail")
                      (smtpmail-smtp-user . "nicholas.m.eastman@gmail.com"))
                    t)
