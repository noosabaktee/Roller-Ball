extends Timer
var _timer
var obj = preload("res://objects/tscn/Obstacle.tscn") 
var skins = ["skin-0.jpg","skin-1.jpg"]
var chosen

func _ready():
	randomize()
	var randSkin = round(rand_range(0,1))
	chosen = 'res://skin/' + skins[randSkin]
	
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

	

func _on_Timer_timeout():
	randomize()
	var rand = round(rand_range(-23,27))
	var nodeInstance = obj.instance()
	nodeInstance.get_node("MeshInstance").get_surface_material(0).albedo_texture = load(chosen)
	nodeInstance.translate(Vector3(rand,0,0))
	get_parent().add_child(nodeInstance)


