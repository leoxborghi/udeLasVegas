extends Control


var _total_cups: int = 0
var _current_cups: int = 0
var _attempts: int = 0


@onready var vb_complete: VBoxContainer = $VbComplete
@onready var music: AudioStreamPlayer = $Music
@onready var attempts_label: Label = $MC/VB/HBAttempts2/AttemptsLabel2




func _ready() -> void:
	get_tree().paused = false
	_total_cups = get_tree().get_nodes_in_group(Cup.GROUP_NAME).size()
	SignalHub.on_cup_destroyed.connect(on_cup_destroyed)
	on_attempt_made()
	
	
func on_attempt_made() -> void:
	_attempts += 1
	attempts_label.text = "%d" % _attempts




func on_cup_destroyed() -> void:
	_current_cups += 1
	if _current_cups == _total_cups:
		vb_complete.show()
		music.play()
		get_tree().paused = true
