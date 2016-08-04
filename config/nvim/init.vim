map <F6> :so $HOME/.vimrc<CR>
map <F9> :e $HOME/.vimrc<CR>

set binary

set noeol
set nocompatible ruler laststatus=2 showcmd showmode number relativenumber
highlight ColorColumn ctermbg=235 guibg=#2c2d27
execute "set colorcolumn=" . join(range(81,335), ',')

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set smarttab

" Git Fugitive config
set diffopt+=vertical

set clipboard=unnamed

" CtrlP config
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\bower_components\\*,*\\vendor\\*,*\\node_modules\\*,*\\dist\\*  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

syntax on
set background=dark
set backspace=2
let g:mustache_abbreviations=1

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" Syntastic recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" LESS
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
au BufNewFile,BufRead *.less set filetype=less
au BufReadPost *.hbs set filetype=html.mustache syntax=html.mustache

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeCopyCmd= 'cp -r '

" Line number tweaks
au FocusLost * :set number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" nnoremap <C-n> :call NumberToggle()<cr>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf-history'

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

set foldmethod=syntax
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "⇚"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN = "ℕ"
let g:javascript_conceal_prototype = "¶"
let g:javascript_conceal_static = "•"
let g:javascript_conceal_super = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

" for ntpeters/vim-better-whitespace
autocmd BufWritePre * StripWhitespace

call plug#begin()
" Group dependencies, vim-snippets depends on ultisnips
Plug 'elzr/vim-json', { 'for': 'json'  } " JSON support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'junegunn/goyo.vim', { 'on': 'Goyo'  } " distraction-free writing
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-unimpaired'
Plug 'groenewege/vim-less'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
call plug#end()