extends Node2D

# Godot 4.0及以上版本
var window_size = DisplayServer.window_get_size()
var progress: float = 0.0
var transition_color: Color
var target_scene: String
var transition_duration: float
var tween: Tween


func rectangle(to_scene: String, duration: float = 1.0, color = Color(0, 0, 0)):
	###这个是矩形的全屏渐显渐隐效果的过渡
	
	##参数说明：to_scene表示需要跳转的路径，需要带引号
	##        duration：表示跳转时间
	##        color:表示跳转的期间的颜色
	
	# 创建CanvasLayer确保在最上层显示
	var canvas = CanvasLayer.new()
	add_child(canvas)
	
	# 创建全屏ColorRect
	var fade_rect = ColorRect.new()
	fade_rect.color = color  # 跳转颜色
	fade_rect.size = get_viewport().get_visible_rect().size
	canvas.add_child(fade_rect)
	
	# 创建Tween
	var tween = create_tween()
	
	# 淡出效果
	fade_rect.modulate.a = 0
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)
	await tween.finished
	
	# 切换场景 - Godot 4方式
	get_tree().change_scene_to_file(to_scene)
	
	# 淡入效果
	tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, duration)
	await tween.finished
	
	# 清理
	canvas.queue_free()


func circle(to_scene: String, duration: float = 1.0, color: Color = Color(0, 0, 0)):
	target_scene = to_scene
	transition_duration = duration
	transition_color = color
	progress = 0.0
	
	# 确保节点在最前
	move_to_front()  # 移动到同层级最前
	self.set_process(true)
	self.visible = true
	
	
	# 开始动画
	var tween = create_tween()
	tween.tween_method(_update_progress, 0.0, 1.0, duration)
	tween.tween_callback(_on_transition_complete)

func _update_progress(value: float):
	progress = value
	
	queue_redraw()

func _on_transition_complete():
	# 切换场景
	if get_tree().change_scene_to_file(target_scene) == OK:
		move_to_front()  # 移动到同层级最前 
		self.set_process(true)
		self.visible = true
		# 反向动画
		var reverse_tween = create_tween()
		reverse_tween.tween_method(_update_progress, 1.0, 0.0, transition_duration)
		reverse_tween.tween_callback(self.queue_free)

func _draw():
	var viewport = get_viewport()
	var size = viewport.get_visible_rect().size
	var center = size / 2
	var max_radius = size.length()  # 使用对角线长度确保完全覆盖
	
		
	# 确保节点在最前
	move_to_front()  # 移动到同层级最前 
	self.set_process(true)
	self.visible = true
	
	# 绘制主圆形
	draw_circle(center, progress * max_radius, transition_color)

	# 抗锯齿边缘
	var edge_color = transition_color
	edge_color.a = transition_color.a * 0.7
	draw_circle(center, progress * max_radius * 0.1, edge_color)
