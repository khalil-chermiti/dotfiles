;;; early-init.el --- Early initialization -*- lexical-binding: t; -*-

;; 1. Disable GUI window elements BEFORE the frame is rendered
(setq default-frame-alist
      '((undecorated . t)              ; Remove OS titlebar/decorations
        (fullscreen . maximized)        ; Start maximized
        (menu-bar-lines . 0)           ; Disable top menu bar
        (tool-bar-lines . 0)           ; Disable icon toolbar
        (vertical-scroll-bars . nil)    ; Disable vertical scrollbar
        (horizontal-scroll-bars . nil)  ; Disable horizontal scrollbar
        (internal-border-width . 0)))   ; Remove window border padding

(setq initial-frame-alist default-frame-alist)

;; 2. Disable GUI modes globally
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; 3. Disable startup splash screens & clutter
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      initial-scratch-message nil)

;; 4. UI/UX polish
(setq ring-bell-function 'ignore)       ; Silence audio/visual bell
(setq use-dialog-box nil)               ; Force prompts into minibuffer instead of popups
