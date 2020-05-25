Class {
	#name : #PTASTArguments,
	#superclass : #Object,
	#instVars : [
		'arguments'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTArguments >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ arguments = anObject arguments
]

{ #category : #visiting }
PTASTArguments >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTArguments: self
]

{ #category : #accessing }
PTASTArguments >> arguments [
	^ arguments
]

{ #category : #accessing }
PTASTArguments >> arguments: anObject [
	arguments := anObject
]

{ #category : #comparing }
PTASTArguments >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ arguments hash
]

{ #category : #testing }
PTASTArguments >> isNil [
	"Supposed we have ()"

	arguments size = 2 ifTrue:[^true].
	^false
										

]

{ #category : #testing }
PTASTArguments >> isVoid [
	"Supposed we have (void)"

	arguments size = 6
		ifTrue: [ (arguments at: 2) isV
				ifTrue: [ (arguments at: 3) isO
						ifTrue: [ (arguments at: 4) isI
								ifTrue: [ (arguments at: 5) isD
										ifTrue: [ ^ true ] ] ] ] ].
	^ false
]
