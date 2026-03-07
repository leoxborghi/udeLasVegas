extends Node


const LEVEL_SCORES: LevelScoresResource = preload("res://Scenes/Resources/LevelScores.tres")


var level_selected: int = 1



func _ready() -> void:
	pass

func get_level_best(level: int) -> int:
	return LEVEL_SCORES.get_level_best(level)


func set_score_for_current_level(score: int) -> void:
	LEVEL_SCORES.try_update_best_score(level_selected, score)
