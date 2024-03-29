;; init-python.el --- Initialize python configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2019 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; ;; Python Mode
;; ;; Install:
;; ;;   pip install pyflakes
;; ;;   pip install autopep8
;; (use-package python
;;   :ensure nil
;;   :defines gud-pdb-command-name pdb-path
;;   :config
;;   ;; Disable readline based native completion
;;   (setq python-shell-completion-native-enable nil)

;;   (add-hook 'inferior-python-mode-hook
;;             (lambda ()
;;               ;; (bind-key "C-c C-z" #'kill-buffer-and-window inferior-python-mode-map)
;;               (process-query-on-exit-flag (get-process "Python"))))

;;   ;; Live Coding in Python
;;   (use-package live-py-mode)

;;   ;; Format using YAPF
;;   ;; Install: pip install yapf
;;   (use-package yapfify
;;     :diminish yapf-mode
;;     :hook (python-mode . yapf-mode)))

;; myself config
(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv))

(use-package elpy
  :ensure t
  :init
  (setq elpy-rpc-backend "jedi")
  (elpy-enable)
  :config
  (add-hook 'python-mode-hook 'elpy-mode)
  (with-eval-after-load 'elpy
	(setq python-shell-interpreter "ipython"
		  python-shell-interpreter-args "-i --simple-prompt")
	(add-hook 'elpy-mode-hook 'flycheck-mode))
  :bind
  (("M-*" . pop-tag-mark)))

(load-file "/usr/share/emacs/site-lisp/material-theme.el")
(load-theme 'material t)
(setq python-check-command "flake8")

(provide 'init-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here
