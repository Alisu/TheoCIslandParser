Class {
	#name : #PTCVisitorCrapPrinter,
	#superclass : #PTCVisitor,
	#instVars : [
		'aStream'
	],
	#category : #'ParserTheo-Visitor'
}

{ #category : #initialization }
PTCVisitorCrapPrinter >> initialize [ 

	aStream := String new writeStream
]

{ #category : #visiting }
PTCVisitorCrapPrinter >> visitPTASTCrap: anPTASTCrap [
	aStream nextPut: anPTASTCrap crap
]
