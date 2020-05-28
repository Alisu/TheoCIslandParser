Class {
	#name : #PTASTArgumentsCall,
	#superclass : #Object,
	#instVars : [
		'arguments'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTArgumentsCall >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ arguments = anObject arguments
]

{ #category : #visiting }
PTASTArgumentsCall >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTArgumentsCall: self
]

{ #category : #accessing }
PTASTArgumentsCall >> arguments [
	^ arguments
]

{ #category : #accessing }
PTASTArgumentsCall >> arguments: anObject [
	arguments := anObject
]

{ #category : #comparing }
PTASTArgumentsCall >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ arguments hash
]

{ #category : #testing }
PTASTArgumentsCall >> isNull [
	"Supposed we have ()"

	arguments size = 2 ifTrue:[^true].
	^false
										

]

{ #category : #testing }
PTASTArgumentsCall >> isVoid [
	"Supposed we have (void)"

	arguments size = 6
		ifTrue: [ (arguments at: 2) isV
				ifTrue: [ (arguments at: 3) isO
						ifTrue: [ (arguments at: 4) isI
								ifTrue: [ (arguments at: 5) isD
										ifTrue: [ ^ true ] ] ] ] ].
	^ false
]
