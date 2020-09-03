# vimcfg
My personal vim config files.

#### libclang.so missing error:
Error Message:
	raise self.error_wrapper(err)^@pynvim.api.common.NvimError:
	"deoplete#sources#clang#debug"^@Error when loading source clang:
	"deoplete#sources#clang#debug". Ignoring.
Solution:
	https://github.com/deoplete-plugins/deoplete-clang/issues/59
	ln -s /usr/lib/x86_64-linux-gnu/libclang-6.0.so.1 /usr/lib/libclang.so
	ln -s /usr/lib/clang/6.0.0/include /usr/lib/clang_include
