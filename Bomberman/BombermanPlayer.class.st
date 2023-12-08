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

{ #category : #'as yet unclassified' }
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

{ #category : #initialization }
BombermanPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection.
	life := 3.
]

{ #category : #testing }
BombermanPlayer >> isPlayer [ 
^ true
]

{ #category : #accessing }
BombermanPlayer >> life [ 
	^life
]

{ #category : #'as yet unclassified' }
BombermanPlayer >> looseOneLife [
	life := life - 1 .
]

{ #category : #move }
BombermanPlayer >> move: aCpDirection [
	
	self facing: aCpDirection class.
	^ super move: aCpDirection
]

{ #category : #initialization }
BombermanPlayer >> setBombe [ [
	| bombLocation bomb |

    bombLocation := self position.
    bomb := BombermanBombe new at: bombLocation.
    self board atColumn: bombLocation x atRow: bombLocation y put: bomb.

    "Return true to indicate the bomb has been successfully set."
    ^ true
]

]
