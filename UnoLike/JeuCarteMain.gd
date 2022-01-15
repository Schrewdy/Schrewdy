extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var CardScene = preload("res://Card.tscn");
var Main : Array;
var IsIA : bool;
onready var a = get_viewport().get_size();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# On retire la premiere carte de la pioche, on renvoie l'état 
# de la nouvelle pioche pour l'update dans le jeu
func ActionPiocher(Pioche : Array) -> Array:
	Main.push_back(Pioche.pop_front());
	return Pioche;

# On enleve la carte de la main du joueur et celle ci est renvoyée 
# pour indiquer le changement à faire pour l'affichage
func ActionJouerCarte(Carte : Array) -> Array:
	Main.erase(Carte);
	return Carte;

func _ActionIA(CarteJeu : Array):
	# L'ia doit chercher les cartes compatibles avant de vouloir jouer les +4
	# Si elle ne peut rien jouer, elle cherche les +4
	# Si elle n'en a pas, alors elle pioche
	# a override dans la classe enfant de celle ci
	pass
	

func UpdateAffichageMain():
	return;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
