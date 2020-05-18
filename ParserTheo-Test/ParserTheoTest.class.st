Class {
	#name : #ParserTheoTest,
	#superclass : #TestCase,
	#category : #'ParserTheo-Test'
}

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseCrapIntoCrap [

| codeToParse |
codeToParse := '/* InterpreterProxy methodsFor: special objects */'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: codeToParse size.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTCrap.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclaration [

| codeToParse |
codeToParse := 'sqInt (*classString)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration.
]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithFonctionPointerAsArgument [

self flag:#Todo
"Case not handled"

"| codeToParse |
codeToParse := 'sqInt  (*positive32BitIntegerFor)(unsigned int integerValue);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration."

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithMethodCallAsArgShouldFail [

| codeToParse |
codeToParse := 'sqInt (*classString)(foo());'.

self deny: ((TheoCParser parse: codeToParse) hFile size) equals: 1.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithModifierBeforeReturnType [

self flag:#Todo
"Case not handled"

"| codeToParse |
codeToParse := 'volatile usqLong (*utcMicroseconds)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration."

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithModifierInArguments [

self flag:#Todo
"Case not handled"

"| codeToParse |
codeToParse := 'volatile usqLong (*utcMicroseconds)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration."

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithNonNamedArguments [

| codeToParse |
codeToParse := 'sqInt (*returnAsThroughCallbackContext)(int, vmccp, sqInt);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithOneArgument [

| codeToParse |
codeToParse := 'sqInt  (*pop)(sqInt nItems);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithTwoArguments [

| codeToParse |
codeToParse := 'sqInt  (*popthenPush)(sqInt nItems, sqInt oop);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseSimpleDeclarationWithreturnTypeBeingPointer [

| codeToParse |
codeToParse := 'void  *(*arrayValueOf)(sqInt oop);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 1.
self assert: (((TheoCParser parse: codeToParse) hFile at: 1) class) equals: PTASTFonctionPointerDeclaration.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseTwoSimpleDeclaration [

| codeToParse |
codeToParse := 'sqInt (*classString)(void);sqInt (*classSmallInteger)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 2.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseTwoSimpleDeclarationWithBlankBetween [

| codeToParse |
codeToParse := 'sqInt (*classString)(void); sqInt (*classSmallInteger)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 3.
self assert: (((TheoCParser parse: codeToParse) hFile at: 2) class) equals: PTASTCrap.

]

{ #category : #'as yet unclassified' }
ParserTheoTest >> testParseTwoSimpleDeclarationWithCrBetween [

| codeToParse |
codeToParse := 'sqInt (*classString)(void);
sqInt (*classSmallInteger)(void);'.

self assert: ((TheoCParser parse: codeToParse) hFile size) equals: 3.
self assert: (((TheoCParser parse: codeToParse) hFile at: 2) class) equals: PTASTCrap.

]
