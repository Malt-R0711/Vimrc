syntax on

set noerrorbells
set belloff=all
set termguicolors
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" gotta have the gruvbox
Plug 'morhetz/gruvbox'

" gotta have the relative line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" don't know yet
Plug 'jremmen/vim-ripgrep'

"alleged git integration, don't know how to use
Plug 'tpope/vim-fugitive'

" don't know yet
Plug 'vim-utils/vim-man'

" alleged better undo
Plug 'mbbill/undotree'

" file browser, <leder>nt to open
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'OmniSharp/omnisharp-vim'

Plug 'FooSoft/vim-argwrap'
call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
let g:coc_global_extensions=[ 'coc-omnisharp' ]

:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>
:map <F2> ebi<CR><ESC>w
:map <leader>nt :NERDTree<CR>
:nnoremap <silent> <leader>a :ArgWrap<CR>
:nnoremap <leader>wa wi<CR><ESC>ew :ArgWrap<CR>

