class_name Animal


extends RigidBody2D



@onready var label : Label = $Label



func _ready() -> void:
	pass



func _processed( _delta: float) -> void:
	label.text = "Freeze:%s\nContactCount:%d\nSleeping:%s" % [
		freeze,
		get_contact_count(),
		sleeping
	]
