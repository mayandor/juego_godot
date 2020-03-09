extends ParallaxLayer


#var parallax_offset= Vector2()  # velocidad en la que se mueve el background

#func _ready():
#	get_node("ParallaxLayer/fondo").set_position(Vector2(0,60))
	
#func _process(delta):
#	parallax_offset -= get_node("/root/Main").velocidad * -delta
	
#	set_scroll_offset(parallax_offset)

var speed = -400  # velocidad en la que se mueve el background

func _process(delta):
	get_parent().scroll_offset.x += speed * delta #obtiene el nodo padre y se movera a la izquierda
