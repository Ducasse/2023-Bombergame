Class {
	#name : #BombermanPlayer,
	#superclass : #BombermanElement,
	#instVars : [
		'facing'
	],
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
BombermanPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #initialization }
BombermanPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection
]

{ #category : #testing }
BombermanPlayer >> isPlayer [ 
^ true
]

{ #category : #move }
BombermanPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	^ super move: aCpDirection
]
