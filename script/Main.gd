extends Spatial

export var score = 0
var fileName = "user://save_game.save"

func _init():
	var file = File.new()
	if !file.file_exists(fileName):
		file.open(fileName, File.WRITE)
		var content = {
			"best_score": "0",
		}
		file.store_var(content)
	file.close()
	
func _ready():
	$BestScore/BestScore.text = "Best Score: " + loadData("best_score")

func add_score():
	score += 1
	$UI/Score.text = str(score)

func game_over():
	get_tree().paused = true
	$"Button/RestartGame".show()
	save()

func save():
	var bestScore = loadData("best_score")
	if score > int(bestScore):
		bestScore = score
	var file = File.new()
	file.open(fileName, File.WRITE)
	var content = {
		"best_score": str(bestScore),
	}
	file.store_var(content)
	file.close()
	
func loadData(param):
	var get = File.new()
	get.open(fileName, File.READ)
	var result = get.get_var()
	get.close()
	return result[param]

func _on_RestartGame_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
