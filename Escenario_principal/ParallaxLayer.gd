extends ParallaxLayer
var speed = -200  # velocidad en la que se mueve el background

func _process(delta):
	get_parent().scroll_offset.x += speed * delta #obtiene el nodo padre y se movera a la izquierda
