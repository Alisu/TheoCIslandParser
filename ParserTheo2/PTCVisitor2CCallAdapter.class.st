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

{ #category : #Adapting }
PTCVisitor2CCallAdapter class >> adaptPluginFile: aCollection [ 

	| file visitor |
	file := '/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/FilePlugin/src/common/FilePlugin.c'
		asFileReference.
	visitor := self new.
	visitor selectorToAdapt: aCollection.
	^visitor visit: (TheoCParser2 parse: file contents).
	
 	"file delete.
	file writeStreamDo: [ :stream | stream << visitor aStream contents ]"
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> aStream [
	^ aStream
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> aStream: anObject [
	aStream := anObject
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> selectorsToAdapt [
	^ selectorsToAdapt
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> selectorsToAdapt: anObject [
	selectorsToAdapt := anObject
]

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
