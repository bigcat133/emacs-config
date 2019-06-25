
;; ;; ----------------makedown----------------------
;; (autoload 'markdown-mode "markdown-mode"
;; 	"Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(markdown-command
;;    "pandoc -s -c /home/sunbjt/emacs/style.css --mathjax --highlight-style espresso")
;;  '(package-selected-packages
;;    (quote
;;     (lsp-mode virtualenv use-package opencl-mode neotree lsp-ui lsp-treemacs helm-lsp go-mode flycheck dap-mode counsel-gtags company-lsp auto-virtualenvwrapper))))



;; (use-package lsp-mode
;;   :commands lsp)

;; (add-hook 'go-mode-hook #'lsp)

;; ;; optional - provides fancier overlays
;; (use-package lsp-ui
;;   :commands lsp-ui-mode)

;; ;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
;; (use-package company-lsp
;;   :commands company-lsp)

;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
