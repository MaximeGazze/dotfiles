(load "~/.config/emacs/elpaca.el")
(load "~/.config/emacs/buffer-move.el")

;; fonts
(set-face-attribute 'default nil
										:font "Source Code Pro"
										:height 110
										:weight 'medium)
(set-face-attribute 'variable-pitch nil
										:font "Noto Sans"
										:height 110
										:weight 'medium)
(set-face-attribute 'fixed-pitch nil
										:font "Source Code Pro"
										:height 110
										:weight 'medium)
(add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
(setq-default line-spacing 0.12)

;; indent
(setq c-default-style "k&r"
      c-basic-offset 2)
(c-set-offset 'case-label '+)
(setq javascript-indent-level 2) ; javascript-mode
(setq typescript-indent-level 2) ; typescript-mode
(setq js-indent-level 2) ; js-mode
(setq js2-basic-offset 2) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
(setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
(setq web-mode-css-indent-offset 2) ; web-mode, css in html file
(setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
(setq css-indent-offset 2) ; css-mode
(setq-default tab-width 4)

;; Fix bad defaults
(setq x-select-enable-clipboard-manager nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))
(setq undo-tree-enable-undo-in-region nil)
;; disable menubar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; display line numbers
;; (global-display-line-numbers-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(global-visual-line-mode t)
(column-number-mode t)
;; transparency
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))
;; zoom
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;; Skip special buffers
(defadvice next-buffer (after avoid-messages-buffer-in-next-buffer)
  "Advice around `next-buffer' to avoid going into the *Messages* buffer."
  (when (string-match-p "^\*" (buffer-name))
    (next-buffer)))
(ad-activate 'next-buffer)
(defadvice previous-buffer (after avoid-messages-buffer-in-previous-buffer)
  "Advice around `previous-buffer' to avoid going into the *Messages* buffer."
  (when (string-match-p "^\*" (buffer-name))
    (previous-buffer)))
(ad-activate 'previous-buffer)

;; Packages
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-hsplit-window-below t)
  (setq evil-kill-on-visual-paste nil)
  (evil-mode)
  ;; (evil-set-undo-system 'undo-redo)
  )

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))

;; (use-package undo-tree
;;   :ensure t
;;   :after evil
;;   :diminish
;;   :config
;;   (global-undo-tree-mode 1))


(use-package lsp-mode
  :init
  (setq lsp-enable-snippet nil)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui)

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection)
							("<return>" . nil)
							("RET" . nil)))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(use-package ivy
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  (setq ivy-display-style 'fancy)
  :config
  (ivy-mode)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-initial-inputs-alist ())
  :bind (:map ivy-minibuffer-map
              ("<tab>" . ivy-alt-done)
							("<escape>" . minibuffer-keyboard-quit)))

(use-package counsel
  :after ivy
  :config
  (counsel-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
													ivy-rich-switch-buffer-align-virtual-buffer t
													ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package eshell-syntax-highlighting
  :after esh-mode
  :config
  (eshell-syntax-highlighting-global-mode +1)
  (setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
				eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
				eshell-history-size 5000
				eshell-buffer-maximum-lines 5000
				eshell-hist-ignoredups t
				eshell-scroll-to-bottom-on-input t
				eshell-destroy-buffer-when-process-dies t
				eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh")))

(use-package spacemacs-theme
  :config (load-theme 'spacemacs-dark t))

(use-package rainbow-mode
  :hook org-mode prog-mode)

(use-package restart-emacs)

(use-package which-key
  :init (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
				which-key-sort-order #'which-key-key-order-alpha
				which-key-sort-uppercase-first nil
				which-key-add-column-padding 1
				which-key-max-display-columns nil
				which-key-min-display-lines 6
				which-key-side-window-slot -10
				which-key-side-window-max-height 0.25
				which-key-idle-delay 0.8
				which-key-max-description-length 25
				which-key-allow-imprecise-window-fit t
				which-key-separator " → " ))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
							("C-c C-e" . markdown-do)))

(use-package go-mode
  :ensure t
  :hook
  (before-save . lsp-format-buffer)
  (before-save . lsp-organize-imports)
  (go-mode . lsp-deferred))

(use-package rustic
	:ensure t
	:custom (rustic-analyzer-command '("rustup" "run" "gentoo" "rust-analyzer"))
	:hook
	(rustic-mode . lsp-deferred))

(use-package general
  :config
  (general-evil-setup)
  
  (evil-define-key '(normal visual) global-map (kbd "TAB") 'indent-region)
  
  (general-create-definer kb/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (kb/leader-keys
    "SPC" '(execute-extended-command :wk "Execute a command")
    
    "b" '(:ignore t :wk "Buffer")
    "b i" '(switch-to-buffer :wk "Switch buffer")
    "b b" '(ibuffer :wk "Ibuffer")
    "b d" '(kill-this-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")

    "c" '(:ignore t :wk "Comment")
    "c l" '(comment-line :wk "Comment lines")
    
    "e" '(:ignore t :wk "Eshell/Evaluate")    
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    "e h" '(counsel-esh-history :which-key "Eshell history")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region")
    "e s" '(eshell :which-key "Eshell")

    "f" '(:ignore t :wk "File")
    "f f" '(find-file :wk "Find File")
    "f r" '(counsel-recentf :wk "Find recent files")
    "f s" '(save-buffer :wk "Save current file")
    "f e d" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Edit emacs config")

    "q" '(:ignore t :wk "Quit")
    "q q" '(save-buffers-kill-emacs :wk "Prompt quit")
    "q r" '(restart-emacs :wk "Restart")
    
    "w" '(:ignore t :wk "Window")
    ;; Window splits
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w s" '(evil-window-split :wk "Horizontal split window")
    "w v" '(evil-window-vsplit :wk "Vertical split window")
    "w d" '(evil-window-delete :wk "Delete window")
    ;; Window motions
    "w h" '(evil-window-left :wk "Window left")
    "w j" '(evil-window-down :wk "Window down")
    "w k" '(evil-window-up :wk "Window up")
    "w l" '(evil-window-right :wk "Window right")
    "w w" '(evil-window-next :wk "Goto next window")
    ;; Move Windows
    "w H" '(buf-move-left :wk "Buffer move left")
    "w J" '(buf-move-down :wk "Buffer move down")
    "w K" '(buf-move-up :wk "Buffer move up")
    "w L" '(buf-move-right :wk "Buffer move right")))
