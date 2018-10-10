set nocompatible
filetype plugin indent on
let python_highlight_all=1
syntax on
set hidden
set relativenumber
set number
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
set noswapfile
set splitright
set foldlevel=99


let $MYVIMRC="$HOME/.local/vimrc/.vimrc"

" Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

" Plug 'justinmk/vim-sneak'

Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}

Plug 'altercation/vim-colors-solarized'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'Jarngreipr/vim-snippets'

" Statusline
Plug 'itchyny/lightline.vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'

" YouCompleteMe
Plug 'valloric/YouCompleteMe'

" VimWiki
Plug 'vimwiki/vimwiki'

" vimtex
Plug 'lervag/vimtex'

"Powershell support
Plug 'PProvost/vim-ps1'

" Pep8 highlighting for python
Plug 'nvie/vim-flake8'

" Jedi analysis for python
Plug 'davidhalter/jedi-vim'
call plug#end()

colorscheme solarized

" Keymaps
let mapleader="\\"
let maplocalleader="<S-\\>"

inoremap jk <Esc>

nmap <leader>ev :e $MYVIMRC<cr>
cmap w!! w !sudo tee > /dev/null %

map <leader>so :w<cr>:so %<cr>

" ctrlp keymaps
nnoremap <silent> <C-f> :CtrlP<cr>

" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable scrolling
inoremap <ScrollWheelUp> <Nop> 
inoremap <ScrollWheelDown> <Nop> 

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tN :tabNext<cr>
map <leader>tp :tabprevious<cr>

" Enable folding with spacebar
nnoremap <space> za

" Search
map <silent> <leader><cr> :noh<cr>

" Rust development
let g:rustfmt_autosave = 1
map <leader>ct :!cargo test<cr>
let b:current_compiler = 'cargo'
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" YouCompleteMe keymaps
map <leader>gD :YouCompleter GetDoc<cr>

" VimTEX configs
let g:vimtex_view_method = 'zathura'
autocmd BufReadPre *.tex let b:vimtex_main = 'master.tex'
let g:tex_flavor = "latex"

" Netrw configs
let g:netrw_wiw = 20
let g:netrw_usetab = 1

" PEP 8 for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=91 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set foldmethod=indent |
    \ set encoding=utf-8

" Syntastic python checkers
let g:syntastic_python_checkers = ['mypy']

let g:ycm_python_binary_path = 'python'
" Make YCM and vim aware of virtualenv
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

