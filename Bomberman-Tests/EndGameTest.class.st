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
