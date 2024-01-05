Class {
	#name : #BombermanVision,
	#superclass : #Object,
	#category : #Bomberman
}

{ #category : #'as yet unclassified' }
BombermanVision >> coloringElement: anElement to: anSpace [
	
	|element|
	
	 element := BlElement new background: anElement backgroundPaint.
	^element.

	

	
]
