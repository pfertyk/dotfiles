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
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rhysd/vim-crystal'
Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/deleft.vim'
Plugin 'fatih/vim-go'
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on

let mapleader = ' '

set laststatus=2

set statusline=
set statusline+=%t%m
set statusline+=%{TagInStatusLine()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*%=
set statusline+=%l:%c(%p%%)

set directory^=$HOME/.vim/swp//
set viminfo^=%
set hidden

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_go_checkers = ['gofmt']
let g:syntastic_go_eslint_exec = 'gofmt'

map <leader>s :SyntasticToggleMode<cr>

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = '__pycache__\|node_modules'

map \ :CtrlPLine<cr>

map <a-l> :res +1<cr>
map <a-L> :res -1<cr>
map <a-h> :vertical res +1<cr>
map <a-H> :vertical res -1<cr>

map <a-j> :m+1<cr>
map <a-k> :m-2<cr>

set cursorline
set colorcolumn=80
set nu
set autoread
set guioptions-=m
set shortmess+=I

nnoremap j gj
nnoremap k gk

set list
set listchars=tab:>-,trail:~

map <leader>l :set list!<cr>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

syntax enable
set background=dark
colorscheme gruvbox

command! XmlPrettyPrint :%!xmllint --format -
command! JsonPrettyPrint :%!python -m json.tool
command! Bd :bp<bar>bd#

nnoremap / /\v
vnoremap / /\v
vnoremap // y/<c-r>"<cr>
set ignorecase
set smartcase
set gdefault
set hls
set incsearch

au FileType python map <buffer> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <buffer> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
au FileType python setl ts=4 sw=4 sts=4 et
au FileType javascript,htmldjango,html,css,cucumber setl ts=2 sw=2 sts=2 et

set smartindent

set sessionoptions=blank,buffers,curdir,resize,winpos,winsize

au VimLeave * call SaveVimProject()
function! SaveVimProject()
    if filereadable("./Project.vim")
        mksession! Project.vim
    endif
endfunction
