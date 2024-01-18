Class {
	#name : #BombermanVision,
	#superclass : #Object,
	#category : #Bomberman
}

{ #category : #action }
BombermanVision >> coloringElement: anElement to: anSpace [
	
	|element|
	
	 element := BlElement new background: anElement backgroundPaint.
	^element.

	

	
]
