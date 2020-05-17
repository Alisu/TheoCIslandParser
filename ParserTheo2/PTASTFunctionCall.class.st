Class {
	#name : #PTASTFunctionCall,
	#superclass : #Object,
	#instVars : [
		'functionCall'
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
	^ functionCall = anObject functionCall
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

{ #category : #accessing }
PTASTFunctionCall >> functionCall [
	^ functionCall
]

{ #category : #accessing }
PTASTFunctionCall >> functionCall: anObject [
	functionCall := anObject
]

{ #category : #comparing }
PTASTFunctionCall >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ functionCall hash
]

{ #category : #accessing }
PTASTFunctionCall >> identifier [
	^ identifier
]

{ #category : #accessing }
PTASTFunctionCall >> identifier: anObject [
	identifier := anObject
]
