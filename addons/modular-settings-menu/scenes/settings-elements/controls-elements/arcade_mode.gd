extends ToggleElement


# Called to apply the settings in the settings cache
func _apply_settings() -> void:
	apply_in_game_setting(currentValue)
