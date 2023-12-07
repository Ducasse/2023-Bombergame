Class {
	#name : #BombermanElement,
	#superclass : #MygAbstractBox,
	#instVars : [
		'background'
	],
	#category : #Bomberman
}

{ #category : #initialization }
BombermanElement class >> configured [ 

	^ self new configured
]

{ #category : #'default encoding' }
BombermanElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #accessing }
BombermanElement >> background [

	^ background
]

{ #category : #accessing }
BombermanElement >> background: anObject [

	background := anObject
]

{ #category : #move }
BombermanElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #accessing }
BombermanElement >> board: aBoard [ 

	super board: aBoard.
	
]

{ #category : #move }
BombermanElement >> bringIn: aSkMovable going: aDirection [
	

	| previousPosition |
	previousPosition := aSkMovable position.
	aSkMovable basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount:
			self board gameManager currentMoveCount + 1 ].
	self board updatePositionOf: aSkMovable from: previousPosition.
	self board atColumn: previousPosition x atRow: previousPosition y put: self . 
	^ true
]

{ #category : #initialization }
BombermanElement >> configured [ 

	^self
]

{ #category : #initialization }
BombermanElement >> defaultBackground [

	^ BombermanGround  new
]

{ #category : #'as yet unclassified' }
BombermanElement >> explose [ 

	^ false.
]

{ #category : #testing }
BombermanElement >> isGround [
	^ false
]

{ #category : #testing }
BombermanElement >> isPlayer [
	^ false
]

{ #category : #testing }
BombermanElement >> isWall [ 
	^ false
]

{ #category : #move }
BombermanElement >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #move }
BombermanElement >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]
