;;; packages.el --- bailey Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq bailey-packages
    '(
      ;; package names go here
      ruby-on-rails
      ))

;; List of packages to exclude.
(setq bailey-excluded-packages '())

;; For each package, define a function bailey/init-<package-name>
;;
;; (defun bailey/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun bailey/init-bailey ()
  (use-package jsx-mode)
  (use-package haml-mode)
  (use-package slim-mode)
  (use-package coffee-mode)
  (use-package web-mode)

  (add-to-list 'auto-mode-alist '("\\.cjsx\\'" . coffee-mode))
  (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode))
 )

(setq bailey-packages
      '(
        haml-mode
        slim-mode
        coffee-mode
        web-mode
        ))
