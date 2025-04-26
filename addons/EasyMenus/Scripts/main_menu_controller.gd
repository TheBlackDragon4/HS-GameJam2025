extends Control
signal start_game_pressed

@onready var start_game_button: Button = $%StartGameButton
@onready var options_menu: Control = $%Settings
@onready var credits: Control = $%Credits
@onready var content: Control = $%Content 
@onready var title: = $%Title

func _ready():
	start_game_button.grab_focus()

func quit():
	get_tree().quit()
	
func open_options():
	options_menu.show()
	content.hide()
	title.hide()
	#options_menu.on_open()
	
func close_options():
	content.show();
	title.show()
	start_game_button.grab_focus()
	options_menu.hide()
	
func open_credits():
	credits.show()
	content.hide()
	
func close_credits():
	content.show()
	credits.hide()

func _on_start_game_button_pressed():
	emit_signal("start_game_pressed")
	get_tree().change_scene_to_file("res://scenes/Main.tscn")


func _on_credits_button_pressed() -> void:
	pass # Replace with function body.
