extends NinePatchRect

var int_plane = 1

func _process(delta):
	$imagen.texture = load("res://sprites/SelectorPlane/plane"+str(int_plane)+".png")
	#$imagen.texture = load("res")
func _on_iz_pressed():
	int_plane -= 1
	if int_plane < 0:
		int_plane = 2
	


func _on_der_pressed():
	int_plane += 1
	if int_plane > 2:
		int_plane = 1
