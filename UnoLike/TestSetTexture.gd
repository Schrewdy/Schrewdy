extends Node2D

var CardScene : PackedScene = preload("res://Card.tscn");
var texture2D_1 : Texture = preload("res://pngs/Yellow256.png");
var texture2D_2 : Texture = preload("res://pngs/Red256.png");


func _ready():
	var texture : Texture ;
	for i in range(30):
		var a : Node = CardScene.instance();
		a.position = Vector2(randi() % 1280, randi() % 720);
		if i % 2:
			texture = texture2D_1;
		else:
			texture = texture2D_2;
		a.get_node("Area2D/CollisionShape2D/Sprite").set_texture(texture);
		add_child(a);
	pass 


