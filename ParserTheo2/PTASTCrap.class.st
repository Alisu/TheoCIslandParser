Class {
	#name : #PTASTCrap,
	#superclass : #Object,
	#instVars : [
		'crap'
	],
	#category : #'ParserTheo2-AST'
}

{ #category : #comparing }
PTASTCrap >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ crap = anObject crap
]

{ #category : #visiting }
PTASTCrap >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTCrap: self
]

{ #category : #accessing }
PTASTCrap >> crap [
	^ crap
]

{ #category : #accessing }
PTASTCrap >> crap: anObject [
	crap := anObject
]

{ #category : #comparing }
PTASTCrap >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ crap hash
]
