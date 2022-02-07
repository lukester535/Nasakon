extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var used = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ring_body_entered(body):
	if !used:
		$AudioStreamPlayer.play()
		var score = (1/(body.global_transform.origin.distance_to(global_transform.origin)))*100
		visible = false
		used = true
		#print(score)
