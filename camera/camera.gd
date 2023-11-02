extends Camera2D

const MIN_ZOOM: float = 0.1
const MAX_ZOOM: float = 1.0
const ZOOM_INCREMENT: float = 0.1
const ZOOM_RATE: float = 8.0

var _target_zoom: float = 1.0

func _physics_process(delta: float) -> void:
	zoom = lerp(
		zoom,
		_target_zoom * Vector2.ONE,
		ZOOM_RATE * delta
		)
	set_physics_process(
		not is_equal_approx(zoom.x, _target_zoom)
		)

func change_zoom(direction: float) -> void:
	if direction == 0.0:
		_target_zoom = 1.0
	else:
		_target_zoom = clampf(_target_zoom + direction * ZOOM_INCREMENT, MIN_ZOOM, MAX_ZOOM)
	set_physics_process(true)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative * zoom
	if event is InputEventMouseButton and event.is_pressed():
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				change_zoom(1.0)
			MOUSE_BUTTON_WHEEL_DOWN:
				change_zoom(-1.0)
			MOUSE_BUTTON_XBUTTON1:
				change_zoom(0.0)
