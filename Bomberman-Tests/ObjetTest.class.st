Class {
	#name : #ObjetTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

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

{ #category : #' tests' }
ObjetTest >> testBombeExploseWall [

	|bombe wall|
	
	bombe := BombermanBombe new.
	wall := BombermanWall new.
	
	 self deny: bombe explose: wall.
	
	
]
