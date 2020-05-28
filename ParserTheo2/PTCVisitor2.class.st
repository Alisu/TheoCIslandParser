Class {
	#name : #PTCVisitor2,
	#superclass : #Object,
	#category : #'ParserTheo2-Visitor'
}

{ #category : #helpers }
PTCVisitor2 >> visit: aChildNode [
	^ aChildNode ifNotNil: [ aChildNode acceptVisitor: self ]
]

{ #category : #helpers }
PTCVisitor2 >> visitAll: childrenNodes [
	childrenNodes
		ifNotNil: [ childrenNodes do: [ :aChildNode | aChildNode acceptVisitor: self ] ]
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTArgument: anPTASTArgument [
	<generated>
	^ anPTASTArgument argument
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTArgumentCall: anPTASTArgumentCall [
	<generated>
	^ anPTASTArgumentCall argument
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTArgumentChain: aPTASTArgumentChain [
	<generated>
	self visitAll: aPTASTArgumentChain arguments.
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTArguments: anPTASTArguments [
	<generated>
	^ anPTASTArguments arguments
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTArgumentsCall: anPTASTArgumentsCall [
	<generated>
	^ anPTASTArgumentsCall arguments
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTCFile: aPTASTCFile [
	<generated>
	self visitAll: aPTASTCFile cFile

]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTCrap: anPTASTCrap [
	<generated>
	^ anPTASTCrap crap
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTEndStatement: anPTASTEndStatement [
	<generated>
	^ anPTASTEndStatement endStatement
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration [
	<generated>
	self visit: aPTASTFonctionPointerDeclaration type.
	self visit: aPTASTFonctionPointerDeclaration fonctionPointer.
	self visit: aPTASTFonctionPointerDeclaration arguments.
	self visit: aPTASTFonctionPointerDeclaration endStatement
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTFunctionCall: anPTASTFunctionCall [
	<generated>
	self visit: anPTASTFunctionCall identifier.
	self visit: anPTASTFunctionCall arguments.
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTFunctionDeclaration: anPTASTFunctionDeclaration [

	anPTASTFunctionDeclaration type type = 'return '
		ifTrue: [ | return functionCall |
			return := PTASTCrap new crap: anPTASTFunctionDeclaration type type.
			functionCall := PTASTFunctionCall new
				identifier: anPTASTFunctionDeclaration identifier;
				arguments: anPTASTFunctionDeclaration arguments.
			self visit: return.
			self visit: functionCall ]
		ifFalse: [ self visit: anPTASTFunctionDeclaration type.
			self visit: anPTASTFunctionDeclaration identifier.
			self visit: anPTASTFunctionDeclaration arguments ].
	self visit: anPTASTFunctionDeclaration endStatement
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTFunctionPointer: anPTASTFunctionPointer [
	<generated>

	^ anPTASTFunctionPointer functionPointer
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTIdentifier: anPTASTIdentifier [
	<generated>
	^ anPTASTIdentifier identifier
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTPreproc: anPTASTPreproc [
	<generated>
	^ anPTASTPreproc preproc
]

{ #category : #visiting }
PTCVisitor2 >> visitPTASTType: anPTASTType [
	<generated>
	^ anPTASTType type
]
