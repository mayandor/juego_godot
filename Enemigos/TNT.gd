extends Area2D

onready var juancito = get_parent().get_node("Juancito")
onready var main = get_node("/root/Main")
var piso = position
var velocidad = Vector2(-300, 0)
var tiempo_vida = 5


func _ready():
	$AnimatedSprite.animation = "sin_explotar"
	$AnimatedSprite.scale.x = 0.264
	$AnimatedSprite.scale.y = 0.258
	set_position(piso)
	
func _physics_process(delta):
	set_position(position + delta * velocidad)
	tiempo_vida -= delta
	
	if tiempo_vida <= 0:
		queue_free()
 
func _on_tnt_area_entered(area):
	if area.name == "Juancito":
		$AnimatedSprite.animation = "explosion"
		$AnimatedSprite.scale.x = 2.209
		$AnimatedSprite.scale.y = 2.821

		juancito.choca()
		main.quitar_vida()
		print("murio")
		#hide() #desaparxca la bala
	


func _on_tnt_area_exited(area):
	if area.name == "Juancito":
		juancito.estado_normal()
