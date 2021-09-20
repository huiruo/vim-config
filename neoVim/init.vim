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
set showcmd                                                     " 显示输入信息
set cursorline                                                  " 显示光标所在行
set wildmenu                                                    " 显示补全提示
set hlsearch                                                    " 高亮搜索结果
set nobackup
set noswapfile
set showtabline=0 "0 不显示标签栏,1,默认,2 总是显示标签栏
syntax on

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

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'junegunn/vim-easy-align' 
Plug 'tomasr/molokai'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

colorscheme molokai

"Leaderf 配置
nnoremap <silent> <LocalLeader>m :LeaderfMru <CR>
nnoremap <silent> <LocalLeader>l :LeaderfLine <CR>
nnoremap <silent> <LocalLeader>f :LeaderfFile <CR>
nnoremap <silent> <LocalLeader>b :LeaderfBuffer <CR>


"defx
call defx#custom#option('_', {
      \ 'winwidth': 35,
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
autocmd FileType defx call s:defx_my_settings()
nnoremap <silent> <LocalLeader>e :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

function! s:defx_my_settings() abort
    " Define mappings
    setl nonu
    nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')

    nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
	nnoremap <silent><buffer><expr> e defx#do_action('drop', 'vsplit')
endfunction


