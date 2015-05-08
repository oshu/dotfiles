syntax on
colorscheme blue
set number
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab  " Tab setup for Makefiles
set shiftwidth=4 " 1 tab == 8 spaces
else
set expandtab    " Use spaces instead of tabs
set shiftwidth=2 " 1 tab == 4 spaces
set tabstop=2
endif

" Be smart when using tabs ;)
set smarttab

set ai "Auto indent
set si "Smart indent

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
