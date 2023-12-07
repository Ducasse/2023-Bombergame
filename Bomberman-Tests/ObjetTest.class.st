Class {
	#name : #ObjetTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #accessing }
ObjetTest >> map [

^'######
#@O$ #
#     #
######'	
]

{ #category : #' tests' }
ObjetTest >> testBombeExploseBox [

	"Variable utile pour les tests"
	|bombe box board ground|
	
	"On crée le board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#O$@#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère la bombe"
	bombe := board atColumn: 2 atRow: 1.
	
	"On récupère la box"
	box := board atColumn: 3 atRow: 1 .
	
	"On fait exploser la bombe sur la box"
	bombe explose: box.
	
	"On récupère la case qui à explosé"
	ground := board atColumn: 3 atRow: 1 .
	
	"On vérifie que la box est bien devenue en Ground"
	self assert: ground isGround.
	
	"On vérifie que la map à bel et bien été modifié"
	self assert: board asciiString equals: '#O @#'.


]

{ #category : #' tests' }
ObjetTest >> testBombeExploseGround [
	
	"Variable utile pour les tests"
	|bombe ground board|
	
	"On crée le board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#O @#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	"On récupère la bombe"
	bombe := board atColumn: 2 atRow: 1 .
	
	"On récupère le ground"
	ground := board atColumn: 3 atRow: 1 .
	
	"On fait exploser la bombe sur le ground"
	bombe explose: ground.
	
	"On récupère le ground après l'explosion"
	ground := board atColumn: 3 atRow: 1 .
	
	"On vérifie que le ground est bien un ground (après l'explosion)"
	self assert: ground isGround.
	
	"On vérifie que la map à bel et bien été modifié"
	self assert: board asciiString equals: '#O @#'.
]

{ #category : #tests }
ObjetTest >> testBombeExploseNeighbors [

	|board bombe droite gauche haut bas|

	board := BombermanBoard  createWithBoard:
						((MygLevelImporter
			          	fromString: self map
			          	fromPackage: BombermanBoard  package) collect: [ :each | each configured ]).
				
	"On récupère la bombe"
	bombe := board atColumn: 3 atRow: 2 .
	
	"On récupère chaque voisin de la bombe"
	droite := board atColumn: 4 atRow: 2 .
	gauche := board atColumn: 2 atRow: 2 .
	haut := board atColumn: 3 atRow: 1 .
	bas := board atColumn: 3 atRow: 3 .
	
	"On vérifie la nature des voisins de la bombe"
	self assert: bas isGround.
	self assert: haut isWall.
	self assert: droite isBox.
	self assert: gauche isPlayer.
	
	"La bombe explose sur ses voisins"
	bombe exploseNeighbors.
	
	"On récupère chaque voisin de la bombe"
	droite := board atColumn: 4 atRow: 2 .
	gauche := board atColumn: 2 atRow: 2 .
	haut := board atColumn: 3 atRow: 1 .
	bas := board atColumn: 3 atRow: 3 .

	"On vérifie que tout a bel et bien été modifié"
	self assert: bas isGround.
	self assert: haut isWall.
	self assert: droite isGround.
	self assert: gauche isPlayer.


]

{ #category : #' tests' }
ObjetTest >> testBombeExplosePlayer [

	"Variable utile pour les tests"
	|player bombe board|
	
	"On crée le board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#O@#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère la bombe"
	bombe := board atColumn: 2 atRow: 1 .
	
	"On récupère le player"
	player := board atColumn: 3 atRow: 1 .

	self assert: player life equals: 3.
	
	bombe explose: player.
	
	self assert: player life equals: 2.

	"On vérifie que la map à bel et bien été modifié"
	self assert: board asciiString equals: '#O@#'.


]

{ #category : #' tests' }
ObjetTest >> testBombeExploseWall [

	"Variable utile pour les tests"
	|bombe wall board|
	
	"On crée le board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@O#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	"On récupère la bombe"
	bombe := board atColumn: 3 atRow: 1 .
	
	"On récupère le wall"
	wall := board atColumn: 4 atRow: 1 .
	
	"On fait exploser la bombe sur le wall"
	bombe explose: wall.

	"On récupère le wall après l'explosion"
	wall := board atColumn: 4 atRow: 1 .

	"On vérifie que le wall est bien un wall (après l'explosion)"
	self assert: wall isWall.
	
	"On vérifie que la map à bel et bien été modifié"
	self assert: board asciiString equals: '#@O#'.







]
