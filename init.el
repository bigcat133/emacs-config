;; (require 'package)
;; (setq package-archives
;;       '(("elpa"     . "https://elpa.gnu.org/packages/")
;;         ("melpa-stable" . "https://stable.melpa.org/packages/")
;;         ("melpa"        . "https://melpa.org/packages/"))
;;       package-archive-priorities
;;       '(("melpa-stable" . 10)
;;         ("elpa"     . 5)
;;         ("melpa"        . 11)))
;; (package-initialize)

;; (eval-when-compile
;;   (require 'use-package))

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
(set-default-font "Ubuntu Mono-16")
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

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (push (expand-file-name "site-lisp" user-emacs-directory) load-path)
  (push (expand-file-name "lisp" user-emacs-directory) load-path))

(defun add-subdirs-to-load-path (&rest _)
  "Add subdirectories to `load-path'."
  (let ((default-directory
          (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)

(require 'init-const)

(require 'init-custom)
(require 'init-package)

;; Preferences
(require 'init-basic)
(require 'init-funcs)

;; (require 'init-ui)
(require 'init-edit)
(require 'init-ivy)
(require 'init-company)
(require 'init-yasnippet)


(require 'init-calendar)
(require 'init-dashboard)
(require 'init-dired)
(require 'init-highlight)
(require 'init-ibuffer)
(require 'init-kill-ring)
;; (require 'init-persp)
(require 'init-window)
(require 'init-treemacs)

;; Programming
(require 'init-python)
