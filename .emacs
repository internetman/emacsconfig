;;add jdee cedet and jdee
(add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.0.1/lisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elib-1.0"))
(require 'jde)
;;add ecb 
(add-to-list 'load-path  "~/.emacs.d/ecb-2.40")
(require 'ecb)
;;Symbol's value as variable is void: stack-trace-on-error   avoid this error in ecb
(setq stack-trace-on-error t)
;;we need some lisp to prevent fatal errors.
(defun screen-width nil -1)
(setq jde-check-version-flag nil)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")
(unless (fboundp 'semantic-format-prototype-tag-java-mode)
(defalias 'semantic-format-prototype-tag-java-mode 'semantic-format-tag-prototype-java-mode))
(require 'hippie-exp)
;;we use something to  load JDEE for .java files :
(add-to-list 'load-path (format "%s/lisp" "~/.emacs.d/jdee-2.4.0.1" "Path to JDEE"))
(autoload 'jde-mode "jde" "JDE mode." t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))



;;defination of ecb
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-key-map (quote ("C-c ." (t "fh" ecb-history-filter) (t "fs" ecb-sources-filter) (t "fm" ecb-methods-filter) (t "fr" ecb-methods-filter-regexp) (t "ft" ecb-methods-filter-tagclass) (t "fc" ecb-methods-filter-current-type) (t "fp" ecb-methods-filter-protection) (t "fn" ecb-methods-filter-nofilter) (t "fl" ecb-methods-filter-delete-last) (t "ff" ecb-methods-filter-function) (t "p" ecb-nav-goto-previous) (t "n" ecb-nav-goto-next) (t "lc" ecb-change-layout) (t "lr" ecb-redraw-layout) (t "lw" ecb-toggle-ecb-windows) (t "lt" ecb-toggle-layout) (t "s" ecb-window-sync) (t "r" ecb-rebuild-methods-buffer) (t "a" ecb-toggle-auto-expand-tag-tree) (t "x" ecb-expand-methods-nodes) (t "h" ecb-show-help) (nil "C-c e" ecb-goto-window-edit-last) (t "g1" ecb-goto-window-edit1) (t "g2" ecb-goto-window-edit2) (t "gc" ecb-goto-window-compilation) (nil "C-c 0" ecb-goto-window-directories) (nil "C-c 1" ecb-goto-window-sources) (nil "C-c 2" ecb-goto-window-methods) (nil "C-c 3" ecb-goto-window-history) (t "ga" ecb-goto-window-analyse) (t "gb" ecb-goto-window-speedbar) (t "md" ecb-maximize-window-directories) (t "ms" ecb-maximize-window-sources) (t "mm" ecb-maximize-window-methods) (t "mh" ecb-maximize-window-history) (t "ma" ecb-maximize-window-analyse) (t "mb" ecb-maximize-window-speedbar) (t "e" eshell) (t "o" ecb-toggle-scroll-other-window-scrolls-compile) (t "\\" ecb-toggle-compile-window) (t "/" ecb-toggle-compile-window-height) (t "," ecb-cycle-maximized-ecb-buffers) (t "." ecb-cycle-through-compilation-buffers))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote ("~/develop/meizu/JellyBean/trunk" ("/" "/"))))
 '(jde-complete-function (quote jde-complete-menu))
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-registry (quote (("1.6.0" . "/home/leon/software/jdk1.6.0_31"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal))))
 '(cursor ((t (:background "green"))))
 '(region ((t (:background "blue" :foreground "#e1e1e0")))))

;;emacs-android
(add-to-list 'load-path "~/.emacs.d/emacs-android")
(require 'android-common)
(require 'android-compile)
(require 'android-host)

;;jde-int  //transfer  eclipse project configuration to emacs .el . 
(add-to-list 'load-path "~/.emacs.d/jde-int")
(require 'jde-int)

;;sina weibo 
(add-to-list 'load-path "~/.emacs.d/weibo.emacs-master")
(require 'weibo)

;;emacs theme 
(load-theme 'misterioso t)

;;global-search
(setq load-path (cons "~/.emacs.d/global" load-path))
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'ecb-mode-hook
    '(lambda ()
       (gtags-mode 1)
 ))

;;set ibus-el  , u could input chinese .   
(add-to-list 'load-path "~/.emacs.d/ibus-el-0.3.2")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

;;we will let mouse  go away ,when the cursor encounter it .funny
(mouse-avoidance-mode'animate) 

;;show the matched bracket .
(show-paren-mode t)
(setq show-paren-style'parentheses)

;;turn  on  spell check function 
(defun turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )
(add-hook 'text-mode-hook 'turn-spell-checking-on)

;;disable emacs's automatic backup 
;;(setq make-backup-files nil) ; stop creating those backup~ files
;;(setq auto-save-default nil) ; stop creating those #auto-save# files
;; make backup to a designated dir, mirroring the full path

;;put all backups place into one backup folder.
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/emacs-backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, ⁖ “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)
(setq make-backup-file-name-function 'my-backup-file-name)

;;show line numbers in margin. 
(global-linum-mode 1) 

;;=====================================dired function ==============================
;;allow dired to be able to delete or copy a whole dir .
;;means no asking , "top" means ask once . 
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))

;;use the same buffer for viewing directory.
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "<return>")
    'dired-find-alternate-file) ; was dired-advertised-find-file
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
))

;;make the ibuffer to show different color.
(defalias 'list-buffers 'ibuffer)

;; make buffer switch command show suggestions
(ido-mode 1)

(defun next-user-buffer ()
  "Switch to the next user buffer.User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

;;my customized global  key 
;; sample easy keys open and close dir & file 

(global-set-key (kbd "<f6>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f7>") 'kill-this-buffer) ; Close file

(global-set-key (kbd "<C-prior>") 'previous-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "<C-next>") 'next-user-buffer) ; Ctrl+PageDown
(global-set-key (kbd "<C-S-prior>") 'previous-emacs-buffer) ; Ctrl+Shift+PageUp
(global-set-key (kbd "<C-S-next>") 'next-emacs-buffer) ; Ctrl+Shift+PageDown

;;open current files in external app .
(defun ergoemacs-open-in-external-app ()
  "Open the current file or dired marked files in external app."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           (t (list (buffer-file-name))) ) ) )

    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files?") ) )

    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList)
        )
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList) ) ) ) ) )

(defun ergoemacs-open-in-desktop ()
  "Show current file in desktop (OS's file manager)."
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux")
    (let ((process-connection-type nil)) (start-process "" nil "xdg-open" "."))
    ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. ⁖ with nautilus
    ) ))

;;Open File Fast 
;;keep a list of recently opened files
(recentf-mode 1)
(global-set-key (kbd "<f8>") 'recentf-open-files) ;;set F8 to open a list of recently opened file

;;==================================dired end ===========================================

(global-set-key (kbd "<f2>") 'shell)
;;we start a new shell every time . 
(defadvice shell (around always-new-shell)
  "Always start a new shell."
  (let ((buffer (generate-new-buffer-name "*shell*"))) ad-do-it))
(ad-activate 'shell)
;; define some keys on gtags mode  , use f5 we could find a  class we want .
(global-set-key (kbd "<f5>") 'gtags-find-tag-from-here) 
  ;;save sessions when we startup
(desktop-save-mode 1)
