#### 刷新
```
手动刷新：
e!
```

一劳永逸：
```
无论是vim还是neovim, 在终端上执行默认都只在save的时候检查打开的文件是否被别人修改了.gvim增加了一个在获得焦点之后自动检查的机制. neovim由于gui跟terminal分离, 所以不同的gui实现方式不一样, neovim-qt并没有实现自动检查. 解决方案是在init.vim里加下面两句.

autocmd FocusGained * :checktime
set autoread

第一句是在获得焦点事件时自动检查文件时间戳. 如果在vim外被修改, 则提示用户. 可以选择重载或者继续编辑. 第二句的变量是说如果发现文件在vim外被修改, 在vim内没有修改, 则自动重载, 而不是提示用户.
```
