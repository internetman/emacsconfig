;;==================================emacs keybinding===============================
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
(put 'dired-find-alternate-file 'disabled nil)
;; sample easy keys open and close dir & file 
(global-set-key (kbd "<f6>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f7>") 'kill-this-buffer) ; Close file
