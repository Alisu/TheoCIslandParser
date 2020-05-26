Class {
	#name : #PTASTFunctionDeclaration,
	#superclass : #Object,
	#instVars : [
		'type',
		'identifier',
		'arguments',
		'endStatement'
	],
	#category : #ParserTheo2
}

{ #category : #comparing }
PTASTFunctionDeclaration >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^  ((type = anObject type
		and: [ arguments = anObject arguments ])
		and: [ identifier = anObject fonctionPointer ])
		and: [ endStatement  = anObject endStatement ]
]

{ #category : #visiting }
PTASTFunctionDeclaration >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTFunctionDeclaration: self
]

{ #category : #accessing }
PTASTFunctionDeclaration >> arguments [
	^ arguments
]

{ #category : #accessing }
PTASTFunctionDeclaration >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
PTASTFunctionDeclaration >> endStatement [
	^ endStatement
]

{ #category : #accessing }
PTASTFunctionDeclaration >> endStatement: anObject [
	endStatement := anObject
]

{ #category : #comparing }
PTASTFunctionDeclaration >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ ((type hash bitXor: identifier hash)bitXor: arguments) bitXor: endStatement 
]

{ #category : #accessing }
PTASTFunctionDeclaration >> identifier [
	^ identifier
]

{ #category : #accessing }
PTASTFunctionDeclaration >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
PTASTFunctionDeclaration >> type [
	^ type
]

{ #category : #accessing }
PTASTFunctionDeclaration >> type: anObject [
	type := anObject
]
