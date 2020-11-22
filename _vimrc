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

" automatic argument wrap
Plug 'FooSoft/vim-argwrap'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
let g:coc_global_extensions=[ 'coc-omnisharp' ]

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

"======= OmniSharp end ===

:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>
:map <F2> ebi<CR><ESC>w

" Nerdtree bindings
:map <leader>nt :NERDTree<CR>

"Argwrap bindings
:nnoremap <silent> <leader>a :ArgWrap<CR>
:nnoremap <leader>wa wi<CR><ESC>ew :ArgWrap<CR>

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

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


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

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"======= fzf config end ========
