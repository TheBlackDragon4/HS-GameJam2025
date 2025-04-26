extends CanvasLayer

@export var world_hidden_mouse = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		if world_hidden_mouse:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$%PauseMenu.open_pause_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_menu_resume() -> void:
	if world_hidden_mouse:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
