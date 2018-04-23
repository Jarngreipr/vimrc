set nocompatible
filetype plugin indent on
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
