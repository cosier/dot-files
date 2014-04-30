;; EMACS BRO!!!!!
;;
;;

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(require 'cl)

(require 'init-packages)

(require 'init-util)
(require 'init-core)
(require 'init-org)
;;(require 'init-eyecandy)


(require 'init-editor)
(require 'init-smartparens)
(require 'init-autopair)

(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-company)

(require 'init-projectile)
(require 'init-helm)
(require 'init-ido)

;;require 'init-git)
(require 'init-flycheck)

;;(require 'init-vim)
(require 'init-stylus)
(require 'init-js)
(require 'init-web)
(require 'init-lisp)
(require 'init-markdown)

;;(require 'init-evil)
(require 'init-misc)
(require 'init-bindings)

;; Clojure related tooling
(unless (package-installed-p 'cider)
  (package-install 'cider))

(put 'upcase-region 'disabled nil)

(global-set-key (kbd "C-c h") 'helm-mini)

(setq default-directory "~/Developer/work/" )

;;(setq projectile-require-project-root nil)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

(menu-bar-mode -1)
(setq ns-pop-up-frames nil)

;; Setup the theming bro
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'brin t)

(global-hl-line-mode nil)
(hl-line-mode nil)

;;(set-face-background 'linum "brightblack")
;;(set-face-foreground 'linum "#999999")
;;(set-face-background hl-line-face "#000000")

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c l")       'delete-trailing-whitespace)

;; Load ruby mode when needed
(autoload 'ruby-mode "ruby-mode" "Ruby mode" t )
;; Assign .rb and .rake files to use ruby mode
(setq auto-mode-alist (cons '("\\.rb\\'" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake\\'" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\Gemfile\\'" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\Procfile\\'" . ruby-mode) auto-mode-alist))

;; Show syntax highlighting when in ruby mode
(add-hook 'ruby-mode-hook '(lambda () (font-lock-mode 1)))


;; Default tab width
(setq-default tab-width 4)

