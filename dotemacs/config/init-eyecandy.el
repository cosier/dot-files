(require-package 'smart-mode-line)
(require 'smart-mode-line)
(setq sml/theme 'dark)
(sml/setup)


(show-paren-mode)


(require-package 'pretty-symbols)
(require 'pretty-symbols)
(setq pretty-symbol-categories '(js))
(setq pretty-symbol-patterns '((955 js "\\<function\\>" (js2-mode)) (8592 js "\\<return\\>" (js2-mode))))
(add-hook 'find-file-hook (lambda () (pretty-symbols-mode)))

;; (require-package 'pretty-mode)
;; (setq pretty-default-groups nil)
;; (require 'pretty-mode)
;; (global-pretty-mode)

;; (require-package 'purty-mode)
;; (require 'purty-mode)
;; (setq purty-regexp-symbol-pairs (mapcar #'purty-enhance-pair '()))
;; (purty-add-pair '("\\(\\bfunction\\b\\)" . "λ"))
;; ;; (purty-add-pair '("\\(\\bfunction\\b\\)" . "Λ"))
;; ;; (purty-add-pair '("\\(\\bfunction\\b\\)" . "∫"))
;; ;; (purty-add-pair '("\\(\\bfunction\\b\\)" . "ƒ"))
;; ;; (purty-add-pair '("\\(\\breturn\\b\\)" . "◀◁"))
;; (purty-add-pair '("\\(\\breturn\\b\\)" . "←"))


(require-package 'diminish)
(after 'diminish-autoloads
  (diminish 'visual-line-mode)
  (after 'autopair (diminish 'autopair-mode))
  (after 'purty-mode (diminish 'purty-mode))
  (after 'undo-tree (diminish 'undo-tree-mode))
  (after 'auto-complete (diminish 'auto-complete-mode))
  (after 'projectile (diminish 'projectile-mode))
  (after 'yasnippet (diminish 'yas-minor-mode))
  (after 'guide-key (diminish 'guide-key-mode))
  (after 'eldoc (diminish 'eldoc-mode))
  (after 'smartparens (diminish 'smartparens-mode))
  (after 'company (diminish 'company-mode))
  (after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
  (after 'git-gutter+ (diminish 'git-gutter+-mode)))


(require 'linum)
(setq-default linum-format "%4d ")


(add-hook 'find-file-hook (lambda ()
                            (hl-line-mode)
                            (linum-mode)))


(provide 'init-eyecandy)
