Class {
	#name : #SituationTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #accessing }
SituationTest >> map [

^'######
#    #
#@    #
#     #
######'	
]

{ #category : #tests }
SituationTest >> testPlayerIsntOpenDoor [

"Variables pour réaliser les tests "
	| board player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@  #'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	player := board atColumn: 2 atRow: 1.
	
	self assert: player isPlayer equals: true. 	
	
	board atColumn: 3 atRow: 1 put: BombermanDoor new.
	
	self deny: (player move: CpDirection east).
]

{ #category : #tests }
SituationTest >> testPlayerMoveBox [
	
	"Variables pour réaliser les tests "
	| board player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@$#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	"On récupère la position du joueur"
	player := board atColumn: 2 atRow: 1.
	
	"On vérifie que la variable player contient bien un player"
	self assert: player isPlayer.
	
	"On vérifie que le player ne peut pas bouger à droite"
	self deny: (board player move: CpDirection east).
	
	"On vérifie que le joueur n'a pas bougé en x"
	self assert: player position x equals: 2.
	
	"On vérifie que le joueur n'a pas bougé en y"
	self assert: player position y equals: 1.
	
	"On vérifie que la map est correct"
	self assert: board asciiString equals: '#@$#'.
]

{ #category : #move }
SituationTest >> testPlayerMoveGround [

	"On crée les variables utiles pour le test"
	| board player ground|
	
	"On crée le Board"
	board := BombermanBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ #'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
		"On récupère la joueur"
		player := board atColumn: 2 atRow: 1.
		
		"On vérifie que l'on a bien récupéré le joueur"
		self assert: player isPlayer. 
		
		"On bouge le joueur vers la droite en vérifiant que cela est possible"
		self assert: (board player move: CpDirection east).
		
		"On vérifie que le x du player à bien été modifié"
		self assert: board player position x equals: 3.
		
		"On vérifie que le y du player à bien été modifié"
		self assert: board player position y equals: 1.
		
		"On récuère la casde ou se trouvé le joueur avant son déplacement"
		ground := board atColumn: 2 atRow: 1.
	
		"On vérifie que cette case à bien été modifié"
		self assert: ground isGround.
		
		"On vérifie que la map est correct"
		self assert: board asciiString equals: '# @#'.
		
		
]

{ #category : #tests }
SituationTest >> testPlayerMoveWall [

	"Variable utiles pour le test"
	| board position player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '# @#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère le player au cordonnée que nous avons définie"
	player := board atColumn: 3 atRow: 1.
	
	"On vérifie que l'on a bien récupéré le joueur"
	self assert: player isPlayer. 
	
	"On récupère la position du player"
	position := board player position.
	
	"On vérifie qu'il n'est pas possible pour le joueur de se déplacer à droite"
	self deny: (board player move: CpDirection east).
	
	"On vérifie la position de joueur en x"
	self assert: player position x equals: 3.
	
	"On vérifie la position de joueur en y"
	self assert: player position y equals: 1.

	"On vérifie que la map est correct"
	self assert: board asciiString equals: '# @#'.
]

{ #category : #tests }
SituationTest >> testPlayerOrientedBottom [

	"Variable utiles pour le test"
	| board player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: self map
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère le player"
	player := board atColumn: 2 atRow: 3 .
	
	"On vérifie qu'on a bien le player"
	self assert: player isPlayer.
	
	"On vérifie que le player regarde vers le sud"
	self assert: player facing equals: CpSouthDirection.
	
	"On fait bouger le player vers le sud"
	self assert: (player move: CpDirection south).
	
	"On vérifie que le player regarde vers le sud"
	self assert: player facing equals: CpSouthDirection .
]

{ #category : #tests }
SituationTest >> testPlayerOrientedLeft [

	"Variable utiles pour le test"
	| board player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '# @ #'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère le player"
	player := board atColumn: 3 atRow: 1 .
	
	"On vérifie qu'on a bien le player"
	self assert: player isPlayer.
	
	"On vérifie que le player regarde vers le sud"
	self assert: player facing equals: CpSouthDirection.

	"On fait bouger le player vers l'ouest"
	self assert: (player move: CpDirection west).
	
	"On vérifie que le player regarde vers l'ouest"
	self assert: player facing equals: CpWestDirection  .

]

{ #category : #tests }
SituationTest >> testPlayerOrientedRigth [

	"Variable utiles pour le test"
	| board player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@  #'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère le player"
	player := board atColumn: 2 atRow: 1 .
	
	"On vérifie qu'on a bien le player"
	self assert: player isPlayer.
	
	"On vérifie que le player regarde vers le sud"
	self assert: player facing equals: CpSouthDirection.
	
	"On fait bouger le player vers l'est"
	self assert: (player move: CpDirection east).
	
	"On vérifie que le player regarde vers l'est"
	self assert: player facing equals: CpEastDirection .
	
	
]

{ #category : #tests }
SituationTest >> testPlayerOrientedTop [

	"Variable utiles pour le test"
	| board player |
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: self map
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère le player"
	player := board atColumn: 2 atRow: 3 .
	
	"On vérifie qu'on a bien le player"
	self assert: player isPlayer.
	
	"On vérifie que le player regarde vers le sud"
	self assert: player facing equals: CpSouthDirection.
	
	"On fait bouger le player vers le north"
	self assert: (player move: CpDirection north).
	
	"On vérifie que le player regarde vers le north"
	self assert: player facing equals: CpNorthDirection  .
	
	
]

{ #category : #tests }
SituationTest >> testPlayerSetBombe [

	"Variable utiles pour le test"
	| board player bombe|
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@  #'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	"On récupère le player"
	player := board atColumn: 2 atRow: 1 .
	
	"Le joueur pose la bombe où il se trouve"
	bombe := player setBombe.
	
	self assert:  player position equals: bombe position.
]
