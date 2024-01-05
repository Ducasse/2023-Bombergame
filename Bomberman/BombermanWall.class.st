Class {
	#name : #BombermanWall,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanWall class >> textualMapCharacter [ 

	^ $#
]

{ #category : #'as yet unclassified' }
BombermanWall >> backgroundPaint [ 
	^ Color black.
]

{ #category : #move }
BombermanWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]

{ #category : #testing }
BombermanWall >> isWall [
	^ true
]
