extends StaticBody2D

export  (int) var velocidad = -300

func _process(delta):
	move_local_x(velocidad*delta)
	
	if global_position.x <= -1200:
		queue_free() #para eliminar la instancia


func _cuerpo_entro(body):
#	if body is RigidBody2D:
#		en_juego = false
	pass
