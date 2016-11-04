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
call vundle#end()
filetype plugin indent on

set statusline=
set statusline+=%t%m
set statusline+=%{TagInStatusLine()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*%=
set statusline+=%l:%c(%p%%)

set sessionoptions=blank,buffers,curdir,resize,winpos,winsize

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jshint_exec = '~/node_modules/.bin/jshint'
let g:syntastic_javascript_eslint_exec = '~/node_modules/.bin/eslint'

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = '__pycache__\|node_modules'

map \ :CtrlPLine<cr>
map <a-j> :m+1<cr>
map <a-k> :m-2<cr>
map <a-l> :res +1<cr>
map <a-L> :res -1<cr>
map <a-h> :vertical res +1<cr>
map <a-H> :vertical res -1<cr>
set guioptions-=m

let mapleader = ' '
map <leader>l :set list!<cr>
map <leader>s :SyntasticToggleMode<cr>

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

au FileType python map <buffer> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <buffer> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
au FileType python setl ts=4 sw=4 sts=4 et
au FileType htmldjango,html,css,cucumber setl ts=2 sw=2 sts=2 et

au VimLeave * call SaveVimProject()
function! SaveVimProject()
    if filereadable("./Project.vim")
        mksession! Project.vim
    endif
endfunction
