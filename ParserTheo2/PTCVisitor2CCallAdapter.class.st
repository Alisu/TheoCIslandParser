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
	visitor selectorsToAdapt: aCollection.
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

{ #category : #initialization }
PTCVisitor2CCallAdapter >> initialize [ 

	aStream := String new writeStream.
	flag := false
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
	super visitAll: aPTASTArgumentChain arguments
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArguments: anPTASTArguments [
	
	| arguments |
	arguments := anPTASTArguments arguments.
	flag
		ifTrue: [ 
			arguments = '(void)'
				ifTrue: [ ^ aStream nextPutAll: arguments ].
			self halt.
			arguments = '()'
				ifTrue: [ ^ aStream nextPutAll: '(interpreterProxy->interpreterState)' ].
			aStream
				nextPutAll: arguments allButLast;
				nextPutAll: ', interpreterProxy->interpreterState)' ]
		ifFalse: [ aStream nextPutAll: arguments ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTCFile: anPTASTCFile [
	<generated>
	^ super visitPTASTCFile: anPTASTCFile
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTCrap: anPTASTCrap [
	anPTASTCrap crap class = ByteString
		ifTrue: [ aStream nextPutAll: anPTASTCrap crap ]
		ifFalse: [ aStream nextPut: anPTASTCrap crap ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionCall: anPTASTFunctionCall [
	<generated>
	super visitPTASTFunctionCall: anPTASTFunctionCall.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTIdentifier: anPTASTIdentifier [
		
	| identifier |
	identifier := anPTASTIdentifier identifier.
	aStream nextPutAll: identifier.
	(identifier = 'EXPORT') ifTrue:[flag := false. ^self ].
	(selectorsToAdapt
		anySatisfy: [ :s | (CCodeGenerator new cFunctionNameFor: s selector) = identifier ])
		ifTrue: [ flag := true ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTPreproc: anPTASTPrepoc [
	<generated>
	^ anPTASTPrepoc identifier
]
