extends ColorRect

var GREEN = Color("1cd02f")
var TRANSPARENT = Color("00ffffff")

func alive(state):
	color = color_from_state(state)

func color_from_state(state):
	return GREEN if state else TRANSPARENT
