extends Button

#@export var itemTexture :CompressedTexture2D
#@export var slotColor : Color

func _on_focus_entered():
	$CenterContainer/SlotBorder.modulate = Color(0,0,1,1)
	#self.hotbar_slot_selected.emit(self)
	
func _on_focus_exited():
	$CenterContainer/SlotBorder.modulate = Color(1,1,1,1)


func _on_ready():
	$CenterContainer/ItemPicture.texture = get_meta("MenuToImage")[0]
	#$CenterContainer/ItemPicture.texture = itemTexture # Replace with function body.
	#$CenterContainer/ItemPicture.modulate = slotColor # Replace with function body.
	
