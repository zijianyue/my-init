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
				 (add-to-list 'ac-clang-cflags (concat "-I" dir-name "COMMON/include") t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files/Microsoft Visual Studio 8/VC/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files/Microsoft Visual Studio 8/VC/PlatformSDK/Include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files/Microsoft Visual Studio 8/VC/atlmfc/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/Program Files/Microsoft Visual Studio 8/SDK/v2.0/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/MinGW/include" t)
				 (add-to-list 'ac-clang-cflags "-Ic:/MinGW/lib/gcc/mingw32/4.8.1/include" t)
				 (add-to-list 'ac-clang-cflags "-IC:/MinGW/lib/gcc/mingw32/4.8.1/include/c++" t)
				 (add-to-list 'ac-clang-cflags "-IC:/cygwin/usr/include" t)
				 (add-to-list 'ac-clang-cflags "-ID:/linux/linux-3.18.3/include/uapi" t)
				 (add-to-list 'ac-clang-cflags "-ID:/linux/linux-3.18.3/include/linux" t)
				 (add-to-list 'ac-clang-cflags (concat "-include" dir-name "dir/include.h") t)
				 (add-to-list 'ac-clang-cflags "-DVOS_BYTE_ORDER=VOS_LITTLE_ENDIAN" t)
				 (add-to-list 'ac-clang-cflags "-DVOS_OS_VER=VOS_LINUX" t)
				 (add-to-list 'ac-clang-cflags "-DVOS_HARDWARE_PLATFORM=0" t)
				 (add-to-list 'ac-clang-cflags "-DVOS_CPU_TYPE=14" t)
				 (add-to-list 'ac-clang-cflags "-DVRP_VERSION_DEBUG=VOS_YES" t)
				 (add-to-list 'ac-clang-cflags "-DLDPM_BBIT_STUB" t)
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


