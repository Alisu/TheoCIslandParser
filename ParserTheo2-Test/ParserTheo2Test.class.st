Class {
	#name : #ParserTheo2Test,
	#superclass : #TestCase,
	#category : #'ParserTheo2-Test'
}

{ #category : #tests }
ParserTheo2Test >> testParsePreprocessorIntoCrap [

| codeToParse |
codeToParse := '#else
# define isImmediate(anObject) 0
#endif
#endif /* !defined(isImmediate) */
#if !defined(isIntegerObject)
'.

self assert: ((TheoCParser2 parse: codeToParse) size) equals: 5.
self assert: (((TheoCParser parse: codeToParse) hFile at: 2) class) equals: PTASTCrap.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCall [

| codeToParse |
codeToParse := 'foo()'.

self assert: ((TheoCParser2 parse: codeToParse) size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithArg [

| codeToParse |
codeToParse := 'foo(1)'.

self assert: ((TheoCParser2 parse: codeToParse) size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithArgs [

| codeToParse |
codeToParse := 'foo(1, pouet)'.

self assert: ((TheoCParser2 parse: codeToParse) size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) at: 1) class) equals: PTASTFunctionCall.
]

{ #category : #tests }
ParserTheo2Test >> testParseSimpleCallWithFunctionCallAsArg [

| codeToParse |
codeToParse := 'foo(bar(), pouet)'.

self assert: ((TheoCParser2 parse: codeToParse) size) equals: 1.
self assert: (((TheoCParser2 parse: codeToParse) at: 1) class) equals: PTASTFunctionCall.
]
