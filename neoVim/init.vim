"set pythonthreedll=C:\Users\ruo\AppData\Local\Programs\Python\Python39\python39.dll
"set pythonthreehome=C:\Users\ruo\AppData\Local\Programs\Python\Python39
"let g:python3_host_prog="C:\\Users\\ruo\\AppData\\Local\\Programs\\Python\\Python39\\python.exe"

let mapleader="'"                                               " 设置leader键
let g:maplocalleader="'"
set nocompatible                                                " 不以兼容模式运行
set encoding=utf-8                                              " utf-8编码
set helplang=cn                                                 " 中文帮助文档
set number                                                      " 显示行号
set wrap                                                        " 自动换行
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
"map <C-v> "+p
"imap <C-v> <S-Insert>
"map <C-c> "+y
"imap <C-c> "+y

" 复制到系统剪切板
map +y "+y
" 从系统剪切板粘贴
map +p "+p

" 快速跳转行首与行尾
nnoremap L $
nnoremap H ^
" 向下5行
noremap <C-j> 5j
" 向上5行
noremap <C-k> 5k

" 插入模式命令
imap <C-g> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <BS>
" end

"插件
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'luochen1990/rainbow'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

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

"Leaderf 配置
nnoremap <silent> <LocalLeader>m :LeaderfMru <CR>
nnoremap <silent> <LocalLeader>l :LeaderfLine <CR>
nnoremap <silent> <LocalLeader>f :LeaderfFile <CR>
nnoremap <silent> <LocalLeader>b :LeaderfBuffer <CR>


"defx
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'columns': 'git:mark:indent:icons:filename:type',
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

nmap <silent> <Leader>a :Defx <cr>
"nnoremap <silent> <LocalLeader>e :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
"nnoremap <silent> <LocalLeader>a :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

" 设置 ff 为开关defx的快捷键, 其中【-search=`expand('%:p')`】表示打开defx树后，光标自动放在当前buffer上
nnoremap <silent> <LocalLeader>e :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    setl nonu
    nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')

    nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> e defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> h defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

" 使<tab>用于触发完成，完成确认，摘要扩展和跳转，就像VSCode一样
let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

