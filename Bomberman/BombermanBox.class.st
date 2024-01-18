Class {
	#name : #BombermanBox,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #accessing }
BombermanBox >> backgroundPaint [ 
	^ Color brown.
]

{ #category : #move }
BombermanBox >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]

{ #category : #accessing }
BombermanBox >> explose [ 
	
	|previousPosition|

	previousPosition := self position.
	self board atColumn: previousPosition x atRow: previousPosition y put: BombermanGround new .
]

{ #category : #testing }
BombermanBox >> isBox [ 
	^ true
]

{ #category : #initialization }
BombermanBox >> setKey [ 

	key := true.
	self board setPositionKey: self .
	^true.
]
