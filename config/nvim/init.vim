set nocompatible
set number
set relativenumber
filetype off     

set tabstop=4 
set softtabstop=0 
set expandtab 
set shiftwidth=2 
set smarttab

" CtrlP config
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\bower_components\\*,*\\vendor\\*,*\\node_modules\\*,*\\dist\\*  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

syntax on
let g:mustache_abbreviations=1 

" set rtp+=~/vimfiles/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" Syntastic recommended settings
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%*  

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeCopyCmd= 'cp -r '

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
