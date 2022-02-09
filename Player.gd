extends RigidBody


# # # READ ME # # #
# this is my pretty rushed player script
# you can take a look if you feel like, but I doubt I'm doing anything
# specific to this that would mess up physics
# Just in case, I've marked the only lines that use the physics system for you


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rlift = 0
var llift = 0
onready var lwing = $Mehve2/Cube001
onready var rwing = $Mehve2/Cube003
onready var audio = $AudioStreamPlayer
#onready var cast = $RayCast
onready var bas = transform.basis
var pspeed = 1
var drag = .9
var thrust = 400#7
var tspeed = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	#PhysicsServer.space_set_param(get_world().space,PhysicsServer.SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION,0)
	
	
	# # # # # # THIS AFFECTS THE PLANE
	apply_central_impulse(-bas.z*1000)
	audio.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	bas = transform.basis
	llift=lerp(llift,0,delta*10)
	rlift=lerp(rlift,0,delta*10)
	if Input.is_action_pressed("backward"):
		llift+=1*delta
		rlift+=1*delta
	if Input.is_action_pressed("forward"):
		llift-=1*delta
		rlift-=1*delta
	if Input.is_action_pressed("left"):
		llift-=1*delta
		rlift+=1*delta
	if Input.is_action_pressed("right"):
		llift+=1*delta
		rlift-=1*delta
	rlift=clamp(rlift,-1,1)
	llift=clamp(llift,-1,1)
	lwing.rotation.x = deg2rad(llift*90+8.7)
	rwing.rotation.x = deg2rad(-rlift*90-8.7)
	#print(linear_velocity)
	
	var vel = linear_velocity.length()
	
	var v2 = vel
	var knifeval = cos(bas.get_euler().z*2)/2+.5
	audio.pitch_scale = clamp(vel/250,0.1,INF)
	#engine?
	
	# # # # # # THIS AFFECTS THE PLANE
	add_central_force((-bas.z*v2)-bas.z*thrust)
	#add_central_force(bas.y*speed*speed)
	#left aileron
	
	# # # # # # THIS AFFECTS THE PLANE
	add_force((bas.y*llift*tspeed),bas.x*-7+bas.z*-.65)
	#right aileron
	
	# # # # # # THIS AFFECTS THE PLANE
	add_force((bas.y*rlift*tspeed),bas.x*7+bas.z*-.65)
	#drag center
