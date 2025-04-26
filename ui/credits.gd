extends Control
signal  close

# Emits close signal and saves the options
func go_back():
	emit_signal("close")

# Called from outside initializes the options menu
func on_open():
	print("Open credits")

func _input(event):
	if event.is_action_pressed("ui_cancel") && visible:
		accept_event()
		go_back()
