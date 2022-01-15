extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start();
	pass # Replace with function body.

#valeur_importante : décalage en x = multiple de 200
#					 décalage en y = 285
#					 width standard = 173
#					 height standard = 275
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_region_rect(Rect2(200.0 * (randi() % 9), 285.0 * (randi() % 4), 173.0, 275.0));
	pass # Replace with function body.
