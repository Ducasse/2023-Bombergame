Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerHaveKey [

	|player key|
	
	"On crée le player"
	player := BombermanPlayer new.
	
	"On crée la clé"
	key := BombermanKey new.
	
	"On vérifie que le player ne posséde pour le moment pas de clé"
	self assert: player getKey equals: false.
	
	"On donne au player la clé"
	player setKey: key.

	"On vérifie que le player posséde une clé"
	self assert: player getKey equals: true.
]

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
