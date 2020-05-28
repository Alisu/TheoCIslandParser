Class {
	#name : #ParserTheo2Test,
	#superclass : #TestCase,
	#category : #'ParserTheo2-Tests'
}

{ #category : #tests }
ParserTheo2Test >> testParseComplexCall [

| codeToParse |
self flag:#TODO.
"Case not handled"
codeToParse := 'foo(1 >> 3 + foo(), (char*)(foo()))'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseCrapIntoCrap [

| codeToParse |
codeToParse := '/* InterpreterProxy methodsFor: special objects */'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: codeToParse size.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTCrap.
]

{ #category : #tests }
ParserTheo2Test >> testParseFunctionCallsInArgsAreFunctionCalls [

| codeToParse firstFunctionCall |

codeToParse := 'loadCompressedShapesegmentsleftFillsrightFillslineWidthslineFillsfillIndexListpointShort(firstIndexableField(points), nSegments, firstIndexableField(leftFills), firstIndexableField(rightFills), firstIndexableField(lineWidths), firstIndexableField(lineFills), firstIndexableField(fillIndexList), pointsShort);'.

firstFunctionCall := (TheoCParser2 parse: codeToParse) cFile at: 1.
self assert: (firstFunctionCall arguments arguments select: [ :e | e class = PTASTFunctionCall ]) size equals: 6.

]

{ #category : #tests }
ParserTheo2Test >> testParsePreprocessorIntoCrap [

| codeToParse |
codeToParse := '/*
#include "config.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 10.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 2) class) equals: PTASTCrap.
]

{ #category : #tests }
ParserTheo2Test >> testParsePreprocessorIntoCrap2 [

| codeToParse code1 code2 |
code1 := '/* Default EXPORT macro that does nothing (see comment in sq.h): */'.
code2 :='#define EXPORT(returnType) returnType'.
codeToParse := code1, Character lf asString, code2.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: code1 size + 1 .
self assert: (((TheoCParser2 parse: codeToParse) cFile at: code1 size + 1 ) class) equals: PTASTCrap.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCall [

| codeToParse |
codeToParse := 'foo()'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithArg [

| codeToParse |
codeToParse := 'foo(1)'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithArgs [

| codeToParse |
codeToParse := 'foo(1, pouet)'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithFunctionCallAsArg [

| codeToParse |
codeToParse := 'foo(pouet, nbar())'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithParenthesisAsArg [

| codeToParse |
self flag:#TODO.
"Case not handled"
codeToParse := 'foo(")")'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclaration [

| codeToParse |
codeToParse := 'sqInt classString(void);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionDeclaration.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithEXPORTBefore [

| codeToParse |
codeToParse := 'EXPORT(sqInt) moduleUnloaded(char *aModuleName);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionDeclaration.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithFonctionPointerAsArgument [

self flag:#Todo
"Case not handled"

"| codeToParse |
codeToParse := 'sqInt  (*positive32BitIntegerFor)(unsigned int integerValue);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration."

]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithMethodCallAsArgShouldFail [

| codeToParse |
codeToParse := 'sqInt (*classString)(foo());'.

self deny: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithModifierBeforeReturnType [

self flag:#Todo
"Case not handled"

"| codeToParse |
codeToParse := 'volatile usqLong (*utcMicroseconds)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration."

]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithModifierInArguments [

self flag:#Todo
"Case not handled"

"| codeToParse |
codeToParse := 'volatile usqLong (*utcMicroseconds)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration."

]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithNonNamedArguments [

| codeToParse |
codeToParse := 'sqInt (*returnAsThroughCallbackContext)(int, vmccp, sqInt);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithOneArgument [

| codeToParse |
codeToParse := 'sqInt  (*pop)(sqInt nItems);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithTwoArguments [

| codeToParse |
codeToParse := 'sqInt  (*popthenPush)(sqInt nItems, sqInt oop);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleDeclarationWithreturnTypeBeingPointer [

| codeToParse |
codeToParse := 'void  *(*arrayValueOf)(sqInt oop);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #tests }
ParserTheo2Test >> testParseSimplePointerDeclaration [

| codeToParse |
codeToParse := 'sqInt (*classString)(void);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFonctionPointerDeclaration.
]

{ #category : #tests }
ParserTheo2Test >> testParseTwoSimpleDeclaration [

| codeToParse |
codeToParse := 'sqInt (*classString)(void);sqInt (*classSmallInteger)(void);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 2.

]

{ #category : #tests }
ParserTheo2Test >> testParseTwoSimpleDeclarationWithBlankBetween [

| codeToParse |
codeToParse := 'sqInt (*classString)(void); sqInt (*classSmallInteger)(void);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 2.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 2) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #tests }
ParserTheo2Test >> testParseTwoSimpleDeclarationWithCrBetween [

| codeToParse |
codeToParse := 'sqInt (*classString)(void);
sqInt (*classSmallInteger)(void);'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 3.
self assert: (((TheoCParser2 parse: codeToParse) cFile at: 2) class) equals: PTASTCrap.

]

{ #category : #tests }
ParserTheo2Test >> testVisitFunctionCallsInArgsAreFunctionCalls [
	| codeToParse selector visitor |
	codeToParse := 'loadCompressedShapesegmentsleftFillsrightFillslineWidthslineFillsfillIndexListpointShort(firstIndexableField(points), nSegments, firstIndexableField(leftFills), firstIndexableField(rightFills), firstIndexableField(lineWidths), firstIndexableField(lineFills), firstIndexableField(fillIndexList), pointsShort);'.
	selector := OrderedCollection new.
	selector add: (Selector new selector: 'firstIndexableField').
	visitor := PTCVisitor2CCallAdapter new.
	visitor aStream: String new writeStream.
	visitor selectorsToAdapt: selector.
	visitor visit: (TheoCParser2 parse: codeToParse).
	self
		assert: visitor aStream contents
		equals:
			'loadCompressedShapesegmentsleftFillsrightFillslineWidthslineFillsfillIndexListpointShort(firstIndexableField(points, interpreterProxy->interpreterState), nSegments, firstIndexableField(leftFills, interpreterProxy->interpreterState), firstIndexableField(rightFills, interpreterProxy->interpreterState), firstIndexableField(lineWidths, interpreterProxy->interpreterState), firstIndexableField(lineFills, interpreterProxy->interpreterState), firstIndexableField(fillIndexList, interpreterProxy->interpreterState), pointsShort);'
]

{ #category : #tests }
ParserTheo2Test >> testVisitSimpleCallInIf [

| codeToParse selector visitor |
codeToParse := 'if (failed()) {
		return null;
	}'.

selector := OrderedCollection new.
selector add: (Selector new selector: 'failed').
visitor := PTCVisitor2CCallAdapter new.
visitor aStream: String new writeStream.
visitor selectorsToAdapt: selector.
visitor visit: (TheoCParser2 parse: codeToParse).

self assert: visitor aStream contents equals: 'if (failed(interpreterProxy->interpreterState)) {
		return null;
	}'

]

{ #category : #tests }
ParserTheo2Test >> testVisitSimpleCallWithReturnBefore [
	| codeToParse selector visitor |
	codeToParse := 'return primitiveFail();'.
	selector := OrderedCollection new.
	selector add: (Selector new selector: 'primitiveFail').
	visitor := PTCVisitor2CCallAdapter new.
	visitor aStream: String new writeStream.
	visitor selectorsToAdapt: selector.
	visitor visit: (TheoCParser2 parse: codeToParse).
	self
		assert: visitor aStream contents
		equals:
			'return primitiveFail(interpreterProxy->interpreterState);'
]
