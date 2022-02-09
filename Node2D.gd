extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _input(event):
	if (!(event is InputEventMouseButton) and !(event is InputEventMouseMotion)):
		get_tree().change_scene("res://MainScene.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
