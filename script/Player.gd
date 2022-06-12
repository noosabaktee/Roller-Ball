extends RigidBody
export var rolling = 20
var first_touch 
var touch_position
var screen_size_x

func _ready():
	screen_size_x = get_viewport().size.x/2
	touch_position = screen_size_x

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if get_tree().paused == false:
			if event.pressed :
				screen_size_x = get_viewport().size.x/2
				touch_position = screen_size_x
				first_touch = event
				touch_position = event.get_position().x
			if !event.pressed and event.index == first_touch.index:
				first_touch = null
				touch_position = screen_size_x

func _physics_process(delta):
	angular_velocity.x = 0
	angular_velocity.y = 0
	translation.z = 0
	if Input.is_action_pressed("ui_right") or touch_position > screen_size_x:
		angular_velocity.z -= rolling*delta
	elif Input.is_action_pressed("ui_left") or touch_position < screen_size_x:
		angular_velocity.z += rolling*delta
	else:
		angular_velocity.z = 0





func _on_Area_body_entered(body):
	get_parent().game_over()
