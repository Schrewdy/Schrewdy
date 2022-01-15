extends Node2D

var CardScene = preload("res://Card.tscn");

var JoueurArray : Array; # Contient les joueurs qui sont encore en jeu
var Pioche : Array = [[]]; # Contient toutes les cartes au début de la partie
var MainJoueur : Array; # Sera afficher en bas de l'écran
var Jeu : Array; # La ou les cartes sont posée, au centre de l'écran,
#  uniquement la derniere carte posée est affiché
var MainIA_1 : Array;
var MainIA_2 : Array;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	GenerateDeck();
#	
	initGame();
	$Timer.start();
	# Au tout debut il faudra générer un paquet en ballayant toute les couleurs possible 
	# avec tout les num possible
	# Il faudra tout stocker dans un array
	# le tas de jeu sera un autre array
	
	return; # Replace with function body.

func initGame() -> void:
	GenerateDeck();
	FirstDistrib(7);
	UpdateAfficageJeu();
#	randomize();
#	for s in range(Pioche.size()):
#		var b;
#		b = CardScene.instance();
#		b.position = Vector2(500, 320);
#		b.Number_value = Pioche[s][0];
#		b.Color_index =  Pioche[s][1];
#		add_child(b);
	return;

func GenerateDeck() -> void:
	var ColonneAtlas : int = 13;
	var LigneAtlas : int = 4;
	for k in range(LigneAtlas):		
		for i in range(ColonneAtlas):
			Pioche[i + k * ColonneAtlas] = [i,k];
			Pioche.append([[]]);
	Pioche.pop_back()
	Pioche.append_array(Pioche); # toute les cartes classique en double
	
	for _i in range(8):
		Pioche.append_array([[1,4]]) # On rajoute les cartes spécial qui ne rentre pas dans la loop (+4)
	
	randomize();
	Pioche.shuffle(); # melange du paquet
	$PiocheCarte.AffichageCarte(0,4);
	return;

# a tester
func RechargeDeck() -> void:
	var Recharge : Array = [];
	for _i in range(Jeu.size() - 1):
		Recharge.push_back(Jeu.pop_back());
	Recharge.shuffle();
	Pioche.append_array(Recharge);
	return;

func JoueurPioche(Main : Array, NbCartes : int) -> Array:
	for _i in range(NbCartes):
		if Pioche.size() <= 1 and Jeu.size() > 1:
			RechargeDeck();
		elif Pioche.size() == 0 and Jeu.size() == 1:
			# le joueur ne peut pas piocher car il n'y a plus de Pioche 
			# et que le jeu ne possede qu'une carte :(
			break;
		if Pioche.size() > 0: # necessaire le if ?
			# Gerer dans la classe JeuCarteMain
#			Main.push_back(Pioche.pop_front());
			Main
	return Main;

func FirstDistrib(NbCartes : int) -> void:
	# Distribution de NbCartes au joueurs
	for _k in range(NbCartes):
		MainJoueur = JoueurPioche(MainJoueur, 1);
		MainIA_1 = JoueurPioche(MainIA_1, 1);
		MainIA_2 = JoueurPioche(MainIA_2, 1);
	
	# premiere carte qui apparaitra au centre
	Jeu.push_front(Pioche.pop_front());
	return;

# Gerer dans la classe JeuCarteMain
#func JouerCarte(Main : Array, Carte : Array) -> Array:
#	Main.erase(Carte);
#	Jeu.push_front(Carte);
#	return Main;

func UpdateAfficageJeu() -> void:
	# Il faut juste changer l'affichage de la carte présente au milieu
	$JeuCarte.AffichageCarte(Jeu[0][0], Jeu[0][1]);	
	return;

func _on_Timer_timeout():
	if MainJoueur.size() > 0:
		MainJoueur = JoueurPioche(MainJoueur, 4);
		MainJoueur = JouerCarte(MainJoueur, MainJoueur[0]);
		UpdateAfficageJeu();
	else:
		print(Jeu);
	pass # Replace with function body.
