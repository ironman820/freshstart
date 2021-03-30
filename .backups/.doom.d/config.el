(setq user-full-name "Nicholas Eastman"
      user-mail-address "nicholas.m.eastman@gmail.com")

(setq confirm-kill-emacs nil)
(setq doom-theme 'zerodark)
(setq visible-bell 1)

(global-auto-revert-mode 1)

(global-visual-line-mode t)

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 12)
      doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 40))
(after! doom-theme
  (setq doom-themes-enable-bold 1
        doom-themes-enable-italic 1))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-pretty-mode 1)))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-noter-notes-search-path "~/Notes"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-log-done 'time
        org-journal-dir "~/org/journal"
        org-journal-date-format "%B %d, %Y (%A) "
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers 1
        org-pretty-entities t
        org-pretty-entities-include-sub-superscripts t))

(after! lsp-mode
  (setq lsp-enable-file-watchers t
        lsp-file-watch-threshold nil))

(after! php-mode
  (plist-put! +ligatures-extra-symbols
            :true ""
            :false ""
            :list "")
  (set-ligatures! 'php-mode
    :true "true"
    :true "TRUE"
    :false "false"
    :false "FALSE"
    :list "list")
  (add-hook 'php-mode-hook 'php-enable-default-coding-style)
  (setq lsp-intelephense-stubs
        ["apache" "bcmath" "bz2" "calendar" "com_dotnet" "Core"
         "ctype" "curl" "date" "dba" "dom" "enchant" "exif"
         "fileinfo" "filter" "fpm" "ftp" "gd" "hash" "iconv"
         "imap" "interbase" "intl" "json" "ldap" "libxml"
         "mbstring" "mcrypt" "meta" "mssql" "mysqli" "oci8"
         "odbc" "openssl" "pcntl" "pcre" "PDO" "pdo_ibm"
         "pdo_mysql" "pdo_pgsql" "pdo_sqlite" "pgsql" "Phar"
         "posix" "pspell" "readline" "recode" "Reflection"
         "regex" "session" "shmop" "SimpleXML" "snmp" "soap"
         "sockets" "sodium" "SPL" "sqlite3" "standard"
         "superglobals" "sybase" "sysvmsg" "sysvsem" "sysvshm"
         "tidy" "tokenizer" "wddx" "xml" "xmlreader" "xmlrpc"
         "xmlwriter" "Zend OPcache" "zip" "zlib" "sqlsrv"]))

(set-email-account! "gmail.com"
                    '((mu4e-sent-folder . "/[Gmail].Sent Mail")
                      (mu4e-drafts-folder . "/[Gmail].Drafts")
                      (mu4e-trash-folder . "/[Gmail].Trash")
                      (mu4e-refile-folder . "/[Gmail].All Mail")
                      (smtpmail-smtp-user . "nicholas.m.eastman@gmail.com"))
                    t)
