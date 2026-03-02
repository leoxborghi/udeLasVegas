class_name Animal


extends RigidBody2D



@onready var label : Label = $Label
@onready var arrow : Sprite2D = $Arrow
var _start: Vector2 = Vector2.ZERO
var _drag_start: Vector2 = Vector2.ZERO
var _dragged_vector: Vector2 = Vector2.ZERO

var _is_dragging: bool = false



func _ready() -> void:
	_start = position



func _processed( _delta: float) -> void:
	var debug_str: String = "FR:%s CC:%d SL:%s\n" % [
		freeze,
		get_contact_count(),
		sleeping
	]
	debug_str += "is_dragging:%s drag_start:%.0f, %.0f" % [
		_is_dragging, _drag_start.x, _drag_start.y
]
	label.text = debug_str


func _physics_process(_delta: float) -> void:
	if _is_dragging: handle_dragging()


func handle_dragging() -> void:
	_dragged_vector = get_global_mouse_position() - _drag_start
	position = _start + _dragged_vector



func start_dragging() -> void: 
	arrow.show()
	_is_dragging = true
	_drag_start = get_global_mouse_position()



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		input_event.disconnect(_on_input_event)
		start_dragging()
