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
PTASTArguments >> argument [
	^ argument
]

{ #category : #accessing }
PTASTArguments >> argument: anObject [
	argument := anObject
]

{ #category : #accessing }
PTASTArguments >> argumentChain [
	^ argumentChain
]

{ #category : #accessing }
PTASTArguments >> argumentChain: anObject [
	argumentChain := anObject
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
