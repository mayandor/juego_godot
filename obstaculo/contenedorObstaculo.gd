extends Node2D

var obstaculo = load("res://obstaculo/Obstaculo.tscn")

func _process(delta):
	if $"tiempo_de _generacion".is_stopped():
		crear_obstaculo()
		$"tiempo_de _generacion".start()
		
func crear_obstaculo():
	var nuevo_obstaculo = obstaculo.instance()
	nuevo_obstaculo.global_position = Vector2(1000, 0)
	add_child(nuevo_obstaculo)
