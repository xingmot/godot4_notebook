# 编辑器中运行

> [在编辑器中运行代码 — Godot 引擎（稳定版）英文文档 (godotengine.org)](https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html)

## @tool

> 在脚本文件顶部添加 `@tool`，将当前脚本转化为编辑器脚本。
>
> 编辑器脚本意味着脚本🐾**将同时在编辑器和游戏中运行**，可以方便的在编辑器中直接看到改变（通常需要重新打开场景以刷新变化）
>
> 在标记了 `@tool`后，还可通过 `Engine.is_editor_hint()`控制部分代码仅在编辑器或游戏中的一边运行。
>
> 使用场景：预览子弹、抛物线运动轨迹；预览随机生成结果；使用脚本绘制目标时，可以事先通过编辑器预览；查看某一时刻的动画状态。

## 部分代码在编辑器中运行

`Engine.is_editor_hint()`返回布尔值，表示是否处于编辑器内，如果为否，则代表是游戏内。

只在编辑器中执行代码：

```gdscript
if Engine.is_editor_hint():
# Code to execute when in editor.
```

只在游戏中执行代码：

```gdscript
if not Engine.is_editor_hint():
	# Code to execute when in game.
```
