Class {
	#name : #PTASTPreproc,
	#superclass : #Object,
	#instVars : [
		'preproc'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTPreproc >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ preproc = anObject preproc
]

{ #category : #visiting }
PTASTPreproc >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTPreproc: self
]

{ #category : #comparing }
PTASTPreproc >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ preproc hash
]

{ #category : #accessing }
PTASTPreproc >> preproc [
	^ preproc
]

{ #category : #accessing }
PTASTPreproc >> preproc: anObject [
	preproc := anObject
]
