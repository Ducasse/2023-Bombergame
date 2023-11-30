Class {
	#name : #BombermanBox,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #move }
BombermanBox >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]
