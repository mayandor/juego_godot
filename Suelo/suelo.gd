extends StaticBody2D

export  (int) var velocidad = -200

func _process(delta):
	move_local_x(velocidad*delta)
	
	if global_position.x <= -1655:
		global_position.x = -1655 + 1000 * 2
