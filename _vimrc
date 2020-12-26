set pythonthreedll=C:\Users\Administrator\AppData\Local\Programs\Python\Python39\python39.dll
set pythonthreehome=C:\Users\Administrator\AppData\Local\Programs\Python\Python39
let g:python3_host_prog="C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python39\\python.exe"
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set guifont=Ubuntu\ Mono:h12
set noundofile
set nobackup
set noswapfile
set diffexpr=MyDiff()
set nu
set lines=35 columns=118 "lines是上下宽度,以行为单位,columns是左右宽度,以字符个数为dao单位
colo sonokai "sonokai desert
set autoindent "新行会采用和上一行相同的缩进
set shiftwidth=4
set guioptions-=T "隐藏工具栏
set guioptions-=m "隐藏菜单栏
" 修正 vim 删除/退格键行为
" 如果你在一行的开头切换到插入模式，这时按退格无法退到上一行
" 如果你在一行的某一列切换到插入模式，这时按退格无法退删除这一列之前的字符
" 如果你开启了 autoindent，按回车时 vim 会根据上一行自动缩进，这时按退格无法删除缩进字符
set backspace=eol,start,indent
" 高亮第 80 列
"set colorcolumn=80
" 高亮光标所在行
"set cursorline
let g:netrw_banner = 0 "to remove netrw_banner

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

call plug#begin("$VIM/vim82/plugged")
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'godlygeek/tabular'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
"Plug 'Chiel92/vim-autoformat'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" ALE配置
" 始终开启标志列
let g:ale_sign_column_always = 1 
let g:ale_sign_error = '✗' 
let g:ale_sign_warning = '⚡'
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡  %d','✔ OK'] 
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" 文件内容发生变化时不进行检查
"let g:ale_lint_on_text_changed = 'never'
" 打开文件时不进行检查
"let g:ale_lint_on_enter = 0
" end

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
" Keymap in defx
" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> o     <SID>defx_toggle_tree()" 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> S defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> e defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  "nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  "nnoremap <silent><buffer><expr> i defx#do_action('open')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')"need:pip3 install send2trash
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  "切换光标候选选择"
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  "nnoremap <silent><buffer><expr> P
	  "\ defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  "test
  "Preview the file.  Close the preview window if it is alread exists
  "nnoremap <silent><buffer><expr> P defx#do_action('preview')
  "nnoremap <silent><buffer><expr> P defx#do_action('preview')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

map <C-v> "+gP
imap <C-v> <S-Insert>
map <C-c> "+y
imap <C-c> "+y
map <F9> o<Esc>p<Esc>
map <S-TAB> << V
vmap <S-TAB> << V
map <S-TAB> << V
vmap <S-TAB> << V
map <TAB> >> 
vmap <TAB> >>
" 插入模式命令
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
" end
" 注释star
nnoremap <C-Up> I/*<cr>
imap <C-Up> <Home>/*<cr>
nnoremap <C-Down> A*/
imap <C-Down> <End> */
" shift+Left注释反注释
nmap <C-Left> I//<ESC>
imap <C-Left> <Home>//<ESC>
nmap <C-Right> <Home>xx<ESC>
imap <C-Right> <Home><Right><Right><BS><BS><ESC>
" 注释 end
command -nargs=* Wk :call Work(<f-args>) "Multiple args: proName save/open
function Work(args1, ...)
 if a:0==0
   call OpenSingle(a:args1)
 elseif a:0 == 1
    call WorksFn(a:args1,a:1) 
 else
    call WorksFn(a:args1,a:1) 
 endif
endfunction

function WorksFn(g,proName)
if a:g =="s"
  call  SaveFn(a:proName)
elseif a:g == "o"
  call  OpenFn(a:proName)
endif
endfunction

function OpenSingle(fileName)
if a:fileName =="doc"
   execute "vi C:\\Users\\Administrator\\OneDrive\\202009-12-gvim\\0000_文档\\01_1_常用.md"
elseif a:fileName == "set"
   execute "vi E:\\Program Files Chen\\vim\\_vimrc"
elseif a:fileName == "guide"
   execute "vi C:\\Users\\Administrator\\vimpro\\doc.vim"
   execute "Explore"
elseif a:fileName == "readme"
   execute "vi C:\\Users\\Administrator\\OneDrive\\202009-12-gvim\\00_vim项目.md"
endif
endfunction

function SaveFn(proName)
execute "mksession! ~//vimpro//".a:proName.".vim"
   echom a:proName . " saved successfully"
endfunction

function OpenFn(proName)
  execute "source ~//vimpro//".a:proName.".vim"
endfunction

"----------------------------------
command -nargs=* We :call Worke(<f-args>) "Multiple args: proName save/open
noremap <silent> <F3> <Esc>:!start www.baidu.com<CR>
function Worke(args1, ...)
    echo a:0
 if a:0==0
   call WorkeSingle(a:args1)
 elseif a:0 == 1
    call WorkeFn(a:args1,a:1) 
 else
    call WorkeFn(a:args1,a:1) 
 endif
endfunction
function WorkeSingle(fileName)
    echo a:fileName
if a:fileName =="b"
   execute "!start www.baidu.com"
elseif a:fileName =="t"
   execute "!start http://localhost:8080/\\#\/contentMgmt\/diamondsCoinDistribution"
elseif a:fileName =="c"
   execute "silent !start cmd"
"Windows Explorer 打开当前文件所在的目录
elseif a:fileName == "e"
   execute "!start %:h"
elseif a:fileName == "guide"
   execute "vi C:\\Users\\Administrator\\vimpro\\doc.vim"
   execute "Explore"
endif
endfunction

"tab
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    "sp 改为竖屏
     vs
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
 
function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
     "到下一个标签页
      tabnext
    endif
    "sp 改为竖屏
     vs
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
"在一个tab中编辑文件，但是想要参考上一个tab中已经打开的一个窗口的内容，这时候想要将当前的tab变成上一个tab的一个分屏
"将tab变成上一个tab的一个分屏，或者将tab变成下一个tab的一个分屏。模仿之前有关tab的快捷键，我加了下面这两个映射：
nnoremap <F10> :call MoveToNextTab()<cr>
nnoremap <F11> :call MoveToPrevTab()<cr>
