Class {
	#name : #PTASTFonctionPointerDeclaration,
	#superclass : #Object,
	#instVars : [
		'type',
		'fonctionPointer',
		'arguments',
		'endStatement'
	],
	#category : #'ParserTheo-AST'
}

{ #category : #comparing }
PTASTFonctionPointerDeclaration >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ ((type = anObject type
		and: [ arguments = anObject arguments ])
		and: [ fonctionPointer = anObject fonctionPointer ])
		and: [ endStatement  = anObject endStatement ]
]

{ #category : #visiting }
PTASTFonctionPointerDeclaration >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTFonctionPointerDeclaration: self
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> arguments [
	^ arguments
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> endStatement [
	^ endStatement
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> endStatement: anObject [
	endStatement := anObject
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> fonctionPointer [
	^ fonctionPointer
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> fonctionPointer: anObject [
	fonctionPointer := anObject
]

{ #category : #comparing }
PTASTFonctionPointerDeclaration >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ ((type hash bitXor: fonctionPointer hash)bitXor: arguments) bitXor: endStatement 
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> type [
	^ type
]

{ #category : #accessing }
PTASTFonctionPointerDeclaration >> type: anObject [
	type := anObject
]
