# 🎮 SimpleChangeScene - Godot场景过渡插件使用指南


一个简单易用的Godot场景过渡插件，提供多种平滑过渡效果。

---

## 🛠️ 安装与设置

### 基本配置步骤

1. **打开项目设置**  
   `项目` → `项目设置` → `全局` → `自动挂载`

2. **挂载脚本**  
   选择"SimpleChangeScene.gd"脚本进行挂载

3. **启用全局变量**  
   在"全局变量"选项中设置为`启用`

---

## 💻 代码调用指南

### 🔲 矩形渐隐过渡效果

- 在要过渡场景的地方调用rectangle方法，即为 SimpleChangeScene.rectangle()
  - 填入相关参数：
	func rectangle(to_scene: String, duration: float = 1.0, color = Color(0, 0, 0)):
		###这个是矩形的全屏渐显渐隐效果的过渡
		
		##参数说明：to_scene表示需要跳转的路径，需要带引号
		##        duration：表示跳转时间
		##        color:表示跳转的期间的颜色

### ⚫ 圆形渐隐过渡效果

 在要过渡场景的地方调用circle方法，即为 SimpleChangeScene.circle()
  - 填入相关参数：
	func circle(to_scene: String, duration: float = 1.0, color: Color = Color(0, 0, 0)):
		###这个是圆形效果的过渡
		
		##参数说明：to_scene表示需要跳转的路径，需要带引号
		##        duration：表示跳转时间
		##        color:表示跳转的期间的颜色

---

## 🛠️ 下载版本选择

- 插件本体：https://github.com/xuezhaju/-Godot-SimpleChangeScene/releases/tag/%E6%8F%92%E4%BB%B6%E6%9C%AC%E4%BD%93

- 插件本体 + 测试场景：https://github.com/xuezhaju/-Godot-SimpleChangeScene/releases/tag/%E6%8F%92%E4%BB%B6%E6%9C%AC%E4%BD%93
  - 并选择 CodeAndScene.7z 文件下载
