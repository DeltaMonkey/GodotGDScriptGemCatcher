extends Node2D


const GEM = preload("res://Scenes/Gem/Gem.tscn")


func _ready() -> void:
	spawn_gem()


func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(50, get_viewport_rect().end.x-50)
	new_gem.position = Vector2(x_pos, -50.0)
	new_gem.gem_off_screen.connect(_on_gem_gem_off_screen)
	add_child(new_gem)


func _on_paddle_area_entered(area: Area2D) -> void:
	print("Collision ", area)


func _on_gem_gem_off_screen() -> void:
	print("Game Over")


func _on_timer_timeout() -> void:
	spawn_gem()
