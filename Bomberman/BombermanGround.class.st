Class {
	#name : #BombermanGround,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanGround class >> textualMapCharacter [
	^ Character space
]

{ #category : #testing }
BombermanGround >> isGround [ 
	^true
]

{ #category : #initialization }
BombermanGround >> setKey [ 

	key := true.
	self board setPositionKey: self .
	^true.
]
