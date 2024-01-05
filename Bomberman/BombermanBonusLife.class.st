Class {
	#name : #BombermanBonusLife,
	#superclass : #BombermanBonus,
	#category : #Bomberman
}

{ #category : #'as yet unclassified' }
BombermanBonusLife >> demandOfEffectOfPlayer: anPlayer [

	anPlayer winOneLife.
]

{ #category : #accessing }
BombermanBonusLife >> getType [

	^'BombermanBonusLife'.
]
