((nil .
	  ((eval . (progn
				 (setq ac-clang-cflags nil)
				 (setq variables-file (dir-locals-find-file
									   (or (buffer-file-name) default-directory)))
				 (cond
				  ((stringp variables-file)
				   (setq dir-name (file-name-directory variables-file)
						 ))
				  ((consp variables-file)
				   (setq dir-name (nth 0 variables-file))
				   ))
				 (add-to-list 'ac-clang-cflags "-Weverything" t)
				 (add-to-list 'ac-clang-cflags "-Wno-cast-qual" t)
				 (add-to-list 'ac-clang-cflags "-Wno-missing-field-initializers" t)
				 (add-to-list 'ac-clang-cflags "-Wno-gnu-zero-variadic-macro-arguments" t)
				 (add-to-list 'ac-clang-cflags "-ferror-limit=0" t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name) t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "Include") t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "Server") t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "UPF") t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "UPF_Dubhe/Export") t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "Service/TG/MM/RM/Source/PMM") t)
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "SUPF_SMI/Include") t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/atlmfc/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files (x86)/Windows Kits/8.1/Include/um" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files (x86)/Windows Kits/8.1/Include/shared" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files (x86)/Windows Kits/8.1/Include/winrt" t)
				 (add-to-list 'ac-clang-cflags "-IC:/MinGW/include" t)
				 (add-to-list 'ac-clang-cflags "-Ic:/MinGW/lib/gcc/mingw32/4.8.1/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/MinGW/lib/gcc/mingw32/4.8.1/include/c++" t)
				 (add-to-list 'ac-clang-cflags "-IC:/cygwin/usr/include" t)
				 (add-to-list 'ac-clang-cflags "-ID:/linux/linux-3.18.3/include/uapi" t)
				 (add-to-list 'ac-clang-cflags "-ID:/linux/linux-3.18.3/include/linux" t)
				 (add-to-list 'ac-clang-cflags (concat "-include" dir-name "Service/TG/MM/RM/Include/StdAfx.h") t)
				 (add-to-list 'ac-clang-cflags "-DWIN32" t)
				 (add-to-list 'ac-clang-cflags "-D_DEBUG" t)
				 (add-to-list 'ac-clang-cflags "-D_WINDOWS" t)
				 (add-to-list 'ac-clang-cflags "-D_USRDLL" t)
				 (add-to-list 'ac-clang-cflags "-DRM_EXPORTS" t)
				 (add-to-list 'ac-clang-cflags "-DDEBUG_WITH_ASSERT" t)
				 (add-to-list 'ac-clang-cflags "-DUPF_OS_IS_WINNT" t)
				 (add-to-list 'ac-clang-cflags "-D_VC80_UPGRADE=0x0600" t)
				 (add-to-list 'ac-clang-cflags "-D_WINDLL" t)
				 (add-to-list 'ac-clang-cflags "-D_MBCS" t)
				 (add-to-list 'ac-clang-cflags "-DNULL=0" t)
				 )))))




((nil . ((company-clang-arguments . ("-std=c++11"
									 "-Ie:/projects/eNavi2_800X480_ChangeUI/"
									"-Ie:/projects/eNavi2_800X480_ChangeUI/include/"
									"-Ie:/projects/eNavi2_800X480_ChangeUI/server/"
									"-Ie:/projects/eNavi2_800X480_ChangeUI/upf/"
									"-Ie:/projects/eNavi2_800X480_ChangeUI/upf_dubhe/export/"
									"-Ie:/projects/eNavi2_800X480_ChangeUI/UPF_SMI/Include/"
									"-include/Service/TG/MM/RM/Include/StdAfx.h"
									))
		 (flycheck-clang-include-path . ("e:/projects/eNavi2_800X480_ChangeUI/"
										"e:/projects/eNavi2_800X480_ChangeUI/include/"
										"e:/projects/eNavi2_800X480_ChangeUI/server/"
										"e:/projects/eNavi2_800X480_ChangeUI/upf/"
										"e:/projects/eNavi2_800X480_ChangeUI/upf_dubhe/export/"
										"e:/projects/eNavi2_800X480_ChangeUI/UPF_SMI/Include/"
										))
		 )))


