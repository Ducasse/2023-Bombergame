Class {
	#name : #BombermanEvent,
	#superclass : #BlElement,
	#category : #Bomberman
}

{ #category : #accessing }
BombermanEvent >> downEvent [ 

	CommandLineUIManager default alert: 'DOWN SELECTED'.
]

{ #category : #initialization }
BombermanEvent >> initialize [ 

	super initialize.
	
	self addEventHandlerOn: BlKeyDownEvent  do: [ : anEvent | self manageEvent: anEvent ] 
]

{ #category : #initialization }
BombermanEvent >> manageEvent: anEvent [ 

anEvent key name = #SPACE ifTrue: [ ^self spaceEvent].

anEvent key name = #UP ifTrue: [ ^self upEvent ].

anEvent key name = #DOWN ifTrue: [ ^self downEvent ].
	
]

{ #category : #accessing }
BombermanEvent >> spaceEvent [

	CommandLineUIManager default alert: 'SPACE SELECTED'.
]

{ #category : #accessing }
BombermanEvent >> upEvent [

	CommandLineUIManager default alert: 'UP SELECTED'.
]
