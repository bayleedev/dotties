" Leader
let mapleader = " "

syntax on
colorscheme solarized

au BufRead,BufNewFile *.es6 setfiletype javascript

set nowrap
set synmaxcol=200     " Limit syntax highlighting to lines under 200 chars
set clipboard=unnamed " Use system clipboard
set background=dark
set backspace=2       " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Resize windows when you resize vim
autocmd VimResized * :wincmd =

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Work specific mega repos
if (match(system("pwd"), "rpm_site") != -1)
  let g:ctrlp_use_caching = 1
endif

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" Mouse support
set mouse=a

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
