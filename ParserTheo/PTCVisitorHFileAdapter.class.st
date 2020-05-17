Class {
	#name : #PTCVisitorHFileAdapter,
	#superclass : #PTCVisitor,
	#instVars : [
		'aStream',
		'selectorToAdapt',
		'flag'
	],
	#category : #'ParserTheo-Visitor'
}

{ #category : #doing }
PTCVisitorHFileAdapter class >> adaptHFile: aCollection [
	| file visitor |
	file := '/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/vm/include/common/sqVirtualMachine.h'
		asFileReference.
	visitor := self new.
	visitor selectorToAdapt: aCollection.
	^visitor visit: (TheoCParser parse: file contents).
	
 	"file delete.
	file writeStreamDo: [ :stream | stream << visitor aStream contents ]"
]

{ #category : #accessing }
PTCVisitorHFileAdapter >> aStream [
	^ aStream
]

{ #category : #accessing }
PTCVisitorHFileAdapter >> aStream: anObject [
	aStream := anObject
]

{ #category : #initialization }
PTCVisitorHFileAdapter >> initialize [ 

	aStream := String new writeStream.
	flag := false
]

{ #category : #accessing }
PTCVisitorHFileAdapter >> selectorToAdapt [
	^ selectorToAdapt
]

{ #category : #accessing }
PTCVisitorHFileAdapter >> selectorToAdapt: anObject [
	selectorToAdapt := anObject
]

{ #category : #visiting }
PTCVisitorHFileAdapter >> visitPTASTArguments: aPTASTArguments [
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
PTCVisitorHFileAdapter >> visitPTASTCrap: anPTASTCrap [
	aStream nextPut: anPTASTCrap crap
]

{ #category : #visiting }
PTCVisitorHFileAdapter >> visitPTASTEndStatement: anPTASTEndStatement [
	aStream nextPutAll: anPTASTEndStatement endStatement.
]

{ #category : #visiting }
PTCVisitorHFileAdapter >> visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration [
	super
		visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration.
	flag := false
]

{ #category : #visiting }
PTCVisitorHFileAdapter >> visitPTASTFunctionPointer: anPTASTFunctionPointer [
	<generated>
	| functionPointerName |
	functionPointerName := anPTASTFunctionPointer functionPointer.
	aStream nextPutAll: functionPointerName.
	(selectorToAdapt
		anySatisfy: [ :s | ('(*' ,(CCodeGenerator new cFunctionNameFor: s selector), ')') = functionPointerName ])
		ifTrue: [ flag := true ]
]

{ #category : #visiting }
PTCVisitorHFileAdapter >> visitPTASTHFile: aPTASTHFile [

 ^super visitPTASTHFile: aPTASTHFile
]

{ #category : #visiting }
PTCVisitorHFileAdapter >> visitPTASTType: anPTASTType [
	<generated>
	aStream nextPutAll: anPTASTType type.
]
