Class {
	#name : #PTASTFunctionCall,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'identifier'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTFunctionCall >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ identifier = anObject identifier
		and: [ arguments = anObject arguments ]
]

{ #category : #visiting }
PTASTFunctionCall >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTFunctionCall: self
]

{ #category : #accessing }
PTASTFunctionCall >> arguments [
	^ arguments
]

{ #category : #accessing }
PTASTFunctionCall >> arguments: anObject [
	arguments := anObject
]

{ #category : #comparing }
PTASTFunctionCall >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ identifier hash bitXor: arguments hash
]

{ #category : #accessing }
PTASTFunctionCall >> identifier [
	^ identifier
]

{ #category : #accessing }
PTASTFunctionCall >> identifier: anObject [
	identifier := anObject
]

{ #category : #testing }
PTASTFunctionCall >> isD [
	^ false
]

{ #category : #testing }
PTASTFunctionCall >> isI [
	^ false
]

{ #category : #testing }
PTASTFunctionCall >> isO [
	^ false
]

{ #category : #testing }
PTASTFunctionCall >> isV [
	^ false
]
