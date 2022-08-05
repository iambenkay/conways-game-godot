extends Node

var states = []

var row = 50

var CAPACITY = row * row

func _ready():
	randomize()
	states = generate_states()
	
	$Grid.render_world(states)
	
func _on_Timer_timeout():
	states = next_gen(states)
	
	$Grid.render_world(states)


func generate_states():
	var result = []
	for _i in range(0, CAPACITY):
		result.append(bool(randi() % 2))
	return result
	
func get_cell(states, x, y):
	return states[(x *  row) + y]
	
func next_gen(states):
	var next_states = []
	
	for x in range(row):
		for y in range(row):
			var alive_count = 0
			
			for d in [[0, 1], [1, -1], [1, 0], [1, 1]]:
				if x + d[0] < 0 or x + d[0] >= row or x - d[0] < 0 or x - d[0] >= row:
					continue
				if y + d[1] < 0 or y + d[1] >= row or y - d[1] < 0 or y - d[1] >= row:
					continue
				if get_cell(states, x + d[0], y + d[1]):
					alive_count += 1
				if get_cell(states, x - d[0], y - d[1]):
					alive_count += 1
			
			if get_cell(states, x, y):
				next_states.append(alive_count == 2 or alive_count == 3)
			else:
				next_states.append(alive_count == 3)
	return next_states
