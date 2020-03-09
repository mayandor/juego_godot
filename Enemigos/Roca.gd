extends Area2D

onready var juancito = get_parent().get_node("Juancito")
onready var main = get_node("/root/Main")
var piso = position
var velocidad = Vector2(-500, 0)
var tiempo_vida = 5


func _ready():
	set_position(piso)
	
func _physics_process(delta):
	set_position(position + delta * velocidad)
	tiempo_vida -= delta
	
	if tiempo_vida <= 0:
		queue_free()
 
func _on_roca_area_entered(area):
	if area.name == "Juancito":
		juancito.choca()
		main.quitar_vida()
		print("murio")
		hide() #desaparxca la bala


func _on_roca_area_exited(area):
	if area.name == "Juancito":
		juancito.estado_normal()
