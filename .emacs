;;-----------------------------------------------------------外观-----------------------------------------------------------;;
;; 字体保证中文是英文的两倍宽
;; Setting English Font
(set-face-attribute
 'default nil :font "Consolas 11")

;; 新开的窗口保持字体
(add-to-list 'default-frame-alist '(font . "Consolas 11"))

;;Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
					charset
					(font-spec :family "宋体" :size 16)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;-----------------------------------------------------------设置-----------------------------------------------------------;;
;; 只有一个实例
(server-force-delete)
(server-start)

;; 环境变量
;; (setenv "MSYS" "C:\\msys\\bin")
(setenv "MSYS" "C:\\MinGW\\msys\\1.0\\bin")
(setenv "MINGW" "C:\\MinGW\\bin")
(setenv "PUTTY" "C:\\Program Files (x86)\\PuTTY")
(setenv "LLVM" "C:\\Program Files (x86)\\LLVM\\bin")
(setenv "CMAKE" "C:\\Program Files (x86)\\CMake\\bin")
(setenv "GTAGSBIN" "c:\\gtags\\bin")
(setenv "PYTHON" "C:\\Python34")
(setenv "CYGWIN" "C:\\cygwin\\bin")
(setenv "GTAGSLABEL" "pygments")

(setenv "PATH"
		(concat
		 (getenv "MSYS")
		 path-separator
		 (getenv "MINGW")
		 path-separator
		 (getenv "PUTTY")
		 path-separator
		 (getenv "LLVM")
		 path-separator
		 (getenv "CMAKE")
		 path-separator
		 (getenv "GTAGSBIN")
		 path-separator
		 (getenv "PYTHON")
		 path-separator
		 (getenv "CYGWIN")
		 path-separator
		 (getenv "PATH")))

(add-to-list 'exec-path (getenv "CYGWIN"))
(add-to-list 'exec-path (getenv "PYTHON"))
(add-to-list 'exec-path (getenv "GTAGSBIN"))
(add-to-list 'exec-path (getenv "CMAKE"))
(add-to-list 'exec-path (getenv "LLVM"))
(add-to-list 'exec-path (getenv "MSYS"))
(add-to-list 'exec-path (getenv "MINGW"))


(defvar site-lisp-dir)
(if (and (eq emacs-minor-version 3)
		 (eq emacs-major-version 24))
	(setq site-lisp-dir (concat (getenv "emacs_dir") "\\site-lisp"))
  (setq site-lisp-dir (concat (getenv "emacs_dir") "\\share\\emacs\\site-lisp")))

;; windows的find跟gnu 的grep有冲突
(setq find-program (concat "\"" (getenv "MSYS") "\\find.exe\""))
(setq grep-program "grep -nH -F")		;-F按普通字符串搜索
;; 默认目录
(setq default-directory "~")

;; 启动mode
(setq initial-major-mode 'text-mode)

;; elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("melpa" . "http://melpa.milkbox.net/packages/")
						 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
;; mini buffer 的大小保持不变
;; (setq resize-mini-windows nil)
;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;; Load CEDET offical
(load-file "d:/cedet-master/cedet-devel-load.el")

;; cedet builtin
;; (require 'semantic )
;; (require 'semantic/decorate )

(semantic-mode t)
(global-semantic-decoration-mode t)
(global-semantic-stickyfunc-mode t)

(eval-after-load "cc-mode"
  '(progn  
	 ;; (require 'srecode)
	 
	 (global-ede-mode t)
	 (global-srecode-minor-mode t)
	 (global-semantic-highlight-edits-mode t)

	 ;; (setq semantic-c-obey-conditional-section-parsing-flag nil) ; ignore #ifdef
	 ;; let cedet call ctags to find things which cedet can not find
	 ;; (semantic-load-enable-all-ectags-support)
	 (semanticdb-enable-gnu-global-databases 'c-mode)
	 (semanticdb-enable-gnu-global-databases 'c++-mode)
	 (set-default 'semantic-case-fold t)
	 (setq semantic-c-takeover-hideif t)		;帮助hideif识别#if
	 ;; (setq ede-locate-setup-options (quote (ede-locate-global ede-locate-idutils)))
	 ))

;;修改标题栏，显示buffer的名字
(setq frame-title-format "%b [%+] %f")
(setq icon-title-format "%b [%+] %f")

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;; vc编译设置(2005)
(setenv "VSINSTALLDIR" "C:\\Program Files (x86)\\Microsoft Visual Studio 8")
(setenv "VCINSTALLDIR" "C:\\Program Files (x86)\\Microsoft Visual Studio 8\\VC")
(setenv "FrameworkDir" "C:\\WINDOWS\\Microsoft.NET\\Framework")
(setenv "FrameworkVersion" "v2.0.50727")
(setenv "FrameworkSDKDir" "C:\\Program Files (x86)\\Microsoft Visual Studio 8\\SDK\\v2.0")
(setenv "CommonDevEnvDir" "C:\\Program Files (x86)\\Microsoft Visual Studio 8\\Common7")
(setenv "DevEnvDir"
		(concat (getenv "CommonDevEnvDir") "\\IDE"))
(setenv "PATH"
		(concat (getenv "DevEnvDir")
				path-separator
				(concat (getenv "VCINSTALLDIR") "\\BIN")
				path-separator
				(concat (getenv "CommonDevEnvDir") "\\Tools")
				path-separator
				(concat (getenv "CommonDevEnvDir") "\\Tools\\bin")
				path-separator
				(concat (getenv "VCINSTALLDIR") "\\PlatformSDK\\bin")
				path-separator
				(concat (getenv "FrameworkSDKDir") "\\bin")
				path-separator
				(concat (getenv "FrameworkDir") "\\" (getenv "FrameworkVersion"))
				path-separator
				(concat (getenv "VCINSTALLDIR") "\\VCPackages")
				path-separator
				(getenv "PATH")))
(setenv "INCLUDE"
		(concat
		 (concat (getenv "VCINSTALLDIR") "\\ATLMFC\\INCLUDE")
		 path-separator
		 (concat (getenv "VCINSTALLDIR") "\\INCLUDE")
		 path-separator
		 (concat (getenv "VCINSTALLDIR") "\\PlatformSDK\\include")
		 path-separator
		 (concat (getenv "VSINSTALLDIR") "\\SDK\\v2.0\\include")
		 path-separator
		 (getenv "INCLUDE")))
(setenv "LIB" (concat
			   (concat (getenv "VCINSTALLDIR") "\\ATLMFC\\LIB")
			   path-separator
			   (concat (getenv "VCINSTALLDIR") "\\LIB")
			   path-separator
			   (concat (getenv "VCINSTALLDIR") "\\PlatformSDK\\lib")
			   path-separator
			   (concat (getenv "VSINSTALLDIR") "\\SDK\\v2.0\\lib")
			   path-separator
			   (getenv "LIB")))
(setenv  "LIBPATH"
		 (concat
		  (concat (getenv "FrameworkDir") "\\" (getenv "FrameworkVersion"))
		  path-separator
		  (concat (getenv "VCINSTALLDIR") "\\ATLMFC\\LIB")))

(setq compile-command "devenv.com projects.sln /build \"Debug|Win32\"") ;可以传sln 或vcproj编译工程
;; tab补全时忽略大小写
(setq-default completion-ignore-case t)
;; DIRED的时间显示格式
(setq ls-lisp-format-time-list  '("%Y-%m-%d %H:%M:%S" "%Y-%m-%d %H:%M:%S")
      ls-lisp-use-localized-time-format t)
;; 优先横分割窗口
(setq split-width-threshold 9999)	;增大向右分割的要求
;; (setq split-height-threshold 0)

;; 自动添加的设置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-disable-faces nil)
 '(ac-ignore-case t)
 '(ac-trigger-key "TAB")
 '(ac-use-menu-map t)
 '(ad-redefinition-action (quote accept))
 '(auto-save-default nil)
 '(autopair-blink nil)
 '(back-button-local-keystrokes nil)
 '(back-button-mode-lighter "")
 '(backward-delete-char-untabify-method nil)
 '(bookmark-save-flag 1)
 '(bookmark-sort-flag nil)
 '(column-number-mode t)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 100)
 '(company-tooltip-align-annotations t)
 '(company-transformers (quote (company-sort-by-occurrence)))
 '(compilation-scroll-output t)
 '(compilation-skip-threshold 2)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(cua-mode t nil (cua-base))
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(display-time-mode nil)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(electric-indent-mode t)
 '(electric-pair-inhibit-predicate (quote my-electric-pair-conservative-inhibit))
 '(enable-local-variables :all)
 '(eww-search-prefix "http://cn.bing.com/search?q=")
 '(explicit-shell-file-name "bash")
 '(fa-insert-method (quote name-and-parens-and-hint))
 '(fci-eol-char 32)
 '(flycheck-check-syntax-automatically nil)
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-indication-mode (quote right-fringe))
 '(frame-resize-pixelwise t)
 '(ggtags-highlight-tag-delay 16)
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(git-gutter:update-interval 2)
 '(global-auto-revert-mode t)
 '(grep-template "grep <X> <C> -nH -F <R> <F>")
 '(gtags-ignore-case nil)
 '(helm-ag-base-command "ag --nocolor --nogroup -S -Q ")
 '(helm-ag-fuzzy-match t)
 '(helm-buffer-max-length 40)
 '(helm-candidate-number-limit 2000)
 '(helm-for-files-preferred-list
   (quote
	(helm-source-buffers-list helm-source-bookmarks helm-source-recentf)))
 '(helm-gtags-auto-update t)
 '(helm-gtags-cache-max-result-size 204857600)
 '(helm-gtags-cache-select-result t)
 '(helm-gtags-display-style (quote detail))
 '(helm-gtags-ignore-case t)
 '(helm-gtags-maximum-candidates 2000)
 '(helm-gtags-suggested-key-mapping t)
 '(helm-gtags-update-interval-second nil)
 '(helm-semantic-display-style
   (quote
	((python-mode . semantic-format-tag-summarize)
	 (c-mode . semantic-format-tag-uml-prototype-default)
	 (emacs-lisp-mode . semantic-format-tag-abbreviate-emacs-lisp-mode))))
 '(helm-truncate-lines t)
 '(horizontal-scroll-bar-mode t)
 '(icomplete-show-matches-on-no-input t)
 '(ido-mode (quote both) nil (ido))
 '(imenu-max-item-length 120)
 '(imenu-max-items 1000)
 '(inhibit-startup-screen t)
 '(jit-lock-context-time 1.5)
 '(jit-lock-defer-time 0.5)
 '(large-file-warning-threshold 20000000)
 '(ls-lisp-verbosity nil)
 '(make-backup-files nil)
 '(mode-require-final-newline nil)
 '(moo-select-method (quote helm))
 '(mouse-wheel-progressive-speed nil)
 '(org-src-fontify-natively t)
 '(password-cache-expiry nil)
 '(pcmpl-gnu-tarfile-regexp "")
 '(recentf-auto-cleanup 600)
 '(rm-blacklist
   (quote
	(" hl-p" " yas" " hs" " Ifdef" " pair" " HelmGtags" " GG" " company" " ElDoc" " Irony" " AC" " FA" " GitGutter" " Gtags")))
 '(save-place t nil (saveplace))
 '(semantic-c-dependency-system-include-path
   (quote
	("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include" "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/PlatformSDK/Include" "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/atlmfc/include" "C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/include" "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/include" "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/atlmfc/include" "C:/cygwin/usr/include" "D:/linux/linux-3.18.3/include/uapi")))
 '(semantic-idle-scheduler-idle-time 5)
 '(semantic-idle-scheduler-max-buffer-size 200000)
 '(semantic-imenu-bucketize-file nil)
 '(semantic-imenu-summary-function (quote semantic-format-tag-abbreviate))
 '(semantic-lex-spp-use-headers-flag t)
 '(semantic-symref-results-summary-function (quote semantic-format-tag-abbreviate))
 '(shell-completion-execonly nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(sln-mode-devenv-2008 "Devenv.com")
 '(switch-window-shortcut-style (quote (quote qwerty)))
 '(tab-width 4)
 '(undo-outer-limit 20000000)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(user-full-name "gezijian")
 '(vc-svn-program "C:\\Program Files\\TortoiseSVN\\bin\\svn")
 '(whitespace-line-column 121)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "peach puff"))))
 '(helm-lisp-show-completion ((t (:background "navajo white"))))
 '(helm-selection-line ((t (:background "light steel blue" :underline t))))
 '(zjl-hl-local-variable-reference-face ((t (:foreground "dark slate gray"))))
 '(zjl-hl-member-reference-face ((t (:foreground "dark goldenrod" :slant normal :weight normal)))))
;;-----------------------------------------------------------plugin begin-----------------------------------------------------------;;
;; ggtags
(autoload 'ggtags-mode "ggtags" "" t)
(eval-after-load "ggtags"
  '(progn
	 (remove-function (local 'eldoc-documentation-function) 'ggtags-eldoc-function)
	 (define-key ggtags-mode-map (kbd "M-.") nil)
	 (define-key ggtags-mode-map (kbd "M-,") nil)
	 ;; (define-key ggtags-mode-map (kbd "M-]") 'ggtags-find-tag-dwim)
	 ;; (define-key ggtags-mode-map (kbd "C-M-]") 'ggtags-find-reference)
	 (define-key ggtags-mode-map (kbd "C-M-.") nil)
	 (define-key ggtags-mode-map [S-down-mouse-1] 'ignore)
	 (define-key ggtags-mode-map [S-down-mouse-3] 'ignore)
	 ;; (define-key ggtags-mode-map (kbd "<S-mouse-1>") 'ggtags-find-tag-mouse)
	 ;; (define-key ggtags-mode-map (kbd "<S-mouse-3>") 'ggtags-prev-mark)
	 ;; (define-key ggtags-mode-map (kbd "<C-S-mouse-3>") 'ggtags-next-mark)
	 (define-key ggtags-highlight-tag-map [S-down-mouse-1] 'ignore)
	 (define-key ggtags-highlight-tag-map [S-down-mouse-3] 'ignore)
	 ;; (define-key ggtags-highlight-tag-map (kbd "<S-mouse-1>") 'ggtags-find-tag-mouse)
	 ;; (define-key ggtags-highlight-tag-map (kbd "<S-mouse-3>") 'ggtags-prev-mark)
	 ;; (define-key ggtags-highlight-tag-map (kbd "<C-S-mouse-3>") 'ggtags-next-mark)
	 (define-key ggtags-mode-map (kbd "M-?") 'ggtags-show-definition)
	 (define-key ggtags-highlight-tag-map (kbd "<mouse-2>") 'ggtags-show-definition)
	 (define-key ggtags-mode-map (kbd "C-c p") 'ggtags-find-file)
	 (setq ggtags-mode-line-project-name nil)
	 ))

;; gtags
(setq gtags-suggested-key-mapping nil)
(setq gtags-disable-pushy-mouse-mapping t)
(autoload 'gtags-mode "gtags" nil t)
(eval-after-load "gtags"
  '(progn
	 (define-key gtags-mode-map [S-down-mouse-1] 'ignore)
	 (define-key gtags-mode-map [S-down-mouse-3] 'ignore)
	 (define-key gtags-mode-map (kbd "<S-mouse-3>") 'gtags-pop-stack)
	 (define-key gtags-mode-map (kbd "<S-mouse-1>") 'gtags-find-tag-by-event)
	 (define-key gtags-mode-map (kbd "C-c i") 'gtags-find-with-idutils)
	 (define-key gtags-select-mode-map "p" 'previous-line)
	 (define-key gtags-select-mode-map "n" 'next-line)
	 (define-key gtags-select-mode-map "q" 'kill-this-buffer)
	 (define-key gtags-select-mode-map [S-down-mouse-3] 'ignore)
	 (define-key gtags-select-mode-map [S-down-mouse-1] 'ignore)
	 (define-key gtags-select-mode-map (kbd "<S-mouse-3>") 'gtags-pop-stack)
	 (define-key gtags-select-mode-map (kbd "<S-mouse-1>") 'gtags-select-tag-by-event)
	 ))

;; 选中单位
(autoload 'er/expand-region "expand-region" nil t)
(global-set-key (kbd "M-s") 'er/expand-region)

;; undo redo
(require 'redo+)
(setq undo-no-redo t)
(global-set-key (kbd "C-/") 'redo)

;; stl(解析vector map等)
(setq stl-base-dir "c:/Program Files (x86)/Microsoft Visual Studio 8/VC/include")
(setq stl-base-dir-12 "c:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/include")

;; 设置成c++文件类型
(add-to-list 'auto-mode-alist (cons stl-base-dir 'c++-mode))
(add-to-list 'auto-mode-alist (cons stl-base-dir-12 'c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; 工程设置
(eval-after-load "cc-mode"
  '(progn
	 (defun create-spec-ede-project (root-file known)
	   (if known
		   (ede-cpp-root-project "code" :file root-file
								 :include-path '( "/include" "/server" "/upf"
												  "/upf_dubhe/export" "/UPF_SMI/Include" "/Service/TG/MM/RM/Source/PMM")
								 :spp-files '( "Service/TG/MM/RM/Source/PMM/RMPmm_Const.h"
											   "Service/TG/MM/RM/Include/RM_switch.h"
											   "Service/TG/MM/RM/Include/RM_Debug.h"
											   "ede_switch.h" ;ON OFF宏写成(1)(0)的话不能识别
											   )
								 :spp-table '(("IN" . "")
											  ("OUT" . "")
											  ("INOUT" . "") ;如果在函数参数前加上这样的宏会导致无法识别
											  ))
		 (ede-cpp-root-project "code" :file root-file)))

	 (defun create-known-ede-project(&optional select)
	   (interactive "P")
	   (if select
		   (setq root-file (read-file-name "Open a root file in proj: "))
		 (setq root-file "./GTAGS"))
	   (create-spec-ede-project root-file t)
	   ;; (find-sln root-file)
	   (message "Known EDE Project Created." ))

	 (defun create-unknown-ede-project(&optional select)
	   (interactive "P")
	   (if select
		   (setq root-file (read-file-name "Open a root file in proj: "))
		 (setq root-file "./GTAGS"))
	   (create-spec-ede-project root-file nil)
	   ;; (find-sln root-file)
	   (message "UnKnown EDE Project Created." ))

	 (global-set-key (kbd "C-c e") 'create-known-ede-project)
	 (global-set-key (kbd "C-c u") 'create-unknown-ede-project)

	 (create-spec-ede-project "e:/projects/tempspace/test4c/GTAGS" nil)
	 (create-spec-ede-project "e:/projects/eNavi2_800X480_ChangeUI/GTAGS" t)
	 (create-spec-ede-project "e:/projects/Clarion_13MY_Dev_For_MM/GTAGS" t)
	 ))

;;auto-complete
(require 'auto-complete-config)
(defadvice ac-cc-mode-setup(after my-ac-setup activate)
  ;; (setq ac-sources (delete 'ac-source-gtags ac-sources))
  ;; (setq ac-sources (append '(ac-source-c-headers) ac-sources))
  ;; (setq ac-sources (append '(ac-source-irony) ac-sources))
  (setq ac-sources (append '(ac-source-semantic) ac-sources))
  )
(eval-after-load "auto-complete-config"
  '(progn
	 ;; (require 'auto-complete-c-headers )
	 ;; (require 'ac-irony)
	 (message "auto-complete-config")

	 (define-key ac-mode-map  (kbd "M-RET") 'auto-complete)
	 (define-key ac-completing-map  (kbd "M-s") 'ac-isearch)

	 (ac-config-default)
	 (setq ac-modes (append '(objc-mode) ac-modes))

	 (setq-default ac-sources '(ac-source-dictionary ac-source-words-in-same-mode-buffers))
	 ;; (define-key irony-mode-map (kbd "M-p") 'ac-complete-irony-async)
	 ))

;; company
(autoload 'company-mode "company" nil t)
(eval-after-load "company"
  '(progn
	 (require 'company-irony nil t )
	 (require 'company-c-headers nil t )
	 (setq company-async-timeout 15)
	 ;; (add-hook 'after-init-hook 'global-company-mode)
	 (add-to-list 'company-backends 'company-irony)
	 (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
	 (global-set-key (kbd "<S-return>") 'company-complete)
	 (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
	 (define-key company-active-map (kbd "M-s") 'company-filter-candidates)
	 ;; (add-to-list 'company-backends 'company-c-headers)
	 ))

;;yasnippet
(autoload 'yas-global-mode "yasnippet" nil t)
(autoload 'yas-minor-mode "yasnippet" nil t)
(setq yas-snippet-dirs (concat site-lisp-dir "\\yasnippet-master\\snippets"))

(setq yas-glo-on nil)
(defun yas-glo-on ()
  (interactive "P")
  (unless yas-glo-on (yas-global-mode 1))
  (setq yas-glo-on t)
  )

;; sln解析
(autoload 'find-sln "sln-mode" nil t)
(eval-after-load "project-buffer-mode"
  '(progn
	 (require 'project-buffer-mode+)
	 (project-buffer-mode-p-setup)
	 (require 'project-buffer-occur)
	 (define-key project-buffer-mode-map [?r] 'project-buffer-occur);; 要想全局搜索需要加C-u
	 (define-key project-buffer-mode-map [?m] 'project-buffer-occur-case-sensitive)
	 ;; (define-key global-map (kbd "<M-f6>") 'project-buffer-mode-p-go-to-attached-project-buffer)
	 ;; (define-key global-map (kbd "<C-f6>") 'project-buffer-mode-p-run-project-buffer-build-action)
	 ))

(global-set-key (kbd "C-c l") 'find-sln)

;; 前进、后退
(require 'recent-jump-small)
(setq rjs-mode-line-format nil)
(recent-jump-small-mode)
(global-set-key (kbd "<M-left>") 'recent-jump-small-backward)
(global-set-key (kbd "<M-right>") 'recent-jump-small-forward)

;; bookmark
(autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
(autoload 'bm-next     "bm" "Goto bookmark."                     t)
(autoload 'bm-previous "bm" "Goto previous bookmark."            t)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(setq bm-cycle-all-buffers t)

;; 更多的语法高亮
(eval-after-load "cc-mode"
  '(progn
	 (require 'zjl-c-hl-aggressive )
	 ;; (require 'semantic/bovine/c nil 'noerror)
	 ;; (require 'zjl-hl)
	 ;; (zjl-hl-enable-global 'c-mode)
	 ;; (zjl-hl-enable-global 'c++-mode)
	 ))

;; 显示列竖线
(autoload 'fci-mode "fill-column-indicator" "" t)
(global-set-key (kbd "C-:") 'fci-mode)
(setq fci-rule-column 120)
(defun fci-all-window-refresh ()
  (setq proced-buf-list nil)	;保存已经处理过的buf
  (walk-windows
   #'(lambda (w)
	   (select-window w)
	   (if (or (eq major-mode 'c-mode)
			   (eq major-mode 'c++-mode))
		   (progn 
			 (unless (and (memq (window-buffer) proced-buf-list)
						  (>= (window-width w) fci-rule-column))
			   (push (window-buffer) proced-buf-list)
			   (turn-on-fci-mode)
			   (if (< (window-width w) fci-rule-column)
				   (turn-off-fci-mode))))))
   0))
(eval-after-load "fill-column-indicator"
  '(progn
	 ;; 避免破坏 auto complete
	 (defun sanityinc/fci-enabled-p () (symbol-value 'fci-mode))

	 (defvar sanityinc/fci-mode-suppressed nil)
	 (make-variable-buffer-local 'sanityinc/fci-mode-suppressed)

	 (defadvice popup-create (before suppress-fci-mode activate)
	   "Suspend fci-mode while popups are visible"
	   (let ((fci-enabled (sanityinc/fci-enabled-p)))
		 (when fci-enabled
		   (setq sanityinc/fci-mode-suppressed fci-enabled)
		   (turn-off-fci-mode))))

	 (defadvice popup-delete (after restore-fci-mode activate)
	   "Restore fci-mode when all popups have closed"
	   (when (and sanityinc/fci-mode-suppressed
				  (null popup-instances))
		 (setq sanityinc/fci-mode-suppressed nil)
		 (turn-on-fci-mode)))

	 ;; 避免和company冲突
	 (defvar-local company-fci-mode-on-p nil)

	 (defun company-turn-off-fci (&rest ignore)
	   (when (boundp 'fci-mode)
		 (setq company-fci-mode-on-p fci-mode)
		 (when fci-mode (fci-mode -1))))

	 (defun company-maybe-turn-on-fci (&rest ignore)
	   (when company-fci-mode-on-p (fci-mode 1)))

	 (add-hook 'company-completion-started-hook 'company-turn-off-fci)
	 (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
	 (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)

	 ;; 根据窗口分割情况刷新FCI

	 ;; (defadvice split-window-right (after split-window-right-fci activate)
	 ;;   ""
	 ;;   (fci-all-window-refresh))

	 ;; (defadvice delete-other-windows (after delete-other-windows-fci activate)
	 ;;   ""
	 ;;   (fci-all-window-refresh))

	 ;; (defadvice mouse-delete-window (after mouse-delete-window-fci activate)
	 ;;   ""
	 ;;   (fci-all-window-refresh))

	 ;; (defadvice delete-window (after delete-window-fci activate)
	 ;;   ""
	 ;;   (fci-all-window-refresh))

	 ;; (defadvice switch-to-buffer (after switch-to-buffer-fci activate)
	 ;;   ""
	 ;;   (fci-all-window-refresh))
	 ))
;; 异步copy rename文件
(autoload 'dired-async-mode "dired-async.el" nil t)

;; helm系列
(autoload 'helm-show-kill-ring "helm-config" nil t)
(autoload 'helm-semantic-or-imenu "helm-config" nil t)
(autoload 'helm-for-files "helm-config" nil t)
(autoload 'helm-resume "helm-config" nil t)
(autoload 'helm-gtags-mode "helm-gtags" nil t)
(autoload 'helm-gtags-select "helm-gtags" nil t)
(autoload 'helm-gtags-select-path "helm-gtags" nil t)
(autoload 'helm-gtags-find-tag "helm-gtags" nil t)
(autoload 'helm-gtags-find-files "helm-gtags" nil t)
(autoload 'helm-gtags-create-tags "helm-gtags" nil t)
(autoload 'helm-gtags-update-tags "helm-gtags" nil t)

(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

(autoload 'helm-occur "helm-gtags" nil t)
(autoload 'helm-swoop "helm-swoop" nil t)
(autoload 'helm-swoop-from-isearch "helm-swoop" nil t)

(autoload 'helm-ag-this-file "helm-ag" nil t)


(eval-after-load "helm"
  '(progn
	 (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
	 (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
	 (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
	 ))

(global-set-key (kbd "C-S-v") 'helm-show-kill-ring)
(global-set-key (kbd "<apps>") 'helm-semantic-or-imenu)
(global-set-key (kbd "<C-apps>") 'helm-for-files)
(global-set-key (kbd "<S-apps>") 'helm-resume)
(global-set-key (kbd "<M-apps>") 'helm-ag-this-file)
(global-set-key (kbd "M-p") 'helm-swoop)

(global-set-key (kbd "C-c b") 'helm-gtags-find-files)
(global-set-key (kbd "C-c d") 'helm-gtags-find-tag)
(global-set-key (kbd "<f6>") 'helm-gtags-select-path)
(global-set-key (kbd "<f7>") 'helm-gtags-select)
(global-set-key (kbd "<S-f5>") 'helm-gtags-create-tags)
(global-set-key (kbd "<f5>") 'helm-gtags-update-tags)

(eval-after-load "helm-gtags"
  '(progn
	 (define-key helm-gtags-mode-map (kbd "C-]") nil)
	 (define-key helm-gtags-mode-map (kbd "C-t") nil)
	 (define-key helm-gtags-mode-map (kbd "M-*") nil)
	 (define-key helm-gtags-mode-map (kbd "C-\\") 'helm-gtags-dwim)
	 (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-previous-history)
	 (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-next-history)
	 (define-key helm-gtags-mode-map (kbd "C-|") 'helm-gtags-find-tag-other-window)
	 (define-key helm-gtags-mode-map (kbd "C-M-,") 'helm-gtags-show-stack)
	 ))

(add-hook 'helm-update-hook
		  (lambda ()
			(setq truncate-lines t)))
;; back button
;; (require 'back-button)
;; (back-button-mode 1)

;; flycheck
(autoload 'flycheck-mode "flycheck" nil t)
(global-set-key (kbd "M-g l") 'flycheck-list-errors)
(global-set-key (kbd "<M-f5>") 'flycheck-buffer)

;; irony-mode
(eval-after-load "cc-mode"
  '(progn
	 (require 'irony-cdb nil t)
	 (require 'irony-eldoc )
	 ))

(eval-after-load "irony"
  '(progn
	 (defun my-irony-mode-hook ()
	   (define-key irony-mode-map [remap completion-at-point]
		 'irony-completion-at-point-async)
	   (define-key irony-mode-map [remap complete-symbol]
		 'irony-completion-at-point-async))
	 (add-hook 'irony-mode-hook 'my-irony-mode-hook)
	 (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
	 (add-hook 'irony-mode-hook 'irony-eldoc)
	 (setq w32-pipe-read-delay 0)
	 (setq process-adaptive-read-buffering nil)
	 ))
(eval-after-load "flycheck"
  '(progn
	 (require 'flycheck-irony )
	 (add-to-list 'flycheck-checkers 'irony)))

;; 行号性能改善
(require 'nlinum )
(global-nlinum-mode 1)

;; lua mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; 打开大文件
(require 'vlf-setup)
(eval-after-load "vlf"
  '(progn
	 (define-key vlf-prefix-map (kbd "C-c v") vlf-mode-map)))

;; ace
(define-key cua--cua-keys-keymap [(meta v)] nil)
(autoload 'ace-window "ace-window" nil t)
(autoload 'ace-jump-char-mode "ace-jump-mode" nil t)

(eval-after-load "ace-window"
  '(progn
	 (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))))

(eval-after-load "ace-jump-mode"
  '(progn
	 (setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))))

(global-set-key (kbd "M-v") 'ace-window)
(global-set-key (kbd "M-j") 'ace-jump-char-mode)


;; 查看diff
(require 'diff-hl-margin )
(global-diff-hl-mode)
;; (autoload 'diff-hl-dired-mode "diff-hl-margin" nil t)
;; (autoload 'turn-on-diff-hl-mode "diff-hl-margin" nil t)

;; (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
;; (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

;; wgrep
(autoload 'wgrep-setup "wgrep")
(add-hook 'grep-setup-hook 'wgrep-setup)
(setq wgrep-enable-key "r")

;; refactor
(autoload 'srefactor-refactor-at-point "srefactor" nil t)
(global-set-key (kbd "C-.") 'srefactor-refactor-at-point)

;; 括号
(require 'autopair)
(autopair-global-mode)

;; mode line
(require 'rich-minority)
(rich-minority-mode 1)

;; fast silver searcher
(autoload 'my-ag "ag" nil t)
(autoload 'ag-this-file "ag" nil t)
(autoload 'ag-dired "ag" nil t)
(autoload 'ag-dired-regexp "ag" nil t)

(global-set-key (kbd "<f9>") 'ag-this-file)
(global-set-key (kbd "<C-f9>") 'my-ag)
(global-set-key (kbd "<S-f9>") 'ag-dired-regexp)
;; C-c C-k 停止ag-dired

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)

(eval-after-load "ag"
  '(progn
	 (require 'grep )
	 (defun my-ag (string directory)
	   ""
	   (interactive (list (grep-read-regexp)
						  (read-directory-name "Directory: ")))
	   (ag/search string directory))

	 (defun my-ag-project (string)
	   ""
	   (interactive (list (grep-read-regexp)))
	   (ag/search string (ag/project-root default-directory)))
	 
	 (defun ag-this-file (string file-regex directory)
	   ""
	   (interactive (list (grep-read-regexp)
						  (setq file-regex (list :file-regex
												 (concat "/" (file-name-nondirectory (buffer-file-name) ) "$")))
						  (setq directory default-directory)))
	   (setq arg-bak ag-arguments)
	   (add-to-list 'ag-arguments "-u")
	   (apply #'ag/search string directory file-regex)
	   (setq ag-arguments arg-bak))
	 ))

;; magit
(setenv "GIT_ASKPASS" "git-gui--askpass") ;解决git push不提示密码的问题
;; 要想保存密码不用每次输入得修改.git-credentials和.gitconfig
(require 'magit-autoloads)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; purpose
(autoload 'purpose-mode "window-purpose" nil t)
(global-set-key (kbd "<C-f10>") 'purpose-mode)

;; func args
(require 'function-args )
(global-set-key (kbd "<M-S-return>") 'fa-show)

;; 星际译王
(defun kid-sdcv-to-buffer (&optional input)
  (interactive "P")
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
				(current-word nil t))))
	(if input
		(setq word (read-string (format "Search the dictionary for (default %s): " word)
								nil nil word)))
    
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
	(message "searching for %s ..." word)

    (let ((process (start-process  "sdcv" "*sdcv*"  "sdcv" "-n" "--utf8-input" "--utf8-output" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (bury-buffer)
                                        (unless (null (cdr (window-list))) ; only one window
                                          (delete-window)))))
           (goto-char (point-min))))))))

(global-set-key (kbd "<M-f11>") 'kid-sdcv-to-buffer)
;;-----------------------------------------------------------plugin end-----------------------------------------------------------;;

;;-----------------------------------------------------------define func begin-----------------------------------------------------------;;
;; 资源管理器中打开
(defun open-in-desktop-select (&optional dired)
  (interactive "P")
  (let ((file (buffer-name)))
	(if dired
		;; (setq file (dired-get-filename 'no-dir)) ;xp
		(setq file (replace-regexp-in-string "/" "\\\\" (dired-get-filename) )) ;win7
	  ;; (setq file (file-name-nondirectory (buffer-file-name) )) ;xp
	  (setq file (replace-regexp-in-string "/" "\\\\" (buffer-file-name) ))) ;win7
	(call-process-shell-command (concat "explorer" "/select," file))
	)
  )


(defun open-in-desktop-select-dired(arg)
  (interactive "P")
  (open-in-desktop-select t)
  )

;; #if 0灰色
(defun my-c-mode-font-lock-if0 (limit)
  (save-restriction
	(widen)
	(save-excursion
	  (goto-char (point-min))
	  (let ((depth 0) str start start-depth)
		(while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
		  (setq str (match-string 1))
		  (if (string= str "if")
			  (progn
				(setq depth (1+ depth))
				(when (and (null start) (looking-at "\\s-+0"))
				  (setq start (match-end 0)
						start-depth depth)))
			(when (and start (= depth start-depth))
			  (c-put-font-lock-face start (match-beginning 0) 'shadow)
			  (setq start nil))
			(when (string= str "endif")
			  (setq depth (1- depth)))))
		(when (and start (> depth 0))
		  (c-put-font-lock-face start (point) 'shadow)))))
  nil)

(defun my-c-mode-common-hook-if0 ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 shadow prepend))) 'add-to-end))


;; 添加删除注释
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
	  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
	(comment-dwim arg)))

(global-set-key "\M-'" 'qiang-comment-dwim-line)

;; 拷贝代码自动格式化默认是粘贴完后按c-m-\会格式化粘贴内容)
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
	  (and (not current-prefix-arg)
		   (member major-mode
				   '(emacs-lisp-mode
					 lisp-mode
					 c-mode
					 c++-mode
					 ))
		   (let ((mark-even-if-inactive transient-mark-mode))
			 (indent-region (region-beginning) (region-end) nil))))))

;; 跳到匹配的括号处
(defun his-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (let ((prev-char (char-to-string (preceding-char)))
		(next-char (char-to-string (following-char))))
	(cond ((string-match "[[{(<（]" next-char) (forward-sexp 1))
		  ((string-match "[\]})>）]" prev-char) (backward-sexp 1))
		  )))

;; 选中括号间的内容
(defun select-match ()
  "select between match paren"
  (interactive)
  (cua-set-mark)
  (his-match-paren 1))

(global-set-key (kbd "C-'") 'his-match-paren)
(global-set-key (kbd "C-\"") 'select-match)

;; 复制文件路径(支持buffer中和dired中)
(defun copy-file-name (&optional full)
  "Copy file name of current-buffer.
If FULL is t, copy full file name."
  (interactive "P")
  (if (eq major-mode 'dired-mode)
	  (dired-copy-filename-as-kill full)
	(let ((file (file-name-nondirectory (buffer-file-name) )))
	  (if full
		  (setq file (expand-file-name file)))
	  (if (eq full 0)
		  (kill-new (setq file (replace-regexp-in-string "/" "\\\\" file)))
		(kill-new file))
	  (message "File `%s' copied." file))))

;; dired下m-0 w复制全路径，并且把/换成\ ,M-9不转换
(defadvice dired-copy-filename-as-kill(after copy-full-path activate)
  (let ((strmod (current-kill 0)))
	(if (eq last-command 'kill-region)
		()
	  (when arg
		(if (eq arg 0)
			(kill-new (setq strmod (replace-regexp-in-string "/" "\\\\" strmod)))
		  (kill-new (setq strmod (car (dired-get-marked-files))))))
	  (message "%s" strmod))))

(global-set-key (kbd "<M-f3>") 'copy-file-name) ;加上任意的参数就是复制全路径，比如m-0
(global-set-key (kbd "<C-f3>") 'open-in-desktop-select)

;;剪切、复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
	 (list (line-beginning-position)
		   (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
	 (list (line-beginning-position)
		   (line-beginning-position 2)))))

(defun setup-program-keybindings()
  (interactive)
  (local-set-key (kbd "<f12>") 'semantic-ia-fast-jump)
  (local-set-key (kbd "M-`") 'ia-fast-jump-other)
  (local-set-key (kbd "<S-f12>") 'semantic-complete-jump)
  (local-set-key (kbd "<C-f12>") 'semantic-symref-just-symbol)
  (local-set-key (kbd "<M-S-f12>") 'semantic-symref-anything)
  (local-set-key (kbd "<C-S-f12>") 'semantic-symref-tag)
  (local-set-key (kbd "<M-f12>") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "<M-down>") 'senator-next-tag)
  (local-set-key (kbd "<M-up>") 'senator-previous-tag)
  (local-set-key (kbd "<C-f11>") 'semantic-pop-tag-mark)
  )

;;hide ^M
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; symref加强
(eval-after-load "cc-mode"
  '(progn
	 (require 'semantic/symref/list )
	 ))

(defun semantic-symref-find-references-by-symbolname (name &optional scope tool-return)
  ""
  (interactive "sName: ")
  (let* ((inst (semantic-symref-instantiate
				:searchfor name
				:searchtype 'symbolname
				:searchscope (or scope 'project)
				:resulttype 'line))
		 (result (semantic-symref-get-result inst)))
	(when tool-return
	  (set tool-return inst))
	(prog1
		(setq semantic-symref-last-result result)
	  (when (called-interactively-p 'interactive)
		(semantic-symref-data-debug-last-result))))
  )
(defun semantic-symref-tag (&optional text)
  ""
  (interactive "P")
  (semantic-fetch-tags)
  (let (symbol res)
	(setq symbol (semantic-current-tag))
	;; Gather results and tags
	(message "Gathering References for %s ..." (semantic-tag-name symbol))
	(setq res (semantic-symref-find-references-by-name (semantic-tag-name symbol)))
	(semantic-symref-produce-list-on-results res (semantic-tag-name symbol))))

(defun semantic-symref-just-symbol (&optional text)
  ""
  (interactive "*P")
  (semantic-fetch-tags)
  (let (symbol res)
	(setq symbol (thing-at-point 'symbol))
	(if (or text (not symbol))
		(setq symbol (grep-read-regexp)))
	(if (eq text 0)
		(setq symbol (concat "\\<" symbol "\\>")))
	;; Gather results and tags
	(message "Gathering References for %s ..." symbol)
	(setq res (cond
			   ((semantic-symref-find-references-by-name symbol))
			   ((semantic-symref-find-references-by-symbolname symbol))))
	(semantic-symref-produce-list-on-results res symbol)))

(defun semantic-symref-anything (&optional text)
  ""
  (interactive "*P")
  (semantic-fetch-tags)
  (let (symbol res)
	(setq symbol (thing-at-point 'symbol))
	(if (or text (not symbol))
		(setq symbol (grep-read-regexp)))
	(if (eq text 0)
		(setq symbol (concat "\\<" symbol "\\>")))
	;; Gather results and tags
	(message "Gathering References for %s ..." symbol)
	(setq res (semantic-symref-find-text symbol))
	(semantic-symref-produce-list-on-results res symbol)))
;; 自定义的mru
(defvar semantic-tags-location-ring (make-ring 30))

(defun semantic-pop-tag-mark ()             
  "popup the tag save by semantic-goto-definition"   
  (interactive)                                                    
  (if (ring-empty-p semantic-tags-location-ring)                   
	  (message "%s" "No more tags available")                      
	(let* ((marker (ring-remove semantic-tags-location-ring 0))    
		   (buff (marker-buffer marker))                        
		   (pos (marker-position marker)))                   
	  (if (not buff)                                               
		  (message "Buffer has been deleted")                    
		(switch-to-buffer buff)                                    
		(goto-char pos))                                           
	  (set-marker marker nil nil))))

(defadvice semantic-ia-fast-jump (around semantic-ia-fast-jump-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-complete-jump (around semantic-complete-jump-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-symref-just-symbol (around semantic-symref-just-symbol-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-symref-anything (around semantic-symref-anything-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-symref-tag (around semantic-symref-tag-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice helm-gtags-dwim (around helm-gtags-dwim-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice helm-gtags-find-rtag (around helm-gtags-find-rtag-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice helm-gtags-find-tag (around helm-gtags-find-tag-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice helm-gtags-select (around helm-gtags-select-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice helm-gtags-select-path (around helm-gtags-select-path-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-decoration-include-visit (around semantic-decoration-include-visit-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice ag (around ag-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice ag-this-file (around ag-this-file-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice occur (around occur-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice rgrep (around rgrep-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice gtags-find-tag-by-event (around gtags-find-tag-by-event-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-analyze-proto-impl-toggle (around semantic-analyze-proto-impl-toggle-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice semantic-decoration-include-visit (around semantic-decoration-include-visit-mru activate)
  ""
  (ring-insert semantic-tags-location-ring (point-marker))
  ad-do-it)

(defadvice helm-gtags-find-tag-other-window (after helm-gtags-tag-other-back activate)
  ""
  (select-window (previous-window)))

(defun ia-fast-jump-other ()
  (interactive "")
  (let ((pos (point)))
	(save-selected-window
	  (switch-to-buffer-other-window (current-buffer))
	  (goto-char pos)
	  (semantic-ia-fast-jump (point)))
	))

(defun set-c-word-mode ()
  ""
  (interactive)
  (modify-syntax-entry ?_ "w")
  (bm-toggle-cycle-all-buffers))

(global-set-key (kbd "C-_") 'set-c-word-mode)

(defun kill-spec-buffers ()
  ""
  (interactive)
  (dolist (buffer (buffer-list))
    (when (or (eq (buffer-local-value 'major-mode buffer) 'ag-mode)
			  (eq (buffer-local-value 'major-mode buffer) 'semantic-symref-results-mode)
			  (eq (buffer-local-value 'major-mode buffer) 'diff-mode)
			  (eq (buffer-local-value 'major-mode buffer) 'vc-dir-mode)
			  (eq (buffer-local-value 'major-mode buffer) 'vc-svn-log-view-mode)
			  (eq (buffer-local-value 'major-mode buffer) 'ediff-meta-mode)
			  (eq (buffer-local-value 'major-mode buffer) 'occur-mode)
			  (string-match-p "ag dired pattern" (buffer-name buffer))
			  (string-match-p "\*vc\*" (buffer-name buffer))
			  (string-match-p "\*Backtrace\*" (buffer-name buffer))
			  (string-match-p "\*Completions\*" (buffer-name buffer))
			  (string-match-p "\*Help\*" (buffer-name buffer))
			  (string-match-p "\*Customize\*" (buffer-name buffer))
			  (string-match-p "\*Cedet\*" (buffer-name buffer))
			  (string-match-p "\*Annotate\*" (buffer-name buffer))
			  (string-match-p "\*Compile-Log\*" (buffer-name buffer))
			  (string-match-p "\*GTAGS SELECT\*" (buffer-name buffer))
			  (string-match-p "\*Calc\*" (buffer-name buffer))
			  (string-match-p "\*magit" (buffer-name buffer))
			  )
      (kill-buffer buffer))))

(global-set-key (kbd "<C-S-f9>") 'kill-spec-buffers)

;; reuse buffer in DIRED
(defadvice dired-find-file (around dired-find-file-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-file-for-visit)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))
(defadvice dired-up-directory (around dired-up-directory-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer)))
    ad-do-it
    (kill-buffer orig)))

;; 大文件处理
(defun my-find-file-check-make-large-file-read-only-hook ()
  ""
  (when (and (< (* 200 1024) (buffer-size))
			 (or (eq major-mode 'c-mode)
				 (eq major-mode 'c++-mode)))
	(nlinum-mode -1)
	;; (jit-lock-mode nil)
	))
(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;;-----------------------------------------------------------hook-----------------------------------------------------------;;
(c-add-style "gzj"
			 '("stroustrup"
			   (c-basic-offset . 4)		; Guessed value
			   (c-offsets-alist
				(arglist-cont . 0)		; Guessed value
				(arglist-intro . +)		; Guessed value
				(block-close . 0)		; Guessed value
				(case-label . +)		; Guessed value
				(defun-block-intro . +)	; Guessed value
				(defun-close . 0)		; Guessed value
				(defun-open . 0)		; Guessed value
				(else-clause . 0)		; Guessed value
				(extern-lang-close . 0)	; Guessed value
				(func-decl-cont . 0)	; Guessed value
				(inextern-lang . 0)		; Guessed value
				(label . 0)				; Guessed value
				(statement . 0)			; Guessed value
				(statement-block-intro . +) ; Guessed value
				(statement-case-open . 0) ; Guessed value
				(substatement-open . 0)	  ; Guessed value
				(topmost-intro . 0)		  ; Guessed value
				(topmost-intro-cont . 0) ; Guessed value
				(access-label . -)
				(annotation-top-cont . 0)
				(annotation-var-cont . +)
				(arglist-close . c-lineup-close-paren)
				(arglist-cont-nonempty . c-lineup-arglist)
				(block-open . 0)
				(brace-entry-open . 0)
				(brace-list-close . 0)
				(brace-list-entry . 0)
				(brace-list-intro . +)
				(brace-list-open . 0)
				(c . c-lineup-C-comments)
				(catch-clause . 0)
				(class-close . 0)
				(class-open . 0)
				(comment-intro . c-lineup-comment)
				(composition-close . 0)
				(composition-open . 0)
				(cpp-define-intro . 0)
				(cpp-macro . -1000)
				(cpp-macro-cont . +)
				(do-while-closure . 0)
				(extern-lang-open . 0)
				(friend . 0)
				(inclass . +)
				(incomposition . +)
				(inexpr-class . +)
				(inexpr-statement . +)
				(inher-cont . c-lineup-multi-inher)
				(inher-intro . +)
				(inlambda . c-lineup-inexpr-block)
				(inline-close . 0)
				(inline-open . +)
				(inmodule . +)
				(innamespace . +)
				(knr-argdecl . 0)
				(knr-argdecl-intro . +)
				(lambda-intro-cont . +)
				(member-init-cont . c-lineup-multi-inher)
				(member-init-intro . +)
				(module-close . 0)
				(module-open . 0)
				(namespace-close . 0)
				(namespace-open . 0)
				(objc-method-args-cont . c-lineup-ObjC-method-args)
				(objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
				(objc-method-intro .
								   [0])
				(statement-case-intro . +)
				(statement-cont . +)
				(stream-op . c-lineup-streamop)
				(string . -1000)
				(substatement . +)
				(substatement-label . 0)
				(template-args-cont c-lineup-template-args +))))


(add-hook 'c-mode-common-hook
		  (lambda ()
			(modify-syntax-entry ?_ "w")    ;_ 当成单词的一部分
			(c-set-style "gzj")      ;定制C/C++缩进风格,到实际工作环境中要用guess style来添加详细的缩进风格
			(my-c-mode-common-hook-if0)
			;; (fci-mode 1)
			(setup-program-keybindings)
			(hs-minor-mode 1)
			(hide-ifdef-mode 1)
			(setq-local ac-auto-start nil)
			(setq-local indent-tabs-mode nil)
			(irony-mode)
			;; (ggtags-mode 1)
			(eldoc-mode 0)
			(company-mode 1)
			(abbrev-mode 0)
			(flycheck-mode 1)
			(yas-glo-on)
			;; (superword-mode)                ;连字符不分割单词,影响move和edit，但是鼠标双击选择不管用 ，相对subword-mode
			))

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(modify-syntax-entry ?- "w")
			(setup-program-keybindings)
			(flycheck-mode 1)
			(yas-glo-on)
			))

(dolist (hook '(c-mode-common-hook lua-mode-hook objc-mode-hook project-buffer-mode-hook))
  (add-hook hook
			(lambda()
			  (gtags-mode 1)
			  (helm-gtags-mode 1)
			  )))

(add-hook 'dired-mode-hook
		  (lambda ()
			(define-key dired-mode-map "b" 'dired-up-directory)
			(define-key dired-mode-map "e" 'open-in-desktop-select-dired)
			(define-key dired-mode-map (kbd "<C-f3>") 'open-in-desktop-select-dired)
			(define-key dired-mode-map "/" 'isearch-forward)
			(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
			(define-key dired-mode-map "c" 'create-known-ede-project)
			(diff-hl-dired-mode)
			(dired-async-mode 1)
			))

;; shell相关设置
(add-hook 'shell-mode-hook
		  (lambda () "DOCSTRING" (interactive)
			;; (set-buffer-process-coding-system 'utf-8 'utf-8) ;防止shell乱码
			(define-key comint-mode-map (kbd "M-.") 'comint-previous-matching-input-from-input)
			(define-key comint-mode-map (kbd "M-,") 'comint-next-matching-input-from-input)
			(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
			(define-key comint-mode-map (kbd "<down>") 'comint-next-input)
			(yas-glo-on)
			))

(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(remove-hook 'comint-output-filter-functions 'comint-postoutput-scroll-to-bottom)

;; telnet登录主机后，export LANG=zh_CN.GBK 或 export LC_ALL=en_US.ISO-8859-1 ,export LC_CTYPE=zh_CN.GB2312x

;; gtags symref 的结果都设置为C语法，主要为了highlight-symbol能正确
(eval-after-load "cc-mode"
  '(progn
	 (dolist (hook '(gtags-select-mode-hook semantic-symref-results-mode-hook))
	   (add-hook hook
				 (lambda()
				   (setq truncate-lines t)
				   (set-syntax-table c++-mode-syntax-table)
				   (modify-syntax-entry ?_ "w")    ;_ 当成单词的一部分
				   )))))

(add-hook 'font-lock-mode-hook
		  (lambda () "DOCSTRING" (interactive)
			(remove-dos-eol)))

;;-----------------------------------------------------------热键-----------------------------------------------------------;;

;;修改搜索和保存的快捷键
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key isearch-mode-map [f8] 'isearch-repeat-forward)
(define-key isearch-mode-map [f4] 'isearch-repeat-backward)
(define-key isearch-mode-map [S-f8] 'isearch-repeat-backward)
;; isearch下的按键 默认： m-r切换regexp， m-e编辑minibuff ，m-c切换大小写敏感
(define-key isearch-mode-map "\C-v" 'isearch-yank-kill)
(define-key isearch-mode-map "\M-o" 'isearch-occur)
(define-key isearch-mode-map "\M-w" 'isearch-toggle-word)
;; 搜索光标下的单词
(global-set-key (kbd "<f8>") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "<M-f8>") 'highlight-symbol-at-point) ;高亮光标下的单词
(global-set-key (kbd "<C-f8>") 'unhighlight-regexp)        ;删除高亮，c-0全删
(global-set-key (kbd "<M-S-f8>") 'highlight-regexp)

;;使用find递归查找文件
(global-set-key (kbd "<M-f7>") 'find-name-dired) ;找文件名
(global-set-key (kbd "<C-f7>") 'find-grep-dired) ;找文件内容
(global-set-key (kbd "<C-M-f7>") 'kill-find)

;; 窗口管理
(global-set-key (kbd "<M-f9>") 'kill-buffer-and-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-4") 'delete-window)
(global-set-key (kbd "<M-f4>") 'kill-this-buffer)
(global-set-key (kbd "<M-S-down>") 'windmove-down)
(global-set-key (kbd "<M-S-up>") 'windmove-up)
(global-set-key (kbd "<M-S-left>") 'windmove-left)
(global-set-key (kbd "<M-S-right>") 'windmove-right)
(global-set-key (kbd "<C-tab>") 'other-frame)
(global-set-key (kbd "C-S-t") 'make-frame-command)
(global-set-key (kbd "C-)") 'delete-frame)


;; 文件跳转
(global-set-key (kbd "<M-f6>") 'semantic-decoration-include-visit)
(global-set-key (kbd "<C-f6>") 'find-file-at-point) ;ffap
(global-set-key (kbd "M-o") 'ff-find-other-file) ;声明和实现之间跳转

;; rename buffer可用于给shell改名，起多个shell用
(global-set-key (kbd "<M-f2>") 'rename-buffer) ;或者c-u M-x shell

;; 重新加载文件
(global-set-key (kbd "<f1>") 'revert-buffer)

;; 对齐
(global-set-key (kbd "C-`") 'align)

;; shell
(global-set-key (kbd "<f10>") 'shell)

;; 行号栏选择行
(global-set-key (kbd "<left-margin> <down-mouse-1>") 'mouse-drag-region)
(global-set-key (kbd "<left-margin> <mouse-1>") 'mouse-set-point)
(global-set-key (kbd "<left-margin> <drag-mouse-1>") 'mouse-set-region)
(global-set-key (kbd "<left-fringe> <down-mouse-1>") 'mouse-drag-region)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'mouse-set-point)
(global-set-key (kbd "<left-fringe> <drag-mouse-1>") 'mouse-set-region)
(global-set-key (kbd "<left-margin> <wheel-down>") 'mwheel-scroll)
(global-set-key (kbd "<left-margin> <wheel-up>") 'mwheel-scroll)

;; icomplete
(eval-after-load "icomplete"
  '(progn
	 (define-key icomplete-minibuffer-map (kbd "<return>") 'minibuffer-force-complete-and-exit)))
;; set-mark
(global-set-key (kbd "C-,") 'cua-set-mark)
;; whitespace
(global-set-key (kbd "C-=") 'whitespace-mode)
(global-set-key (kbd "C-+") 'whitespace-cleanup-region)
;; hide/show
(global-set-key (kbd "M-[") 'hs-toggle-hiding)
;; rgrep
(global-set-key (kbd "<C-f5>") 'rgrep)
(global-set-key (kbd "<C-S-f5>") 'lgrep)
;; diff
(global-set-key (kbd "C-;") 'ediff-buffers)
;; vc-dir
(eval-after-load "vc-dir"
  '(progn
	 (define-key vc-dir-mode-map (kbd "r") 'vc-revert)
	 (define-key vc-dir-mode-map (kbd "d") 'vc-diff)))
;; server-start
(global-set-key (kbd "<C-lwindow>") 'server-start)
