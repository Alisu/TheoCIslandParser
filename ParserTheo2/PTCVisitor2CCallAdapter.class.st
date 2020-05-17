Class {
	#name : #PTCVisitor2CCallAdapter,
	#superclass : #PTCVisitor2,
	#instVars : [
		'aStream',
		'selectorsToAdapt',
		'flag'
	],
	#category : #'ParserTheo2-Visitor'
}

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgument: anPTASTArgument [
	<generated>
	^ anPTASTArgument argument
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgumentChain: aPTASTArgumentChain [
	<generated>
	self visitAll: aPTASTArgumentChain arguments
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArguments: anPTASTArguments [
	<generated>
	^ anPTASTArguments arguments
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTCrap: anPTASTCrap [
	<generated>
	^ anPTASTCrap crap
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionCall: anPTASTFunctionCall [
	<generated>
	^ anPTASTFunctionCall functionCall
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTIdentifier: anPTASTIdentifier [
	<generated>
	^ anPTASTIdentifier identifier
]
