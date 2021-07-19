extends Spatial

onready var lamp = $Lamp
onready var other_lamp = $Lamp2

# main game code to connect button and lamp
func _on_InteractiveButton_on_state_changed(state):
	if state == true:
		lamp.turn_on()
	else:
		lamp.turn_off()
	pass


func _on_ButtonVariation_on_state_changed(state):
	if state == true:
		other_lamp.turn_on()
	else:
		other_lamp.turn_off()
