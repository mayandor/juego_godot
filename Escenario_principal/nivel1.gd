extends Node2D
#VARIABLES PARA LA VELOCIDAD DE EL ESCENARIO
var velocidad = Vector2(-500,0)
var vel_ini = velocidad
var offset_initial= Vector2()


#VARIABLES PARA LA VIDA DEL JUGADOR
export var vidas = 4
var offset_vidas = 80

export (PackedScene) var vida
var lista_vidas = []

# Called when the node enters the scene tree for the first time.
func _ready():
	crear_vidas()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		continuar_juego()
		get_node("ParallaxBackground2/Juancito").mensaje.queue_free()
	velocidad.x -= delta/5

func crear_vidas():
	for i in vidas:
		var nueva_vida = vida.instance()
		get_tree().get_nodes_in_group("gui")[0].add_child(nueva_vida)
		nueva_vida.global_position.x += offset_vidas * i
		lista_vidas.append(nueva_vida)
		
func quitar_vida():
	if vidas > 1:
		vidas -= 1
		lista_vidas[vidas].queue_free()
	else:
		get_tree().change_scene("res://GameOver/game_over.tscn")
	
func pausar():
	if get_tree().paused == false:
		get_tree().paused = true
#	else:
#		get_tree().paused = true
func continuar_juego():
	get_tree().paused = false
