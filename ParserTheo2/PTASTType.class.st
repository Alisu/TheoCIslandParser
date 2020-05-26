Class {
	#name : #PTASTType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTType >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ type = anObject type
]

{ #category : #visiting }
PTASTType >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTType: self
]

{ #category : #comparing }
PTASTType >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ type hash
]

{ #category : #accessing }
PTASTType >> type [
	^ type
]

{ #category : #accessing }
PTASTType >> type: anObject [
	type := anObject
]
