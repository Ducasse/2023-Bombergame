Class {
	#name : #BombermanBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
		'boxes',
		'ended'
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

{ #category : #'low level access' }
BombermanBoard >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
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
BombermanBoard >> height [ 
	^ grid height
]

{ #category : #initialization }
BombermanBoard >> initialize [

	super initialize.
	ended := false.
	boxes := OrderedCollection new
]

{ #category : #accessing }
BombermanBoard >> player [ 
	^ player
]

{ #category : #initialization }
BombermanBoard >> setBoxes [

	grid do: [ :each |
		each class = MygSkBox ifTrue: [ self addBox: each ] ].
]

{ #category : #initialization }
BombermanBoard >> setPlayer [

	player := grid contents detect: #isPlayer
]

{ #category : #accessing }
BombermanBoard >> width [ 
	^ grid width
]
