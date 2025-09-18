extends Node2D

func _on_paddle_area_entered(area: Area2D) -> void:
	print("Collision ", area)


func _on_gem_gem_off_screen() -> void:
	print("Game Over")
