extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0

var time = 0
onready var finalTime = OS.get_unix_time()
var finalScore = 0
onready var ringcount = $Rings.get_child_count()
onready var rings = ringcount

func collect(value):
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.pitch_scale += (1.0/12)
	score+=value
	rings-=1
	if (rings == 0):
		finalScore = score * ((1.0/time) * 1000)
		#$RichTextLabel.text = "Score: "+str(score)+", Time: "+str(finalTime)+"s, Final Score: "+str(finalScore)

func _process(delta):
	if rings>0:
		time = OS.get_unix_time() - finalTime
	$RichTextLabel.text = "Rings: "+str(ringcount-rings)+"/"+str(ringcount)+", Score: "+str(score)+", Time: "+str(time)+"s, Final Score: "+str(finalScore)
