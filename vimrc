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
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fisadev/vim-isort'
Plugin 'tpope/vim-abolish'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
call vundle#end()
filetype plugin indent on

set statusline=
set statusline+=%t
set statusline+=%m
set statusline+=%{TagInStatusLine()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set sessionoptions=blank,buffers,curdir,resize,winpos,winsize

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jshint_exec = '~/node_modules/.bin/jshint'
let g:syntastic_javascript_eslint_exec = '~/node_modules/.bin/eslint'

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
map \ :CtrlPLine<cr>
map <a-j> :m+1<cr>
map <a-k> :m-2<cr>

let mapleader = ' '
map <leader>l :set list!<cr>
map <leader>s :SyntasticToggleMode<cr>
map <leader>b oimport ipdb; ipdb.set_trace()<esc>
map <leader>B Oimport ipdb; ipdb.set_trace()<esc>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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
command! Bd :bp<bar>bd#

set directory^=$HOME/.vim/swp//
set viminfo^=%
set hidden
nnoremap / /\v
vnoremap / /\v
vnoremap // y/<c-r>"<cr>
set ignorecase
set smartcase
set smartindent
set gdefault

nnoremap j gj
nnoremap k gk

au VimLeave * call SaveVimProject()
function! SaveVimProject()
    if filereadable("./Project.vim")
        mksession! Project.vim
    endif
endfunction
