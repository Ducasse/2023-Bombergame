Class {
	#name : #BombermanDoor,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanDoor class >> textualMapCharacter [
	^ $D.
]

{ #category : #move }
BombermanDoor >> bringIn: anActor going: aDirection [

	anActor containKey ifFalse: [ ^ false ].
	anActor containKey ifTrue: [ ^ super bringIn: anActor  going: aDirection  ].
]

{ #category : #initialization }
BombermanDoor >> initialize [ 

	super initialize.
]
