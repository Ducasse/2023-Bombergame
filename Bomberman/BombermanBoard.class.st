Class {
	#name : #BombermanBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
		'boxes',
		'ended',
		'gameManager',
		'positionKey'
	],
	#category : #Bomberman
}

{ #category : #initialization }
BombermanBoard class >> createWithBoard: aCTNewArray2D [

	^ self new
		  configureGrid: aCTNewArray2D;
		  yourself
]

{ #category : #'as yet unclassified' }
BombermanBoard class >> importFromString: aString [
	|tmp|
	tmp := MygLevelImporter fromString: aString fromPackage: self package.
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #initialization }
BombermanBoard >> addBox: aBox [
	boxes add: aBox

]

{ #category : #printing }
BombermanBoard >> asciiString [ 

	^ String streamContents: [ :st |
		self printOn: st ]	
]

{ #category : #'low level access' }
BombermanBoard >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #'low level access' }
BombermanBoard >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
BombermanBoard >> atPosition: aCpPositionable [ 
	^ (grid at: aCpPositionable x @ aCpPositionable y)
]

{ #category : #accessing }
BombermanBoard >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setBoxes;
		setPlayer
]

{ #category : #accessing }
BombermanBoard >> gameManager [ 
	
	^ gameManager 
]

{ #category : #accessing }
BombermanBoard >> gameManager: aSkGameManager [

	gameManager:= aSkGameManager
]

{ #category : #accessing }
BombermanBoard >> getPositionKey [

	^positionKey.
]

{ #category : #accessing }
BombermanBoard >> height [ 
	^ grid height
]

{ #category : #initialization }
BombermanBoard >> initialize [

	super initialize.
	ended := false.
	boxes := OrderedCollection new.
]

{ #category : #testing }
BombermanBoard >> isFinished [ 
 ^false
]

{ #category : #accessing }
BombermanBoard >> player [ 
	^ player
]

{ #category : #printing }
BombermanBoard >> printOn: aStream [

	(1 to: grid height)
		do: [ :rowNumber |
			1 to: grid width do: [ :columnNumber |
				| el elClass |
				el := self atColumn: columnNumber atRow: rowNumber .
				elClass := (el class inheritsFrom: MygSkMovable)
					           ifFalse: [ el class ]
					           ifTrue: [
						           el background class = MygSkGround
							           ifTrue: [ el class ]
							           ifFalse: [ (el class asString , 'OnTarget') asClass ] ].
				aStream nextPut: elClass textualMapCharacter ] ]
		separatedBy: [ aStream cr ]
]

{ #category : #initialization }
BombermanBoard >> setBoxes [

	grid do: [ :each |
		each class = MygSkBox ifTrue: [ self addBox: each ] ].
]

{ #category : #initialization }
BombermanBoard >> setFinalDoor [ 

	|door randx randy pos|
	
	door := BombermanDoor new.
	
	randx := (1 to: self width) atRandom.
	randy := (1 to: self height) atRandom.
	
	self atColumn: randx  atRow: randy put: door.
	
	pos := (randx@randy).
	
	door position: pos. 
	
	^door.
]

{ #category : #initialization }
BombermanBoard >> setKey [

	|randx randy case|
	
	randx := (1 to: self width) atRandom.
	randy := (1 to: self height) atRandom.
	
	case := self atColumn: randx  atRow: randy.
	
	case setKey.
	 
]

{ #category : #initialization }
BombermanBoard >> setPlayer [

	player := grid contents detect: #isPlayer
]

{ #category : #initialization }
BombermanBoard >> setPositionKey: posKey [  

	positionKey := posKey.
]

{ #category : #move }
BombermanBoard >> updatePositionOf: aSkMovable from: previousPosition [
	"Put back the previous position element."

	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aSkMovable background.
	
	"put the current position element as previous background of the moving element."
	aSkMovable background:
		(self atColumn: aSkMovable position x atRow: aSkMovable position y).
	
	"finally place the moving element to its new location"
	self
		atColumn: aSkMovable position x
		atRow: aSkMovable position y
		put: aSkMovable.
	self isFinished ifTrue: [ self endGame ]
]

{ #category : #accessing }
BombermanBoard >> width [ 
	^ grid width
]
