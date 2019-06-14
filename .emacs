(require 'package)
(setq package-archives
      '(("elpa"     . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("melpa-stable" . 10)
        ("elpa"     . 5)
        ("melpa"        . 11)))
(package-initialize)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq neo-smart-open -1)

(eval-when-compile
  (require 'use-package))

(global-set-key (kbd "M-;") 'comment-or-uncomment-region)

;; 设置开启ido模式
(ido-mode t)
;; 显示行号
(global-linum-mode t)
;; 显示列号
(setq column-number-mode t)
;; 显示括号匹配
(show-paren-mode t)
;; 设置TAB为4个空格
(setq default-tab-width 4)
(setq-default indent-tabs-mode t)
;; 禁用工具栏
(tool-bar-mode -1)
;; 设置字体
(set-default-font "Ubuntu Mono-17")
;; 显示日期
(setq display-time-day-and-date t)
(display-time)
;; 开启图片浏览
(require 'thumbs)
(auto-image-file-mode t)

;; 代码折叠
(load-library "hideshow")
(add-hook 'python-mode-hook 'hs-minor-mode)

;; 不要总是没完没了的问yes or no, 为什么不能用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; ----------------makedown----------------------
(autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command
   "pandoc -s -c /home/sunbjt/emacs/style.css --mathjax --highlight-style espresso")
 '(package-selected-packages
   (quote
    (lsp-mode virtualenv use-package opencl-mode neotree lsp-ui lsp-treemacs helm-lsp go-mode flycheck dap-mode counsel-gtags company-lsp auto-virtualenvwrapper))))

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

;; (add-hook 'c-mode-hook 'company-mode)
;; (add-hook 'c++-mode-hook 'company-mode)
;; (setenv "GTAGSLIBPATH" (concat "/usr/include"
;;                                ":"
;;                                (file-truename "/home/bigcat133/Downloads/lua-5.1.5/src")))
;; (setq company-backends '((company-dabbrev-code company-gtags)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )


(use-package lsp-mode
  :commands lsp)

(add-hook 'go-mode-hook #'lsp)

;; optional - provides fancier overlays
(use-package lsp-ui
  :commands lsp-ui-mode)

;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
(use-package company-lsp
  :commands company-lsp)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
