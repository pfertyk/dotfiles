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
Plugin 'tpope/vim-speeddating'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rhysd/vim-crystal'
Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/deleft.vim'
Plugin 'fatih/vim-go'
Plugin 'morhetz/gruvbox'
Plugin 'calviken/vim-gdscript3'
Plugin 'rust-lang/rust.vim'
Plugin 'preservim/nerdtree'
Plugin 'jceb/vim-orgmode'
Plugin 'chrisbra/unicode.vim'
Plugin 'hashivim/vim-terraform'
call vundle#end()
filetype plugin indent on

let mapleader = ' '
let maplocalleader = ','

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
map <C-n> :NERDTreeToggle<cr>

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = '__pycache__\|node_modules'

map \ :CtrlPLine<cr>

let g:vim_isort_config_overrides = {'multi_line_output': 3}

let g:org_tag_column=0
let g:org_todo_keywords=['TODO', 'NEXT', '|', 'DONE']

map <a-l> :res +1<cr>
map <a-L> :res -1<cr>
map <a-h> :vertical res +1<cr>
map <a-H> :vertical res -1<cr>

map <a-j> :m+1<cr>
map <a-k> :m-2<cr>

set cursorline
set nu
set autoread
set guioptions-=m
set guioptions-=T
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
command! Term :terminal++curwin

nnoremap / /\v
vnoremap / /\v
vnoremap // y/<c-r>"<cr>
set ignorecase
set smartcase
set gdefault
set hls
set incsearch

au FileType python
  \ map <buffer> <leader>b oimport ipdb; ipdb.set_trace()<esc>
  \ map <buffer> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
  \ python setl ts=4 sw=4 sts=4 et
  \ set foldmethod=indent
  \ set autoindent
  \ set colorcolumn=80
au FileType sh,json,yml,yaml,javascript,tex,htmldjango,html,css,scss,cucumber
  \ setl ts=2 sw=2 sts=2 et
au FileType org setl tw=0 spell

" Custom .txt file syntax highlighting
au BufRead,BufNewFile *.txt hi backlog guifg=cyan ctermfg=cyan
au BufRead,BufNewFile *.txt hi pending guifg=yellow ctermfg=yellow
au BufRead,BufNewFile *.txt hi roadmap guifg=darkcyan ctermfg=darkcyan
au BufRead,BufNewFile *.txt hi waiting guifg=gray ctermfg=gray
au BufRead,BufNewFile *.txt hi low guifg=green ctermfg=green
au BufRead,BufNewFile *.txt hi deadline guifg=red ctermfg=red

au BufRead,BufNewFile *.txt syn match backlog "\v^\@B .*$"
au BufRead,BufNewFile *.txt syn match pending "\v^\@P .*$"
au BufRead,BufNewFile *.txt syn match roadmap "\v^\@R .*$"
au BufRead,BufNewFile *.txt syn match waiting "\v^\@W .*$"
au BufRead,BufNewFile *.txt syn match low "\v^\@L .*$"
au BufRead,BufNewFile *.txt syn match deadline "\v^\@D .*$"

set smartindent

set sessionoptions=blank,buffers,curdir,resize,winpos,winsize

au VimLeave * call SaveVimProject()
function! SaveVimProject()
    if filereadable("./Project.vim")
        mksession! Project.vim
    endif
endfunction
