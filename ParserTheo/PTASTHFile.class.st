Class {
	#name : #PTASTHFile,
	#superclass : #Object,
	#instVars : [
		'hFile'
	],
	#category : #'ParserTheo-Grammar'
}

{ #category : #comparing }
PTASTHFile >> = anObject [
"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ hFile = anObject hFile
]

{ #category : #visiting }
PTASTHFile >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTHFile: self
]

{ #category : #accessing }
PTASTHFile >> hFile [
	^ hFile
]

{ #category : #accessing }
PTASTHFile >> hFile: anObject [
	hFile := anObject
]

{ #category : #comparing }
PTASTHFile >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ hFile hash
]
