extends Interactable

enum STATE {
	ON,
	OFF
}

onready var state = STATE.OFF

onready var anim_player = $AnimationPlayer
onready var audio_player = $AudioStreamPlayer3D

signal on_state_changed

# interactable
func get_interaction_text():
	if state == STATE.ON:
		return "to turn off"

	return "to turn on"

func interact():
	# return if button is in mid animation
	if anim_player.is_playing():
		return

	if state == STATE.ON:
		turn_off()
	else:
		turn_on()

# button
func turn_on():
	# return if button is in mid animation
	if anim_player.is_playing():
		return

	if state == STATE.ON:
		return

	state = STATE.ON
	anim_player.play("button_on")
	audio_player.play()

func turn_off():
	# return if button is in mid animation
	if anim_player.is_playing():
		return

	if state == STATE.OFF:
		return

	state = STATE.OFF
	anim_player.play_backwards("button_on")
	audio_player.play()

func _on_AnimationPlayer_animation_finished(_anim_name):
	if state == STATE.ON:
		emit_signal("on_state_changed", true)
	else:
		emit_signal("on_state_changed", false)
