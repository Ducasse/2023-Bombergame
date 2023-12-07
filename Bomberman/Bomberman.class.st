Class {
	#name : #Bomberman,
	#superclass : #Object,
	#category : #Bomberman
}

{ #category : #'instance creation' }
Bomberman class >> open [
	|f c|
	
	c := BlElement new
		             background: Color lightRed;
	
	f: BlSpace new.
	
	f root addChild: c.
	f extent: 1000 @ 1000.
	^ f show.
		
		
]
