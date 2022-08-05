extends GridContainer

export(PackedScene) var cell_scene

var cells = []

func _ready():
	for i in range(0, 50 * 50):
		var cell = cell_scene.instance()
		cell.alive(false)
		add_child(cell)
		cells.append(cell)

func render_world(states):
	for i in range(0, len(states)):
		cells[i].alive(states[i])
		
