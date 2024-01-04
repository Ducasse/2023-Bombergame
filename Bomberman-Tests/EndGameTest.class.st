Class {
	#name : #EndGameTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #' tests' }
EndGameTest >> testDoorFinalCreated [ 

	|door board|
	
	"On crée le board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#O$@#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	"On place la porte sur le board (de manière aléatoire)"
	door := board setFinalDoor.
	
	"On vérifie que les coordonnées de la porte soit bien sur le board"
	self assert: door position x <= board width.
	self assert: door position y <= board height.
]

{ #category : #' tests' }
EndGameTest >> testPlayerWin [ 

	"Variables pour réaliser les tests "
	| board player key door|
	
	"On crée le Board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@D #'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	player := board atColumn: 2 atRow: 1.
	
	door := board atColumn: 3 atRow: 1.
	
	self assert: player isPlayer equals: true. 
	
	self assert: door isDoor.
	
	key := BombermanKey new.
	
	player setKey: key.
	
	self assert: (board player move: CpDirection east).
	
	self assert: player position equals: door position.
	
	
]
