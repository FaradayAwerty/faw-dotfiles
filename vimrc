
call plug#begin('~/.vim/plugged')
	Plug 'christoomey/vim-system-copy'
	Plug 'mkitt/tabline.vim'
call plug#end()

syntax on
set background=dark
set path+=**
set showtabline=1
set foldignore=
set laststatus=1
set tabstop=5
set shiftwidth=5
set smarttab
set autoindent
set number
set norelativenumber
set noswapfile 
set hlsearch
set incsearch
set linebreak
set foldmethod=indent
set nofoldenable
set nocursorline
set noexpandtab
set nopaste
set ttimeout
set ttimeoutlen=10
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set listchars=tab:>-,space:.,eol:~
set completeopt-=preview

highlight TabLine ctermbg=none ctermfg=none cterm=none
highlight TabLineFill ctermfg=white ctermbg=none cterm=none
highlight TabLineSel ctermfg=black ctermbg=blue cterm=none

noremap ,S :set spell! spelllang=en,ru<CR>
noremap ,w :set list!<cr>
noremap ,p :set paste!<cr>
noremap ,c :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

let g:system_copy_silent = 0

if executable('xclip')
	let g:system_copy#copy_command='xclip -sel clipboard'
	let g:system_copy#paste_command='xclip -sel clipboard -o'
endif

if has("win32") || has("win16")
	let g:system_copy#copy_command='clip'
	let g:system_copy#paste_command='paste'
endif

" return to the same line you left off at
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	execute 'normal! g`"zvzz' |
		\ endif
augroup END
