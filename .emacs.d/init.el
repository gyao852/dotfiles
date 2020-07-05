;; George Yao
;; init.el
;; July 3rd, 2020
;; If you need ever help, use C-h <f/v>.

;; -----------------------
;; PACKAGES
;; -----------------------
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1)
  (bind-keys :map company-active-map
	     ("C-n" . company-select-next)
	     ("C-p" . company-select-previous))
  (global-company-mode t))
(use-package company-anaconda
  :ensure t
  :after (anaconda-mode company)
  :config (add-to-list 'company-backends 'company-anaconda)
  :hook ('python-mode-hook 'anaconda-mode))
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1.0)
  (which-key-mode))
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

;; -----------------------
;; UI SETUP
;; -----------------------
(setq inhibit-startup-message t)
(global-linum-mode 1)
(setq linum-format "%02d \u2502 ")
(setq column-number-mode t)
(if window-system
    (tool-bar-mode 0)
  (menu-bar-mode -1))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; -----------------------
;; ADDITIONAL FUNCTIONAL SETUP
;; -----------------------
(setq backup-before-writing t)
(setq make-backup-files t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
(setq c-basic-offset 4)
(setq c-indent-level 4)
(setq default-case-fold-search t)
(setq wrap-long-lines t)
(setq require-final-newline t)
(unless window-system
   (require 'mouse)
   (xterm-mouse-mode t)
   (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
   (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))
   (defun track-mouse (e))
   (setq mouse-sel-mode t)
)
(global-set-key [(control j)] 'goto-line)
(global-set-key [(control b)] 'end-of-buffer)
(global-set-key [(control t)] 'beginning-of-buffer)
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package xclip company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
