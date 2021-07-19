extends StaticBody

export (SpatialMaterial) var off_material
export (SpatialMaterial) var on_material

signal on_state_changed


enum STATE {
	ON,
	OFF
}

var state
onready var bulb_mesh = $Bulb


func _ready():
	state = STATE.OFF
	bulb_mesh.set_surface_material(0, off_material)

# lamp
func turn_on():
	if state == STATE.ON:
		return

	var mat = bulb_mesh.get_surface_material(0)
	bulb_mesh.set_surface_material(0, on_material)
	state = STATE.ON
	emit_signal("on_state_changed", true)

func turn_off():
	if state == STATE.OFF:
		return

	var mat = bulb_mesh.get_surface_material(0)
	bulb_mesh.set_surface_material(0, off_material)
	state = STATE.OFF
	emit_signal("on_state_changed", false)

