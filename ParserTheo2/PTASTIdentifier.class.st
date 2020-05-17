Class {
	#name : #PTASTIdentifier,
	#superclass : #Object,
	#instVars : [
		'identifier'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTIdentifier >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ identifier = anObject identifier
]

{ #category : #visiting }
PTASTIdentifier >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIdentifier: self
]

{ #category : #comparing }
PTASTIdentifier >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ identifier hash
]

{ #category : #accessing }
PTASTIdentifier >> identifier [
	^ identifier
]

{ #category : #accessing }
PTASTIdentifier >> identifier: anObject [
	identifier := anObject
]
