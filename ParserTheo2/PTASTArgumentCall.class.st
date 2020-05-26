Class {
	#name : #PTASTArgumentCall,
	#superclass : #Object,
	#instVars : [
		'argument'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTArgumentCall >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ argument = anObject argument
]

{ #category : #visiting }
PTASTArgumentCall >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTArgument: self
]

{ #category : #accessing }
PTASTArgumentCall >> argument [
	^ argument
]

{ #category : #accessing }
PTASTArgumentCall >> argument: anObject [
	argument := anObject
]

{ #category : #comparing }
PTASTArgumentCall >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ argument hash
]
