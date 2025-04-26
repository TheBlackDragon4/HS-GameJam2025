extends HBoxContainer

@onready var current_slot = null

func _ready():
	$HotbarSlot.grab_focus()
	#$HotbarSlot.focus_next()
	#self.current_slot = $HotbarSlot

#func _on_hotbar_slot_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
#
#func _on_hotbar_slot_2_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
#
#func _on_hotbar_slot_3_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
#
#func _on_hotbar_slot_4_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
#
#func _on_hotbar_slot_5_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
#
#func _on_hotbar_slot_6_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
#
#func _on_hotbar_slot_7_hotbar_slot_selected(hotbar_slot):
	#self.current_slot = hotbar_slot
