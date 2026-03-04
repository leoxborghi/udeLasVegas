extends Node


const ANIMAL = preload("res://Animal/animal.tscn")


@onready var start: Marker2D = $Start



func _ready() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)
	spawn_animal()
	
	
func spawn_animal() -> void:
	var animal: Animal = ANIMAL.instantiate()
	animal.position = start.position
	call_deferred("add_child", animal)
