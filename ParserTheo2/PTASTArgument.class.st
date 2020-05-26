Class {
	#name : #PTASTArgument,
	#superclass : #Object,
	#instVars : [
		'argument'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTArgument >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ argument = anObject arguments
]

{ #category : #visiting }
PTASTArgument >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTArgument: self
]

{ #category : #accessing }
PTASTArgument >> argument [
	^ argument
]

{ #category : #accessing }
PTASTArgument >> argument: anObject [
	argument := anObject
]

{ #category : #comparing }
PTASTArgument >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ argument hash
]
