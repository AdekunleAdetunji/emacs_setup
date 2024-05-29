;; ===================================
;; MELPA Package Support
;; ===================================
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    blacken
    gruber-darker-theme
    nord-theme
    spacemacs-theme
    atom-one-dark-theme
    gruvbox-theme
    monokai-theme
    zenburn-theme
    doom-themes))  ;; Change the theme package here

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

(setq debug-on-error t)

;; ===================================
;; Basic Customization
;; ===================================
(setq inhibit-startup-message t)

(defun my-load-theme (theme)
  "Disable all enabled themes and load THEME."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))

;; Use this function to load a new theme
(my-load-theme 'doom-one)  ;; Replace 'doom-one with any other theme name

;; (global-linum-mode t)

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;; Set elpy to use system python
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Configure Black on Save
(add-hook 'python-mode-hook 'blacken-mode)
(setq blacken-line-length 79)

;; Enable detailed elpy debugging
(setq elpy-rpc-verbose t)

;; ====================================
;; C File Configuration
;; ====================================
(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)

;; ====================================
;; JavaScript Configuration
;; ====================================
(defun my-js-mode-hook ()
  (setq js-indent-level 2)
  (setq whitespace-style '(face empty lines-tail trailing)))
(add-hook 'js-mode-hook 'my-js-mode-hook)
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

;; ====================================
;; Miscellaneous
;; ====================================
(setq column-number-mode t)
(global-display-line-numbers-mode)

;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(line-number ((t (:foreground "orange")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(chess company puppet-mode)))
