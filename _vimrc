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

" file browser, <leader>nt to open
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'

" C# autocomplete engine
Plug 'OmniSharp/omnisharp-vim'
Plug 'vim-syntastic/syntastic'

" automatic argument wrap
Plug 'FooSoft/vim-argwrap'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "


"======= vim-rooter ======

let g:rooter_patterns = [ 'Makefile', '*.sln', '.git', 'build/env.sh']

"======= vim-rooter end ==

"======= fzf config ======

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"======= fzf config end ========

"======= OmniSharp =======

filetype plugin on

let g:OmniSharp_server_stdio = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_timeout = 30

let g:OmniSharp_autoselect_existing_sln = 1

let g:OmniSharp_popup_options = {
            \ 'highlight': 'Normal',
            \ 'padding': [1],
            \ 'border': [1]
            \}
"let g:OmniSharp_selector_ui = 'fzf'
"let g:OmniSharp_selector_findusages = 'fzf'

nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>

"======= OmniSharp end ===

"======= syntastic =============

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cs_checkers = ['code_checker']

"======= syntastic end =========

"======= coc =============

let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
let g:coc_global_extensions=[ 'coc-omnisharp' ]

"======= coc end =========

:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>
:map <F2> ebi<CR><ESC>w

" Nerdtree bindings
:map <leader>nt :NERDTree<CR>

"Argwrap bindings
:nnoremap <silent> <leader>a :ArgWrap<CR>
:nnoremap <leader>wa wi<CR><ESC>ew :ArgWrap<CR>

