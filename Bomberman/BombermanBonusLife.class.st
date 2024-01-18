Class {
	#name : #BombermanBonusLife,
	#superclass : #BombermanBonus,
	#category : #Bomberman
}

{ #category : #action }
BombermanBonusLife >> demandOfEffectOfPlayer: anPlayer [

	anPlayer winOneLife.
]

{ #category : #accessing }
BombermanBonusLife >> getType [

	^'BombermanBonusLife'.
]
