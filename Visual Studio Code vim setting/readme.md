#### 1.配置文件都放在settings.json同级目录

#### 2.如何复制vscode 的命令？
```
复制vim:
到快捷键搜索vim 就可以看到

同理：下面是复制出来的命令
```


#### 被移除的命令
```
放大缩小
ctrl + -
workbench.action.zoomOut
{
  "key": "ctrl+shift+oem_minus",
  "command": "workbench.action.zoomOut"
}



折叠除所选区域之外的所有区域
{
  "key": "ctrl+k ctrl+oem_minus",
  "command": "editor.foldAllExcept",
  "when": "editorTextFocus && foldingEnabled"
}


ctrl + shift + -
{
  "key": "ctrl+shift+oem_minus",
  "command": "workbench.action.zoomOut"
}
```
