extends Area2D

class_name Gem


signal gem_off_screen


const SPEED: float = 100.0


static var gem_count: int = 0


func _enter_tree() -> void:
	print("Gem:: _enter_tree")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gem_count += 1
	print(gem_count)
	print("Gem:: _ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += SPEED * delta
	
	if global_position.y >= Game.get_vpr().end.y:
		print("Gem falls off")
		gem_off_screen.emit()
		die()


func die() -> void:
	set_process(false)
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	print("Gem hits paddle")
	die()
