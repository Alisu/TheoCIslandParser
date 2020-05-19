Class {
	#name : #ParserTheo2Test,
	#superclass : #TestCase,
	#category : #'ParserTheo2-Test'
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
code1 := '/* Default EXPORT macro that does nothing (see comment in sq.h): */
'.
code2 :='#define EXPORT(returnType) returnType
'.
codeToParse := code1, code2.

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
codeToParse := 'foo(bar(), pouet)'.

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
ParserTheo2Test >> testShouldNotParseIfArgIsVoid [

| codeToParse |
self flag:#TODO.
"Case not handled"
codeToParse := 'foo(void)'.

self assert: ((TheoCParser2 parse: codeToParse) cFile size) equals: 1.
self deny: (((TheoCParser2 parse: codeToParse) cFile at: 1) class) equals: PTASTFunctionCall.
]
