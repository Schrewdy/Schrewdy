class_name Card
extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Liste des 4 couleurs possible de carte
# A mettre dans le main

# a garder dans le script de la carte
#var Number_value : int;
#var Color_index : int;

const CardHeight : float = 257.0; #default 257.0
const CardWidth : float = 173.0; #default 173.0
const HorizontalPadding : float = 200.0; #default 200.0
const VerticalPadding : float = 285.0; #default 285.0

func _init():
	return

# Called when the node enters the scene tree for the first time.
func _ready():
#	Number_value = 1;
#	Color_index = 4;
#	
	pass # Replace with function body.
## But du jeu est de générer dynamiquement les valeurs des cartes ainsi que 
## leurs visuel en fonction des champs CardColor et Number
## CardColor sera fait avec du Shader 
## Et number sera écrit dans la zone de texte

func AffichageCarte(Number_value : int, Color_index : int) -> void:
	$Sprite.set_region_rect(Rect2(HorizontalPadding * Number_value, VerticalPadding * Color_index, CardWidth, CardHeight));
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

