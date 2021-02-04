(setq user-full-name "Nicholas Eastman"
      user-mail-address "nicholas.m.eastman@gmail.com")

(setq confirm-kill-emacs nil)
(setq doom-theme 'doom-one)

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-log-done 'time
        org-journal-dir "~/org/journal"
        org-journal-date-format "%B %d, %Y (%A) "
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t))
