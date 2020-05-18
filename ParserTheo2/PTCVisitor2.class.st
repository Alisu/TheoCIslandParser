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
PTCVisitor2 >> visitPTASTFunctionCall: anPTASTFunctionCall [
	<generated>
	^ anPTASTFunctionCall functionCall
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
