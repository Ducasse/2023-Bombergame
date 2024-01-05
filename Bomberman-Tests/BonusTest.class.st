Class {
	#name : #BonusTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #'as yet unclassified' }
BonusTest >> testBonusLifeGiveOneLife [

	|bonus player|
	
	bonus := BombermanBonusLife new.
	
	player := BombermanPlayer new.
	
	player looseOneLife.
	
	self assert: player life equals: 3.
	
	player acceptEffectBonus: bonus.
	
	self assert: player life equals: 3.

]

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
	
	self assert: case containBonus equals: false.
	
	case addBonus: bonus.
	
	self assert: case containBonus equals: true.
]

{ #category : #tests }
BonusTest >> testVerifyTypeBonus [ 

	|bonus1|
	
	bonus1 := BombermanBonusLife new.
	
	self assert: bonus1 getType equals: 'BombermanBonusLife'.
]
