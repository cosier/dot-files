;;; remember-theme-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "remember-theme" "remember-theme.el" (21313
;;;;;;  24790 0 0))
;;; Generated autoloads from remember-theme.el

(autoload 'remember-theme-save "remember-theme" "\
Creates (or replaces) remember-theme-file (default ~/.emacs-theme), and stores the name of
  the current Emacs theme, for retrieval by remember-theme-load

\(fn)" nil nil)

(autoload 'remember-theme-load "remember-theme" "\
Load the theme used last - This is stored in the
  remember-theme-file. The last line of .emacs-theme is read as the
  theme

  remember-theme-file (default ~/.emacs-theme) is created by
  remember-theme-save. Don't manually create or edit this file.

  Currently enabled themes will be disabled and the theme in
  remember-theme-file will be loaded.

  If no remember-theme-file exists the operation is skipped, and
  any currently loaded theme(s) will be left enabled.

\(fn)" nil nil)

(when load-file-name (add-hook 'after-init-hook 'remember-theme-load) (add-hook 'kill-emacs-hook 'remember-theme-save))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; remember-theme-autoloads.el ends here
