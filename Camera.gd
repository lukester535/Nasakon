extends Camera

onready var player = get_parent().get_parent()
var camspeed = 10
var target

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	transform.origin = player.transform.origin + (player.get_global_transform().basis.z*10)
	transform.basis = player.transform.basis


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target = player.transform
	target.origin += (player.get_global_transform().basis.z*10) + (player.get_global_transform().basis.y*1.75)
	target.basis=target.basis.rotated(player.transform.basis.x,-PI/32)
	transform = transform.interpolate_with(target,delta*camspeed*(player.linear_velocity.length()*.01))
	#delta*camspeed
