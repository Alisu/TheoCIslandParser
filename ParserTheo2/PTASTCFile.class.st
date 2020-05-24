Class {
	#name : #PTASTCFile,
	#superclass : #Object,
	#instVars : [
		'cFile'
	],
	#category : #'ParserTheo2-Grammar'
}

{ #category : #comparing }
PTASTCFile >> = anObject [
"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ cFile = anObject cFile
]

{ #category : #visiting }
PTASTCFile >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTCFile: self
]

{ #category : #accessing }
PTASTCFile >> cFile [
	^ cFile
]

{ #category : #accessing }
PTASTCFile >> cFile: anObject [
	cFile := anObject
]

{ #category : #comparing }
PTASTCFile >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ cFile hash
]
