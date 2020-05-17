Class {
	#name : #PTASTFunctionPointer,
	#superclass : #Object,
	#instVars : [
		'functionPointer'
	],
	#category : #'ParserTheo-AST'
}

{ #category : #comparing }
PTASTFunctionPointer >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ functionPointer = anObject functionPointer
]

{ #category : #visiting }
PTASTFunctionPointer >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTFunctionPointer: self
]

{ #category : #accessing }
PTASTFunctionPointer >> fonctionPointer: anObject [
	functionPointer := anObject
]

{ #category : #accessing }
PTASTFunctionPointer >> functionPointer [
	^ functionPointer
]

{ #category : #comparing }
PTASTFunctionPointer >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ functionPointer hash
]
