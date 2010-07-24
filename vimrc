""   vimrc

"" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"" Use Vim settings, rather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible 

"" Tabs 
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set sta

"" Indenting
set ai
set si

"" Scrollbars
set sidescrolloff=2
set numberwidth=4

"" Windows
set equalalways
set splitbelow splitright
set nu

"" Highlights
set cursorline                      " Highlights cursor row.
"" set cursorcolumn                    " Highlights cursor column.

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%79v.*/

"" Cursor


"" Searching
"set ignorecase                     " Ignore case when searching.
set hlsearch                        " Highlight Search.
set incsearch                       " Incremental Search (Search as you type).
set smartcase                       " Ignore case when searching lowercase.

"" Colors
set t_Co=256                        " 256 Colors.
set background=dark                 " Set dark background.
syntax on                           " Turn syntax highlighting on.
colorscheme zenburn                 " Set colorscheme to zenburn.

"" Status Line
"set ch=2                           " Make command line two lines high.
set showcmd                         " 
set ruler                           " Display ruler.
set history=50                      " Keep 50 lines of comand line history.

"" Mouse
set mouse=a                         " Enable mouse
behave xterm
set selectmode=mouse

"" Autocommand
if has("autocmd")

    filetype plugin indent on       " Enable filetype detection; autoload lang-dep indenting.
    augroup vimrcEx                 " Put in an autocmd group, so we can delete them easily.
    au!

"    autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"    autocmd FileType python :set omnifunc=python complete#Complete
"    autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
"    autocmd FileType css :set omnifunc=csscomplete#CompleteCSS
"    autocmd FileType c :set omnifunc=ccomplete#Complete


    " For all text files set textwidth to 78 characters.
    autocmd FileType text setlocal textwidth=78 

    " Pydiction
    autocmd FileType python set complete+=k~/.vim/pydiction-0.5/pydiction isk+=.,(

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event
    " handler.
    " (happens when dropping a file on gvim).
    "autocmd BufWrite *.{py} :call Pylint()"
    autocmd FileType html :set filetype=xhtml "This is better.
    autocmd BufEnter * lcd %:p:h        " Sets path to directory buffer was loaded from.
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
    augroup END

else
    set autoindent                  " Always set autoindenting on.
endif                               " has("autocmd").

" Line Wrapping
set nowrap
set linebreak

"" Directories
set backupdir=~/.vimbackup          " Set backup location.
set backup                          " Enable backups.

set directory=~/.vimbackup/swap     " Set swap directory.

"auto

"" Misc.
set sw=4
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode.

"" Diff of current buffer vs original file.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

"" Checking python syntax "
command Pylint :call Pylint()
function Pylint()
	setlocal makeprg=(echo\ '[%]';\ pylint\ %)
	setlocal efm=%+P[%f],%t:\ %#%l:%m
	silent make
        cwindow
endfunction


"" Mappings
map <buffer> <S-r> :w<CR>:!/use/bin/env python % <CR> " Run Python file.
map <silent> <S-t> :w<CR>:call Pylint() <CR>
map <silent> <C-n> <Esc>:tabn<CR>
map <silent> <C-p> <Esc>:tabp<CR>
map <silent> <C-z> <Esc>:undo<CR>
map <silent> <C-y> <Esc>:redo<CR>
map <S-Enter> O<ESC>
map <Enter> o<ESC>
map jj <Esc>
nnoremap <F2> :set nonu<CR>:set foldcolumn=0<CR>
map Q gq                            " Don't use Ex mode, use Q for formatting.


let NERDTreeIgnore=['\.pyc$','\.svn$','\.git$']

"====[EOF]===="

