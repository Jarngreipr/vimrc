filetype plugin indent on
syntax enable
set relativenumber
set number
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
set $MYVIMRC="$HOME/.local/vimrc/.vimrc"

" Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

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

" VimWiki
Plug 'vimwiki/vimwiki'

" vimtex
Plug 'lervag/vimtex'
call plug#end()

" Keymaps
nnoremap <Space> <nop>
let mapleader="æ"
let maplocalleader="ð"

inoremap jk <Esc>
noremap <Esc> <Esc>
nmap <leader>ev :e $MYVIMRC<cr>
cmap w!! w !sudo tee > /dev/null %

map <leader>so :w<cr>:so %<cr>

nnoremap <silent> <C-f> :CtrlP<cr>

" Lightline configurations
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'active':{
	\  'left': [ ['mode', 'paste' ],
	\	     ['gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_functions': {
	\   'gitbranch': 'fugitive#head'
	\ },
	\}

colorscheme solarized

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
nnoremap þ /
nnoremap <C-þ> ?
map <silent> <leader><cr> :noh<cr>

" Ultisnips trigger configs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = "~/.vim/snippets/Ultisnips"

" vimwiki configs for UltiSnips
autocmd FileType vimwiki let g:UltiSnipsExpandTrigger="<A-tab>"
autocmd FileType vimwiki let g:UltiSnipsJumpForwardTrigger="<A-tab>"

"neovim python
let g:python3_host_prog = '/usr/bin/python'

" VimTEX configs
let g:vimtex_view_method = 'zathura'
autocmd BufReadPre *.tex let b:vimtex_main = 'master.tex'
let g:tex_flavor = "latex"


set noswapfile
