Class {
	#name : #PTCVisitor2CCallAdapter,
	#superclass : #PTCVisitor2,
	#instVars : [
		'aStream',
		'selectorsToAdapt',
		'flag',
		'codeGenerator'
	],
	#category : #'ParserTheo2-Visitor'
}

{ #category : #Adapting }
PTCVisitor2CCallAdapter class >> adaptPluginFile: aCollection [
	| files visitor |
	files := '/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/'
		asFileReference allFiles select: [ :f | f fullName last = $c ].
	visitor := self new.
	files
		do: [ :file | 
			file fullName
				=
					'/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/LocalePlugin/src/unix/sqUnixLocale.c'
				ifFalse: [ 
					visitor aStream: String new writeStream.
					visitor selectorsToAdapt: aCollection.
					visitor visit: (TheoCParser2 parse: file contents) ].
			file delete.
			file
				writeStreamDo: [ :stream | stream << visitor aStream contents ] ]
]

{ #category : #Adapting }
PTCVisitor2CCallAdapter class >> adaptPluginFiles: aCollection [
	| file visitor |
	file := '/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/B2DPlugin/src/common/B2DPlugin.c'
		asFileReference.
	
	visitor := self new.
	visitor selectorsToAdapt: aCollection.
	visitor visit: (TheoCParser2 parse: file contents).
	self halt.
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
	codeGenerator := CCodeGenerator new.
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
PTCVisitor2CCallAdapter >> visitPTASTArgumentCall: anPTASTArgumentCall [
	<generated>
	^ anPTASTArgumentCall argument
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgumentChain: aPTASTArgumentChain [
	<generated>
	super visitAll: aPTASTArgumentChain arguments
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArguments: aPTASTArguments [
	<generated>
	| arguments |
	arguments := aPTASTArguments arguments.
	flag
		ifTrue: [ arguments = '(void)'
				ifTrue: [ ^ aStream nextPutAll: '(struct foo * self)' ].
			arguments = '()'
				ifTrue: [ ^ aStream nextPutAll: '(struct foo * self)' ].
			aStream
				nextPutAll: arguments allButLast;
				nextPutAll: ', struct foo * self)' ]
		ifFalse: [ aStream nextPutAll: arguments ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgumentsCall: anPTASTArgumentsCall [

	flag
		ifTrue: [ anPTASTArgumentsCall isNull
				ifTrue: [ anPTASTArgumentsCall arguments
						add: (PTASTCrap new crap: 'interpreterProxy->interpreterState')
						before: anPTASTArgumentsCall arguments last ]
				ifFalse: [ anPTASTArgumentsCall isVoid
						ifFalse: [ anPTASTArgumentsCall arguments
								add: (PTASTCrap new crap: ', interpreterProxy->interpreterState')
								beforeIndex: anPTASTArgumentsCall arguments size] ] ].
	self visitAll: anPTASTArgumentsCall arguments
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
PTCVisitor2CCallAdapter >> visitPTASTEndStatement: anPTASTEndStatement [
	aStream nextPutAll: anPTASTEndStatement endStatement.
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration [
	super
		visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionCall: anPTASTFunctionCall [
	<generated>

	super visitPTASTFunctionCall: anPTASTFunctionCall.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionDeclaration: aPTASTFunctionDeclaration [
	super
		visitPTASTFunctionDeclaration: aPTASTFunctionDeclaration.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionPointer: anPTASTFunctionPointer [
	<generated>
	| functionPointerName |
	functionPointerName := anPTASTFunctionPointer functionPointer.
	aStream nextPutAll: functionPointerName.
	(selectorsToAdapt
		anySatisfy: [ :s | ('(*' ,(codeGenerator cFunctionNameFor: s selector), ')') = functionPointerName ])
		ifTrue: [ flag := true ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTIdentifier: anPTASTIdentifier [
		
	| identifier |
	identifier := anPTASTIdentifier identifier.
	aStream nextPutAll: identifier.
	(identifier = 'EXPORT') ifTrue:[flag := false. ^self ].
	(selectorsToAdapt
		anySatisfy: [ :s | (codeGenerator cFunctionNameFor: s selector) = identifier ])
		ifTrue: [ flag := true ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTPreproc: anPTASTPrepoc [
	<generated>
	^ anPTASTPrepoc identifier
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTType: anPTASTType [
	<generated>
	aStream nextPutAll: anPTASTType type.
]
