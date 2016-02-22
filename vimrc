set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'python-rope/ropevim'
Plugin 'mgedmin/pythonhelper.vim'
call vundle#end()
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{TagInStatusLine()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_enable_python_checker = 1

let mapleader = '\'
map <leader>l :set list!<CR>
map <leader>s :SyntasticToggleMode<CR>
map <leader>b oimport ipdb; ipdb.set_trace()<esc>
map <leader>B Oimport ipdb; ipdb.set_trace()<esc>
set list
set listchars=tab:>-,trail:~

set colorcolumn=80

set laststatus=2
set cursorline
set nu
set hls
set autoread

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set background=dark
colorscheme gruvbox
set incsearch
set shortmess+=I

command! XmlPrettyPrint :%!xmllint --format -
command! JsonPrettyPrint :%!python -m json.tool

set directory^=$HOME/.vim/swp//
set viminfo^=%
set hidden
"set sessionoptions=buffers
"au VimEnter * bw 1
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault

nnoremap j gj
nnoremap k gk
