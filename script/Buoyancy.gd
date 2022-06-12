extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var rand = round(rand_range(0,1))
	play("Buoyancy")
	seek(rand,true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
