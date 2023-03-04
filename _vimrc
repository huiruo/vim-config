colo xcodedarkhc " xcodedark xcodedarkhc
set number
set noundofile
set nobackup
set noswapfile
set encoding=utf-8
set cursorline " highlight current line
" set guifont=Terminal:h12:cGB2312:qDRAFT
set guifont=Cascadia_Mono:h12:cANSI:qDRAFT
set lines=40 columns=150
set backspace=eol,start,indent " vim Delete/Backspace

set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set showtabline=0 " 0:hide top tab bar,1:default,2:always show tab bar

" hide scrollbar
set guioptions-=r 
set guioptions-=L
set guioptions-=b

noremap Z :q <CR>
noremap <space> :
inoremap jk <Esc>

" copy/paste 
nmap <C-v> "+gP
imap <C-v> <S-Insert>
nmap <C-c> "+y
imap <C-c> "+y
vmap <C-c> "+y

" move to end/start
noremap H ^
noremap L $

" move in insert mode
imap <C-g> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <BS>

" markdown code block
nmap <C--> i```javaScript<Esc>o```<Esc>O
imap <C--> <Esc><C-->
nmap <C-q> i```<CR>```<Up><CR>
imap <C-q> <ESC><C-q>
nmap <C-y> i##<Space>
imap <C-y> ##<Space>
nmap <C-]> i###<Space>
imap <C-]> ###<Space>

" plug
call plug#begin('$VIMRUNTIME/autoload')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

Plug 'skywind3000/vim-terminal-help'

" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-path'
call plug#end()

let g:airline#extensions#tabline#enabled = 1  " open tabline
let g:airline#extensions#tabline#buffer_nr_show = 1  " show buffer number
let g:airline#extensions#ale#enabled = 1  " enable ale integration" Status bar display icon settings

let NERDTreeWinPos='left'
let NERDTreeWinSize=30

" let g:vim_markdown_folding_disabled = 1
let g:maplocalleader="'"
let g:maplocalleader="'"
" autocmd VimEnter * NERDTree
nnoremap <silent> <LocalLeader>t :NERDTreeToggle <CR>
