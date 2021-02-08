(setq user-full-name "Nicholas Eastman"
      user-mail-address "nicholas.m.eastman@gmail.com")

(setq confirm-kill-emacs nil)
(setq doom-theme 'doom-one)

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(defun dt/org-babel-tangle-async (file)
  "Invoke `org-babel-tangle-file' asynchronously."
  (message "Tangling %s..." (buffer-file-name))
  (async-start
   (let ((args (list file)))
  `(lambda ()
        (require 'org)
        ;;(load "~/.emacs.d/init.el")
        (let ((start-time (current-time)))
          (apply #'org-babel-tangle-file ',args)
          (format "%.2f" (float-time (time-since start-time))))))
   (let ((message-string (format "Tangling %S completed after " file)))
     `(lambda (tangle-time)
        (message (concat ,message-string
                         (format "%s seconds" tangle-time)))))))

(defun dt/org-babel-tangle-current-buffer-async ()
  "Tangle current buffer asynchronously."
  (dt/org-babel-tangle-async (buffer-file-name)))

;;(require 'sublimity-scroll)
;;(require 'sublimity-map)
;;(sublimity-mode 1)

(setq ox-wk-style 'dokuwiki)
