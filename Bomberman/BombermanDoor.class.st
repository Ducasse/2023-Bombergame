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

	anActor containKey 
		ifFalse: [ ^ false ]
	 	ifTrue: [ ^ super bringIn: anActor  going: aDirection  ].
]

{ #category : #testing }
BombermanDoor >> isDoor [ 

	^true.
]
