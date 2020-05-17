Class {
	#name : #PTASTArgumentChain,
	#superclass : #Object,
	#instVars : [
		'arguments'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTArgumentChain >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ arguments = anObject arguments
]

{ #category : #visiting }
PTASTArgumentChain >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTArgumentChain: self
]

{ #category : #accessing }
PTASTArgumentChain >> argumentChain [
	^ argumentChain
]

{ #category : #accessing }
PTASTArgumentChain >> argumentChain: anObject [
	argumentChain := anObject
]

{ #category : #accessing }
PTASTArgumentChain >> arguments [
	^ arguments
]

{ #category : #accessing }
PTASTArgumentChain >> arguments: anObject [
	arguments := anObject
]

{ #category : #comparing }
PTASTArgumentChain >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ arguments hash
]
