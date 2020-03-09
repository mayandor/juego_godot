extends Area2D
# movimiento del jugador
#var posicion = Vector2(50, 400)
onready var main = get_node("/root/Main")

var posicion = position
var piso = posicion
var gravedad = 4000
var velocidad = Vector2()
var vel_salto = -1200
var modificador_gravedad = 2.3

# Variables para la aparicion de los enemigos
var tiempo = 0.0
var intervalo = 3
var intervalo_min = 0.5
var intervalo_max = 3
var obstaculo = [preload("res://Enemigos/Bala.tscn"),
				preload("res://Enemigos/TNT.tscn"),
				preload("res://Enemigos/Roca.tscn")
				]
var mensaje = preload("res://Preguntas/pregunta.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AnimatedSprite.animation = "caminando"
	set_position(piso)
	
func _physics_process(delta):
	#para la aparicion de los obstaculos
	tiempo += delta
	
	if tiempo >= intervalo:
		tiempo = 0
		var c = rand_range(0, obstaculo.size())
		get_parent().add_child(obstaculo[c].instance())
		#selecionar intervalo de aparicion de obstaculos
		intervalo = rand_range(intervalo_min, intervalo_max)
	
	#para los movimientos del jugador
	if Input.is_action_pressed("ui_up"):
		velocidad.y += gravedad * delta
	else:
		velocidad.y += gravedad * delta * modificador_gravedad
	
	if Input.is_action_just_pressed("ui_up") and position == piso:
		velocidad.y = vel_salto
	
	position += velocidad * delta
	
	if get_position().y > piso.y:
		set_position(piso)
		velocidad = Vector2()
		
func choca():
	$AnimatedSprite.animation = "lastimado"
	#get_parent().add_child(mensaje.instance())
	
	#main.pausar()
	
	
func estado_normal():
	$AnimatedSprite.animation = "caminando"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
