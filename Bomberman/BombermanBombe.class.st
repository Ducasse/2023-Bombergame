Class {
	#name : #BombermanBombe,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanBombe class >> textualMapCharacter [
	^ $O
]

{ #category : #'as yet unclassified' }
BombermanBombe >> explose: anElement [

	anElement explose.
]

{ #category : #'as yet unclassified' }
BombermanBombe >> exploseNeighbors [
	
	|positionBombe|
	
	positionBombe := self position.
	
	self explose: (self board atColumn: positionBombe x+1 atRow: positionBombe y).
	self explose: (self board atColumn: positionBombe x-1 atRow: positionBombe y).
	self explose: (self board atColumn: positionBombe x atRow: positionBombe y+1).
	self explose: (self board atColumn: positionBombe x atRow: positionBombe y-1).
]
