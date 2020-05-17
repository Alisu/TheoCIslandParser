Class {
	#name : #PTASTEndStatement,
	#superclass : #Object,
	#instVars : [
		'endStatement'
	],
	#category : #'ParserTheo-AST'
}

{ #category : #comparing }
PTASTEndStatement >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ endStatement = anObject endStatement
]

{ #category : #visiting }
PTASTEndStatement >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTEndStatement: self
]

{ #category : #accessing }
PTASTEndStatement >> endStatement [
	^ endStatement
]

{ #category : #accessing }
PTASTEndStatement >> endStatement: anObject [
	endStatement := anObject
]

{ #category : #comparing }
PTASTEndStatement >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ endStatement hash
]
