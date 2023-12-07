Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerlooseLife [

	|player|
	
	player := BombermanPlayer new.
	
	self assert: player life equals: 3.
	
	player looseOneLife.
	
	self assert: player life equals: 2.
]
