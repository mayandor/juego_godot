extends ParallaxBackground
var parallax_offset= Vector2()  # velocidad en la que se mueve el background
var velocidad = Vector2(-300, 0)
#func _ready():
#	get_node("ParallaxLayer/fondo").set_position(Vector2(0,60))
	
func _process(delta):
	parallax_offset -= velocidad * -delta
	
	set_scroll_offset(parallax_offset)

