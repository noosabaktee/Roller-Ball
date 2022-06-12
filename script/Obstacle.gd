extends Area 

func _physics_process(delta):
	translation.y -= gravity * delta 

func _on_Obstacle_body_entered(body):
	if body.name == "Ground":
		get_parent().get_parent().add_score()
		queue_free()
	elif body.name == "Player":
		get_parent().get_parent().game_over()
		get_parent().get_parent().get_node("CrashSound").play()

		
