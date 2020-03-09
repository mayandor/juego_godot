extends Node2D


func _ready():
	$Panel/ItemList.add_item("OPCION 1")
	$Panel/ItemList.add_item("OPCION 2")
	$Panel/ItemList.add_item("OPCION 3")


func _on_Button_pressed():
	queue_free()
	
