extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var velocidad=120

func _physics_process(delta):
	var posicion=Vector2()
	if Input.is_key_pressed(KEY_D):
		posicion+=Vector2(1,0)
	if Input.is_key_pressed(KEY_A):
		posicion-=Vector2(1,0)
	if Input.is_key_pressed(KEY_W):
		posicion+=Vector2(0,-4)
	posicion+=Vector2(0,2)
	#posicion=posicion.normalized()*velocidad
	posicion=posicion*velocidad
	
	move_and_slide(posicion, Vector2(0,-1))
	if posicion.x!=0:
		$AnimatedSprite.animation="caminar"
		$AnimatedSprite.flip_h=posicion.x<0
	else:
		$AnimatedSprite.animation="reposo" 
	
	print(is_on_wall())
	#print(is_on_floor())
	if is_on_wall():
		mostrarMensaje=true
# Called when the node enters the scene tree for the first time
var mostrarMensaje=false
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
