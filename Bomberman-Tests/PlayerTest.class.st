Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerlooseLife [

	"Variable pour le player"
	|player|
	
	"On crée le player"
	player := BombermanPlayer new.
	
	"On vérifie que le player a bel et bien 3 vie"
	self assert: player life equals: 3.
	
	"On fait perdre une vie au player"
	player looseOneLife.
	
	"On vérifie que le player a bel et bien perdue une vie"
	self assert: player life equals: 2.
]
