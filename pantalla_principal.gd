extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_comenzar_pressed():
	get_tree().change_scene("res://Escenario_principal/nivel1.tscn")


func _on_salir_pressed():
	get_tree().quit()
