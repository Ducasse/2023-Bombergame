Class {
	#name : #BonusTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #' tests' }
BonusTest >> testCaseContainBonus [

	|board bonus case|
	
	"On crée le board"
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: '#  @#'
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
		
	bonus := BombermanBonusLife new. 
	
	case := board atColumn: 2 atRow: 1.
	
	self deny: case containBonus.
]
