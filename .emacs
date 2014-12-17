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
;;-----------------------------------------------------------设置-----------------------------------------------------------;;
;; 只有一个实例
(server-force-delete)
(server-start)

;; 环境变量
(setenv "MSYS" "C:\\MinGW\\msys\\1.0\\bin")
(setenv "MINGW" "C:\\MinGW\\bin")
(setenv "PUTTY" "C:\\PuTTY")
(setenv "LLVM" "C:\\Program Files (x86)\\LLVM\\bin")
(setenv "CMAKE" "C:\\Program Files (x86)\\CMake\\bin")
(setenv "GTAGSBIN" "c:\\gtags\\bin")
(setenv "PYTHON" "C:\\Python27")

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
		 (getenv "PATH")))

(add-to-list 'exec-path (getenv "MINGW"))
(add-to-list 'exec-path (getenv "MSYS"))
(add-to-list 'exec-path (getenv "LLVM"))
(add-to-list 'exec-path (getenv "CMAKE"))
(add-to-list 'exec-path (getenv "GTAGSBIN"))
(add-to-list 'exec-path (getenv "PYTHON"))

(defvar site-lisp-dir)
(if (eq emacs-minor-version 3)
	(setq site-lisp-dir (concat (getenv "emacs_dir") "\\site-lisp"))
  (setq site-lisp-dir (concat (getenv "emacs_dir") "\\share\\emacs\\site-lisp")))

;; windows的find跟gnu 的grep有冲突
(setq find-program "\"C:/mingw/msys/1.0/bin/find.exe\"")

;; 默认目录
(setq default-directory "~")
;; elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("melpa" . "http://melpa.milkbox.net/packages/")
						 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
;; mini buffer 的大小保持不变
(setq resize-mini-windows nil)
;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;; Load CEDET offical
(load-file "D:/cedet-master/cedet-devel-load.el")
(load-file "D:/cedet-master/contrib/cedet-contrib-load.el")

;; cedet builtin
;; (require 'semantic )
;; (require 'srecode)

(set-default 'semantic-case-fold t)
(global-set-key (kbd "<C-apps>") 'eassist-list-methods)

;;修改标题栏，显示buffer的名字
(setq frame-title-format "%b [%+] %f")

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;; 向前跳到单词开始
(require 'misc )
(fset 'forward-word 'forward-to-word)

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


;; 自动添加的设置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-disable-faces nil)
 '(ac-ignore-case t)
 '(ac-use-menu-map t)
 '(auto-save-default nil)
 '(back-button-mode-lighter "")
 '(backward-delete-char-untabify-method nil)
 '(bookmark-save-flag 1)
 '(bookmark-sort-flag nil)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(compilation-skip-threshold 2)
 '(cua-mode t nil (cua-base))
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(display-time-mode nil)
 '(electric-indent-mode t)
 '(electric-pair-inhibit-predicate (quote electric-pair-conservative-inhibit))
 '(electric-pair-mode t)
 '(eww-search-prefix "http://cn.bing.com/search?q=")
 '(explicit-shell-file-name "bash")
 '(fa-insert-method (quote name-and-parens-and-hint))
 '(fci-eol-char 32)
 '(frame-resize-pixelwise t)
 '(global-auto-revert-mode t)
 '(global-cedet-m3-minor-mode t)
 '(global-ede-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(global-semantic-decoration-mode t)
 '(global-semantic-mru-bookmark-mode t)
 '(global-semantic-stickyfunc-mode t)
 '(global-srecode-minor-mode t)
 '(gtags-disable-pushy-mouse-mapping t)
 '(helm-default-external-file-browser "explorer")
 '(helm-gtags-auto-update t)
 '(helm-gtags-cache-max-result-size 104857600)
 '(helm-gtags-cache-select-result t)
 '(helm-gtags-display-style (quote detail))
 '(helm-gtags-ignore-case t)
 '(helm-gtags-maximum-candidates 200)
 '(helm-gtags-suggested-key-mapping t)
 '(helm-gtags-update-interval-second nil)
 '(horizontal-scroll-bar-mode t)
 '(ido-mode (quote both) nil (ido))
 '(imenu-max-item-length 120)
 '(imenu-max-items 1000)
 '(inhibit-startup-screen t)
 '(jit-lock-defer-time 0.25)
 '(large-file-warning-threshold 50000000)
 '(ls-lisp-verbosity nil)
 '(make-backup-files nil)
 '(mode-require-final-newline nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(password-cache-expiry nil)
 '(pcmpl-gnu-tarfile-regexp "")
 '(recentf-mode t)
 '(save-place t nil (saveplace))
 '(semantic-c-dependency-system-include-path
   (quote
	("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include" "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/PlatformSDK/Include" "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/atlmfc/include" "C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/include")))
 '(semantic-idle-work-parse-neighboring-files-flag t)
 '(semantic-idle-work-update-headers-flag t)
 '(semantic-imenu-bucketize-file nil)
 '(semantic-imenu-summary-function (quote semantic-format-tag-abbreviate))
 '(semantic-lex-spp-use-headers-flag t)
 '(semantic-mode t)
 '(semantic-symref-results-summary-function (quote semantic-format-tag-abbreviate))
 '(shell-completion-execonly nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(sln-mode-devenv-2008 "Devenv.com")
 '(tab-width 4)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(user-full-name "gezijian g00280886"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-lisp-show-completion ((t (:background "navajo white"))))
 '(helm-selection-line ((t (:background "light steel blue" :underline t)))))
;;-----------------------------------------------------------插件-----------------------------------------------------------;;
;; gtags / GLOBAL
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'gtags-select-mode-hook
		  '(lambda ()
			 (setq hl-line-face 'underline)
			 (hl-line-mode 1)
			 ))

;; (setenv "GTAGSLABEL" "ctags") ;用m-: 执行一下这句话就变成ctags作为backend

(eval-after-load "gtags"
  '(progn
	 (define-key gtags-mode-map [S-down-mouse-1] 'ignore)
	 (define-key gtags-mode-map [S-down-mouse-3] 'ignore)
	 (define-key gtags-mode-map (kbd "<S-mouse-1>") 'gtags-find-tag-by-event)
	 (define-key gtags-mode-map (kbd "<S-mouse-3>") 'gtags-pop-stack)
	 (define-key gtags-mode-map (concat gtags-prefix-key "I") 'gtags-find-with-idutils)
	 (define-key gtags-select-mode-map [S-down-mouse-1] 'ignore)
	 (define-key gtags-select-mode-map [S-down-mouse-3] 'ignore)
	 (define-key gtags-select-mode-map (kbd "<S-mouse-1>") 'gtags-select-tag-by-event)
	 (define-key gtags-select-mode-map (kbd "<S-mouse-3>") 'gtags-pop-stack)
	 (define-key gtags-select-mode-map "q" 'gtags-pop-stack)
	 ))


;; 选中单位
(require 'expand-region)
(global-set-key (kbd "M-s") 'er/expand-region)

;; undo redo
(require 'redo+)
(setq undo-no-redo t)
(global-set-key (kbd "C-/") 'redo)

;; stl(解析vector map等)
(setq stl-base-dir "c:/Program Files (x86)/Microsoft Visual Studio 8/VC/include")
(add-to-list 'auto-mode-alist (cons stl-base-dir 'c++-mode))

;; 工程设置
(defun create-proj(&optional select)
  (interactive "P")
  (if select
	  (setq root-file (read-file-name "Open a root file in proj: "))
	(setq root-file "./GTAGS"))
  (setq proj (ede-cpp-root-project "code" :file root-file
								   :include-path '( "/include" "/server" "/upf"
													"/upf_dubhe/export" "/UPF_SMI/Include" "/service/tg/mm/rm/source/pmm")
								   :spp-files '( "Service/TG/MM/RM/Source/PMM/RMPmm_Const.h"
												 "Service/TG/MM/RM/Include/RM_switch.h"
												 "Service/TG/MM/RM/Include/RM_Debug.h"
												 "ede_switch.h" ;目前ON OFF宏如果是(1)，无法识别，所以把这个放最后强制将ON定义为1
												 )))
  ;; (find-sln root-file)
  ;; (cscope-set-initial-directory (file-name-directory root-file))
  (message "EDE Project Created." ))
(global-set-key (kbd "C-c e") 'create-proj)

;;auto-complete
(require 'auto-complete-config)
(require 'auto-complete-c-headers )

(define-key ac-mode-map  (kbd "M-RET") 'auto-complete)
(define-key ac-completing-map  (kbd "/") 'ac-isearch)

(add-to-list 'ac-dictionary-directories (concat site-lisp-dir "\\auto-complete\\auto-complete-master\\dict"))
(ac-config-default)
(setq ac-modes (append '(objc-mode) ac-modes))

(setq-default ac-sources '(ac-source-dictionary ac-source-words-in-buffer))
(defadvice ac-cc-mode-setup(after my-ac-setup activate)
  ;; (setq ac-sources (delete 'ac-source-gtags ac-sources))
  (setq ac-sources (append '(ac-source-semantic) ac-sources)) ;autocomplete使用semantic补全. ->
  ;; (setq ac-sources (append '(ac-source-clang-async) ac-sources))
  ;; (setq ac-sources (append '(ac-source-clang) ac-sources))
  (setq ac-sources (append '(ac-source-c-headers) ac-sources))
  )

;; company
;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)

;;yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs (concat site-lisp-dir "\\yasnippet-master\\snippets"))
(yas-global-mode 1)

;; sln解析
(autoload 'find-sln "sln-mode" nil t)
(eval-after-load "project-buffer-mode"
  '(progn
	 (require 'project-buffer-mode+)
	 (project-buffer-mode-p-setup)
	 (require 'project-buffer-occur)
	 (define-key project-buffer-mode-map [?r] 'project-buffer-occur);; 要想全局搜索需要加C-u
	 (define-key project-buffer-mode-map [?m] 'project-buffer-occur-case-sensitive)
	 (define-key global-map (kbd "<M-f6>") 'project-buffer-mode-p-go-to-attached-project-buffer)
	 (define-key global-map (kbd "<C-f6>") 'project-buffer-mode-p-run-project-buffer-build-action)))

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
(require 'zjl-c-hl-aggressive )

;; 显示列竖线
(autoload 'fci-mode "fill-column-indicator" "" t)
(setq fci-rule-column 120)
;; 避免破坏 auto complete
(eval-after-load "fill-column-indicator"
  '(progn
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
	 ))
;; 符号高亮
(require 'highlight-symbol)
(global-set-key [f8] 'highlight-symbol-next)
(global-set-key [(shift f8)] 'highlight-symbol-prev)
(require 'highlight )
(global-set-key (kbd "<M-f8>") 'hlt-highlight-symbol) ;m-0会把所有buffer都高亮上
(global-set-key (kbd "<C-f8>") 'hlt-unhighlight-symbol)
;; (global-set-key (kbd "<f8>") 'hlt-next-highlight)
;; (global-set-key (kbd "<S-f8>") 'hlt-previous-highlight)
(global-set-key (kbd "<C-S-f8>") 'hlt-unhighlight-region)

;; 异步copy rename文件
(when (require 'dired-aux)
  (require 'dired-async))

;; helm系列
(require 'helm-config)
(require 'helm-gtags)

(eval-after-load "helm"
  '(progn
	 (global-set-key (kbd "C-x f") 'helm-command-prefix)
	 (global-unset-key (kbd "C-x c"))
	 (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
	 (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
	 (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
	 ))

(global-set-key (kbd "C-S-v") 'helm-show-kill-ring)
(global-set-key (kbd "<M-apps>") 'helm-semantic-or-imenu)

(eval-after-load "helm-gtags"
  '(progn
	 (define-key helm-gtags-mode-map (kbd "<S-f5>") 'helm-gtags-create-tags)
	 (define-key helm-gtags-mode-map (kbd "<f5>") 'helm-gtags-update-tags)
	 (define-key helm-gtags-mode-map (kbd "<f7>") 'helm-gtags-select)
	 (define-key helm-gtags-mode-map (kbd "<f6>") 'helm-gtags-select-path)
	 (define-key helm-gtags-mode-map (kbd "C-]") nil)
	 (define-key helm-gtags-mode-map (kbd "C-t") nil)
	 (define-key helm-gtags-mode-map (kbd "C-\\") 'helm-gtags-dwim)
	 (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-previous-history)
	 (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-next-history)
	 ))

;; ac-helm
(autoload 'ac-complete-with-helm "ac-helm" "" t)
(global-set-key (kbd "M-I") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "M-I") 'ac-complete-with-helm)

;; back button
(require 'back-button)
(back-button-mode 1)

;; irony-mode
(require 'irony-cdb )
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(setq w32-pipe-read-delay 0)

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

;; func args
(autoload 'function-args-mode "function-args" "" t)
(eval-after-load "function-args"
  '(progn
	 (let ((map function-args-mode-map))
	   (define-key function-args-mode-map (kbd "<C-tab>") 'moo-complete)
	   (define-key function-args-mode-map (kbd "M-o") nil)
	   (define-key function-args-mode-map (kbd "M-i") nil)
	   (define-key function-args-mode-map (kbd "M-n") nil)
	   (define-key function-args-mode-map (kbd "M-h") nil)
	   (define-key function-args-mode-map (kbd "M-u") nil)
	   (define-key function-args-mode-map (kbd "M-j") 'fa-jump-maybe)
	   (define-key function-args-mode-map (kbd "<apps>") 'moo-jump-local)
	   (define-key function-args-mode-map (kbd "M-N") 'fa-idx-cycle-down)
	   (define-key function-args-mode-map (kbd "M-P") 'fa-idx-cycle-up)
	   (define-key function-args-mode-map (kbd "M-[") 'fa-show)
	   (define-key function-args-mode-map (kbd "M-]") 'fa-abort)
	   )
	 ))
;;-----------------------------------------------------------自定义函数-----------------------------------------------------------;;
;; 资源管理器中打开
(defun open-in-desktop-select (&optional dired)
  (interactive "*P")
  (let ((file (buffer-name)))
	(if dired
		(setq file (dired-get-filename 'no-dir)) ;xp
	  ;; (setq file (replace-regexp-in-string "/" "\\\\" (dired-get-filename) )) ;win7
	  ;; (setq file (file-name-nondirectory (buffer-file-name) )) ;xp
	  (setq file (replace-regexp-in-string "/" "\\\\" (buffer-file-name) ))) ;win7
	(call-process "explorer" nil 0 nil (concat "/select," file))
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
		  (t (self-insert-command (or arg 1))))))

;; 选中括号间的内容
(defun select-match ()
  "select between match paren"
  (interactive)
  (cua-set-mark)
  (his-match-paren 1))

(global-set-key "%" 'his-match-paren)
(global-set-key (kbd "C-%") 'select-match)

;; 复制文件路径
(defun copy-file-name (&optional full)
  "Copy file name of current-buffer.
If FULL is t, copy full file name."
  (interactive "*P")
  (let ((file (file-name-nondirectory (buffer-file-name) )))
	(if full
		(setq file (expand-file-name file)))
	(kill-new (setq file (replace-regexp-in-string "/" "\\\\" file)))
	(message "File `%s' copied." file)))

;; dired下m-0 w复制全路径，并且把/换成\
(defadvice dired-copy-filename-as-kill(after copy-full-path activate)
  (let ((strmod (current-kill 0)))
	(if (eq last-command 'kill-region)
		()
	  (kill-new (setq strmod (replace-regexp-in-string "/" "\\\\" strmod)))
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
  (local-set-key (kbd "<S-f12>") 'semantic-complete-jump)
  (local-set-key (kbd "<C-f12>") 'semantic-symref-just-symbol)
  (local-set-key (kbd "<M-S-f12>") 'semantic-symref-anything)
  (local-set-key (kbd "<C-S-f12>") 'semantic-symref-tag)
  (local-set-key (kbd "<M-f12>") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "<M-down>") 'senator-next-tag)
  (local-set-key (kbd "<M-up>") 'senator-previous-tag)
  )

;;hide ^M
(defun hide-dos-eol (args)
  (interactive "P")
  (call-interactively 'hlt-highlight-regexp-region)
  (call-interactively 'hlt-hide-default-face)
  )

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; symref加强
(require 'semantic/symref/list )

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
  (interactive "*P")
  (semantic-fetch-tags)
  (let (symbol prompt input res)
	(setq symbol (semantic-current-tag))
	(if (or text (not symbol))
		(progn
		  (setq prompt (concat "Find References For: (default " symbol ") "))
		  (setq input (completing-read prompt 'gtags-completing-gtags
									   nil nil nil gtags-history-list))
		  (if (not (equal "" input))
			  (setq symbol input))))
	;; Gather results and tags
	(message "Gathering References...")
	(setq res (semantic-symref-find-references-by-name (semantic-tag-name symbol)))
	(semantic-symref-produce-list-on-results res (semantic-tag-name symbol))))

(defun semantic-symref-just-symbol (&optional text)
  ""
  (interactive "*P")
  (semantic-fetch-tags)
  (let (symbol prompt input res)
	(setq symbol (thing-at-point 'symbol))
	(if (or text (not symbol))
		(progn
		  (setq prompt (concat "Find References For: (default " symbol ") "))
		  (setq input (completing-read prompt 'gtags-completing-gtags
									   nil nil nil gtags-history-list))
		  (if (not (equal "" input))
			  (setq symbol input))))
	;; Gather results and tags
	(message "Gathering References...")
	(setq res (cond
			   ((semantic-symref-find-references-by-name symbol))
			   ((semantic-symref-find-references-by-symbolname symbol))))
	(semantic-symref-produce-list-on-results res symbol)))

(defun semantic-symref-anything (&optional text)
  ""
  (interactive "*P")
  (semantic-fetch-tags)
  (let (symbol prompt input res)
	(setq symbol (concat "\\<" (thing-at-point 'symbol) "\\>"))
	(if (or text (equal "\\<\\>" symbol))
		(progn
		  (setq prompt (concat "Find References For: (default " symbol ") "))
		  (setq input (completing-read prompt 'gtags-completing-gtags
									   nil nil nil gtags-history-list))
		  (if (not (equal "" input))
			  (setq symbol input))))
	;; Gather results and tags
	(message "Gathering References...")
	(setq res (semantic-symref-find-text symbol))
	(semantic-symref-produce-list-on-results res symbol)))

;; builtin cedet mru bookmark 加强
(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
					  (point)
					  'mark)
  ad-do-it)
(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
		 (alist (semantic-mrub-ring-to-assoc-list ring))
		 (first (cdr (car alist))))
	(if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
		(setq first (cdr (car (cdr alist)))))
	(semantic-mrub-switch-tags first)))

(global-set-key (kbd "<C-f11>") 'semantic-ia-fast-jump-back)
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
			(abbrev-mode 0)
			(my-c-mode-common-hook-if0)
			(fci-mode 1)
			(setup-program-keybindings)
			(hs-minor-mode 1)
			(hide-ifdef-mode 1)
			;; (highlight-symbol-mode)
			(setq-local ac-auto-start nil)
			(setq indent-tabs-mode nil)
			(function-args-mode 1)
			(irony-mode)
			;; (superword-mode)                ;连字符不分割单词,影响move和edit    相对subword-mode
			))

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(modify-syntax-entry ?- "w")
			(setup-program-keybindings)
			))

(dolist (hook '(c-mode-common-hook lua-mode-hook objc-mode-hook fsvn-browse-mode-hook project-buffer-mode-hook dired-mode-hook))
  (add-hook hook
			(lambda()
			  (gtags-mode 1)
			  (helm-gtags-mode 1)
			  )))

(add-hook 'dired-mode-hook
		  (lambda ()
			(define-key dired-mode-map "b" 'dired-up-directory)
			(define-key dired-mode-map "e" 'open-in-desktop-select-dired)
			(define-key dired-mode-map "/" 'isearch-forward)
			))

(add-hook 'shell-mode-hook
		  (lambda () "DOCSTRING" (interactive)
			;; (set-buffer-process-coding-system 'utf-8 'utf-8) ;防止shell乱码
			(define-key comint-mode-map (kbd "M-.") 'comint-previous-matching-input-from-input)
			(define-key comint-mode-map (kbd "M-,") 'comint-next-matching-input-from-input)
			(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
			(define-key comint-mode-map (kbd "<down>") 'comint-next-input)
			))

(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
;; (remove-hook 'comint-output-filter-functions 'comint-postoutput-scroll-to-bottom)

;; telnet登录主机后，export LANG=zh_CN.GBK 或 export LC_ALL=en_US.ISO-8859-1 ,export LC_CTYPE=zh_CN.GB2312x

;; gtags symref 的结果都设置为C语法，主要为了highlight-symbol能正确
(dolist (hook '(gtags-select-mode-hook helm-update-hook semantic-symref-results-mode-hook cscope-list-entry-hook))
  (add-hook hook
			(lambda()
			  (setq truncate-lines t)
			  (set-syntax-table c++-mode-syntax-table))))

(add-hook 'eassist-mode-hook
		  (lambda () "DOCSTRING" (interactive)
			(define-key eassist-mode-map (kbd "<apps>") 'eassist-escape)
			))

(add-hook 'after-change-major-mode-hook 'remove-dos-eol)

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
;; (require 'hi-lock )
;; (global-set-key (kbd "<f8>") 'isearch-forward-symbol-at-point)
;; (global-set-key (kbd "<M-f8>") 'highlight-symbol-at-point) ;高亮光标下的单词
;; (global-set-key (kbd "<C-f8>") 'unhighlight-regexp)        ;删除高亮，c-0全删

;;使用find递归查找文件
(global-set-key (kbd "<M-f7>") 'find-name-dired) ;找文件名
(global-set-key (kbd "<C-f7>") 'find-grep-dired) ;找文件内容
(global-set-key (kbd "<C-M-f7>") 'kill-find)

;; 窗口管理
(global-set-key (kbd "<f9>") 'other-window)
(global-set-key (kbd "<M-f9>") 'delete-window)
(global-set-key (kbd "<M-f4>") 'kill-this-buffer)
(global-set-key (kbd "<M-S-down>") 'windmove-down)
(global-set-key (kbd "<M-S-up>") 'windmove-up)
(global-set-key (kbd "<M-S-left>") 'windmove-left)
(global-set-key (kbd "<M-S-right>") 'windmove-right)

;; 文件跳转
(global-set-key (kbd "C-=") 'find-file-at-point) ;ffap
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
