Class {
	#name : #SituationTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #move }
SituationTest >> testPlayerMoveGround [

	| board position player |
	
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ #'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
		
		player := board atColumn: 3 atRow: 1.
		position := board player position.
		
		self assert: (board player move: CpDirection east).
		
		self assert: board player position x equals: (CpDirection east * position) x.
		
		self assert: board player position y equals: (CpDirection east * position) y.
		
		self assert: player position x equals: 3.
		
		self assert: board asciiString equals: '# @#'.
		
		
]
