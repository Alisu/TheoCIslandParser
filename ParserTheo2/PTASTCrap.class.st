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

{ #category : #accessing }
PTASTCrap >> isD [
	crap = 'D'
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #accessing }
PTASTCrap >> isI [ 
	crap = 'i'
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #accessing }
PTASTCrap >> isO [ 
	crap = 'o'
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #accessing }
PTASTCrap >> isV [
	crap = 'v'
		ifTrue: [ ^ true ].
	^ false
]
