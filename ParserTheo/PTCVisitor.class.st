Class {
	#name : #PTCVisitor,
	#superclass : #Object,
	#category : #'ParserTheo-Visitor'
}

{ #category : #helpers }
PTCVisitor >> visit: aChildNode [
	^ aChildNode ifNotNil: [ aChildNode acceptVisitor: self ]
]

{ #category : #helpers }
PTCVisitor >> visitAll: childrenNodes [
	childrenNodes
		ifNotNil: [ childrenNodes do: [ :aChildNode | aChildNode acceptVisitor: self ] ]
]

{ #category : #visiting }
PTCVisitor >> visitPTASTArgument: anPTASTArgument [
	<generated>
	^ anPTASTArgument argument
]

{ #category : #visiting }
PTCVisitor >> visitPTASTArgumentChain: anPTASTArgumentChain [
	<generated>
	^ anPTASTArgumentChain argumentChain
]

{ #category : #visiting }
PTCVisitor >> visitPTASTArguments: aPTASTArguments [
	<generated>
	^ aPTASTArguments arguments
]

{ #category : #visiting }
PTCVisitor >> visitPTASTCrap: anPTASTCrap [
	<generated>
	^ anPTASTCrap crap
]

{ #category : #visiting }
PTCVisitor >> visitPTASTEndStatement: anPTASTEndStatement [
	<generated>
	^ anPTASTEndStatement endStatement
]

{ #category : #visiting }
PTCVisitor >> visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration [
	<generated>
	self visit: aPTASTFonctionPointerDeclaration type.
	self visit: aPTASTFonctionPointerDeclaration fonctionPointer.
	self visit: aPTASTFonctionPointerDeclaration arguments.
	self visit: aPTASTFonctionPointerDeclaration endStatement
]

{ #category : #visiting }
PTCVisitor >> visitPTASTFunctionPointer: anPTASTFunctionPointer [
	<generated>

	^ anPTASTFunctionPointer functionPointer
]

{ #category : #visiting }
PTCVisitor >> visitPTASTHFile: aPTASTHFile [
	<generated>
	self visitAll: aPTASTHFile cFile

]

{ #category : #visiting }
PTCVisitor >> visitPTASTType: anPTASTType [
	<generated>
	^ anPTASTType type
]
