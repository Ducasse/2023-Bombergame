Class {
	#name : #BombermanPlayer,
	#superclass : #BombermanElement,
	#instVars : [
		'facing',
		'life'
	],
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
BombermanPlayer >> backgroundPaint [ 
	^ Color blue.
]

{ #category : #actions }
BombermanPlayer >> explose [
	self looseOneLife
]

{ #category : #accessing }
BombermanPlayer >> facing [ 
	^facing
]

{ #category : #accessing }
BombermanPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #accessing }
BombermanPlayer >> getKey [ 

	^key
]

{ #category : #initialization }
BombermanPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection.
	life := 3.
	key := false.
]

{ #category : #testing }
BombermanPlayer >> isPlayer [ 
^ true
]

{ #category : #accessing }
BombermanPlayer >> life [ 
	^life
]

{ #category : #actions }
BombermanPlayer >> looseOneLife [
	life := life - 1 .
]

{ #category : #move }
BombermanPlayer >> move: aCpDirection [
	
	self facing: aCpDirection class.
	^ super move: aCpDirection
]

{ #category : #initialization }
BombermanPlayer >> setBombe [

	|  bombLocation bomb |
	
	bombLocation := self position.
   bomb := BombermanBombe new .
	
	self board atColumn: bombLocation x atRow: bombLocation y put: bomb.
	bomb position: bombLocation. 
	
	^bomb.
	

]

{ #category : #initialization }
BombermanPlayer >> setKey [ 

	key := true.
]

{ #category : #initialization }
BombermanPlayer >> setKey: anObject [ 

	anObject isKey ifTrue: [ key := true ] .
]

{ #category : #actions }
BombermanPlayer >> winOneLife [

	life<3 ifTrue: [life := life+1].
]
