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
"set lines=40 columns=118 "lines是上下宽度,以行为单位,columns是左右宽度,以字符个数为单位
autocmd GUIEnter * simalt ~x
colo xcodedarkhc "xcodedark sonokai xcodedarkhc
set autoindent "新行会采用和上一行相同的缩进
set shiftwidth=4
set go= ""guioptions的缩写
set backspace=eol,start,indent "修正 vim 删除/退格键行为
let g:netrw_banner = 0 "to remove netrw_banner
set so=3 "下面总有3行
set showtabline=0 "0 不显示标签栏,1,默认,2 总是显示标签栏
"补全字典设置
set dictionary-=$VIM/dic/dic.txt dictionary+=$VIM/dic/dic.txt
set iskeyword+=-,_ " 符号的单词不要被换行分割
set complete+=k

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
imap <C-g> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <BS>
" end
" 注释star
nnoremap <C-Up> I/*<cr>
imap <C-Up> <Home>/*<cr>
nnoremap <C-Down> A*/
imap <C-Down> <End> */
" shift+Left注释反注释
nmap <C-Left> I//<ESC>
nmap <C-Right> <Home>f/xx<ESC>
nmap <F11> i``<cr><Up>
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
elseif a:fileName == "teableDoc"
  execute "vi C:\\Users\\Administrator\\OneDrive\\202009-12-gvim\\teable_project\\01_table项目文档.md"
elseif a:fileName == "vimroot"
  execute "vi C:\\Users\\Administrator\\OneDrive\\202009-12-gvim\\vimRoot.txt"
endif
endfunction

function SaveFn(proName)
    "C:\Users\lc139\vimpro
execute "mksession! ~//vimpro//".a:proName.".vim"
   echom a:proName . " saved successfully"
endfunction

function OpenFn(proName)
  execute "source ~//vimpro//".a:proName.".vim"
endfunction

command -nargs=* We :call Worke(<f-args>) "Multiple args: proName save/open
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
if a:fileName =="c"
   execute "silent !start cmd"
elseif a:fileName == "e"
   execute "!start %:h"
elseif a:fileName == "guide"
   execute "vi C:\\Users\\Administrator\\vimpro\\doc.vim"
   execute "Explore"
endif
endfunction

call plug#begin("$VIM/vim82/plugged")
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" airline插件配置
let g:airline_theme="luna" "luna dark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0 "关闭状态显示空白符号计数

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
" 使用 'e 切换显示文件浏览，使用 'a 查找到当前文件位置
let g:maplocalleader="'"
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
nnoremap <silent> <LocalLeader>m :LeaderfMru <CR>
nnoremap <silent> <LocalLeader>l :LeaderfLine <CR>
nnoremap <silent> <LocalLeader>f :LeaderfFile <CR>
nnoremap <silent> <LocalLeader>b :LeaderfBuffer <CR>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap { {<CR>}<ESC>O

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> o <SID>defx_toggle_tree()
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
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')"need:pip3 install send2trash
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

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
