let mapleader="'"                                               " 设置leader键
let g:maplocalleader="'"
set nocompatible                                                " 不以兼容模式运行
set encoding=utf-8                                              " utf-8编码
set helplang=cn                                                 " 中文帮助文档
set number                                                      " 显示行号
set wrap                                                        " 自动换行
autocmd FocusGained * :checktime
set autoread
set autoread
"set nowrap																											"	设置不换行
set showcmd                                                     " 显示输入信息
set cursorline                                                  " 显示光标所在行
set wildmenu                                                    " 显示补全提示
set hlsearch                                                    " 高亮搜索结果
set nobackup
set noswapfile
set wildmenu                    																" vim 自身命令行模式智能补全
set showmatch " 高亮匹配括号
"set showtabline=0 "0 不显示标签栏,1,默认,2 总是显示标签栏
syntax on
set winaltkeys=no
set autoindent "如果在一行的开头输入空格或制表符，那么后续的新行将会缩进到相同的位置
set ts=2                                                        " 指定tab缩进的字符数目
set shiftwidth=2 "把每级缩进设置为x个空格,
"使用 >> 命令让现有的一行增加一级缩进，使用 << 命令减少一级缩进。在这些命令前面加上一个整数，即可让多行增加或减少一级缩进。例如，把游标放在第 6 行的开头，进入命令模式之后，输入 5>> 就会让下面五行增加一级缩进

" ======================================== 设置状态栏格式 ========================================
set statusline=%1*\%<%.50F\                                     "显示文件名和文件路径
set statusline+=%=%2*\%y%m%r%h%w\ %*                            "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*                       "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*                       "显示光标所在行和列
set statusline+=%5*\%3p%%\%*                                    "显示光标前文本所占总文本的比例
" ======================================== 设置状态栏格式 ========================================
set mouse=a                                                     " 启用鼠标
"set backspace=indent,eol,start                                  " 退格键可以退到上一行
"set scrolloff=5                                                 " 光标行上下移动范围各缩小5行

"复制粘贴
"map <C-v> +p
"imap <C-v> <S-Insert>
"map <C-c> +y
"imap <C-c> "+y
map <C-C> "+y
map <C-V> "+p
" markdown code block
" map <C-i> i```<Enter>```<Up><Enter>
" imap <C--> <Esc><C-i>

map <C-i> i```javaScript<Esc>o```<Esc>O
imap <C--> <Esc><C-i>

map <C-q> i```<Enter>```<Up><Enter>
imap <C-q> <Esc><C-q>

" 插入模式命令
imap <C-g> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <BS>
" 插入模式复制
imap <C-v> <Esc>"+p

imap <C-y> ##<Space>
map <C-y> i##<Space>

map <C-]> i###<Space>
imap <C-]> ###<Space>

map <C-\> i####<Space>
imap <C-\> ####<Space>
" end

"插件
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'luochen1990/rainbow'
" jsx start
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" If you have nodejs and yarn,use this install markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } 
" end
" markdown plug
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" end
call plug#end()

" markdow plug
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_disabled = 1
" end

colorscheme molokai

" 彩虹括号
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" jsx支持
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" dark red 参考：https://github.com/peitalin/vim-jsx-typescript
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" markdown preview
nmap <C-m> <Plug>MarkdownPreview
nmap <C-s> <Plug>MarkdownPreviewStop
"
