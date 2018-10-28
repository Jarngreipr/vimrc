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


let $MYVIMRC="$HOME/.local/dotfiles/vimrc/.vimrc"

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
Plug 'Valloric/YouCompleteMe'

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

" C programming
Plug 'WolfgangMehner/vim-plugins'
call plug#end()

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized

" Keymaps
let mapleader="\\"
let maplocalleader="<S-\\>"

" csupport
let g:C_MapLeader = ','

inoremap jk <Esc>
" Uppercase whole word in insert mode
inoremap <c-u> <esc>gUiwi
" Uppercase whole word in normal mode
nnoremap <c-u> gUiw

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
cnoremap w!! w !sudo tee > /dev/null %

noremap <leader>so :w<cr>:so %<cr>

" ctrlp keymaps
nnoremap <silent> <C-f> :CtrlP<cr>

" Window movement
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Disable scrolling
inoremap <ScrollWheelUp> <Nop> 
inoremap <ScrollWheelDown> <Nop> 

" Tab mappings
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove<cr>
noremap <leader>tN :tabNext<cr>
noremap <leader>tp :tabprevious<cr>

" Enable folding with spacebar
nnoremap <space> za

" Search
noremap <silent> <leader><cr> :noh<cr>

" Rust development
let g:rustfmt_autosave = 1
noremap <leader>ct :!cargo test<cr>
let b:current_compiler = 'cargo'
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" YouCompleteMe keymaps
noremap <leader>gD :YouCompleter GetDoc<cr>

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
