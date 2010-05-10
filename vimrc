" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set sw=4

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  autocmd FileType python set complete+=k~/.vim/pydiction-0.5/pydiction isk+=.,(

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Set personal syntax preferences "
set nu
set softtabstop=4
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Checking python syntax "
command Pylint :call Pylint()
function Pylint()
	setlocal makeprg=(echo\ '[%]';\ pylint\ %)
	setlocal efm=%+P[%f],%t:\ %#%l:%m
	silent make
        cwindow
endfunction
"autocmd BufWrite *.{py} :call Pylint()"
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%79v.*/

map <silent> <S-r> :w<CR>:call Pylint() <CR>
map <silent> <C-n> <Esc>:tabn<CR>
map <silent> <C-p> <Esc>:tabp<CR>
let NERDTreeIgnore=['\.pyc$']
set expandtab
set tabstop=4
set shiftwidth=4
:colorscheme zenburn
