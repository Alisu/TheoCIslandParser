Class {
	#name : #TheoCGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'arguments',
		'argument',
		'argumentChain',
		'endStatement',
		'fonctionPointerDeclaration',
		'type',
		'functionPointer',
		'crap'
	],
	#category : #'ParserTheo-Grammar'
}

{ #category : #'as yet unclassified' }
TheoCGrammar class >> fileToAnalyze [

	^'/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/vm/include/common/sqVirtualMachine.h' asFileReference.
]

{ #category : #accessing }
TheoCGrammar class >> generate [
	<script>
	PPTASTGenerator
		generateEverythingFrom: TheoCGrammar
		generationStrategy: self generationStrategy
]

{ #category : #accessing }
TheoCGrammar class >> generationStrategy [ 
	^ PPTASTGeneratorStrategy  new
		rulesToFlatten:
			#(#argument #argumentChain #functionPointer #endStatement #type);
		rulesToIgnore: #();
		parserPackage: #'ParserTutorial-Base-Grammar';
		parserClass: #TheoCParser;
		astPackage: #'ParserTutorial-Base-AST'; 
		astPrefix: #PTAST;
		visitorPackage: #'ParserTutorial-Base-Visitor';
		visitorClass: #PTCVisitor;
		yourself
]

{ #category : #rules }
TheoCGrammar >> argument [
	| parser |
	parser := (type
		, #word asPParser plus) / type plus.
	^ parser
]

{ #category : #rules }
TheoCGrammar >> argumentChain [
	| parser |
	parser := ($, asPParser, #blank asPParser star, argument)
		star.
	^ parser
]

{ #category : #rules }
TheoCGrammar >> arguments [
	| parser |
	parser := #blank asPParser star, $( asPParser , argument, argumentChain, $) asPParser.
	^ parser flatten
]

{ #category : #accessing }
TheoCGrammar >> crap [

	^#any asPParser 
	
]

{ #category : #rules }
TheoCGrammar >> endStatement [
	| parser |
	parser := #blank asPParser star, $; asPParser.
	^ parser flatten
]

{ #category : #rules }
TheoCGrammar >> fonctionPointerDeclaration [
	| parser |
	parser := self type , self functionPointer
		, self arguments , self endStatement.
	^ parser.

	
	
	
]

{ #category : #rules }
TheoCGrammar >> functionPointer [
	| fonctionPointerName parser |
	fonctionPointerName := #word asPParser plus.
	parser := $( asPParser , $* asPParser , fonctionPointerName
		, $) asPParser.
	^ parser flatten
]

{ #category : #accessing }
TheoCGrammar >> hFile [

	^ (fonctionPointerDeclaration / crap) star
	
]

{ #category : #accessing }
TheoCGrammar >> start [
	^ self hFile
]

{ #category : #rules }
TheoCGrammar >> type [
	| parser |
	parser := #word asPParser plus, #blank asPParser star, $* asPParser optional, #blank asPParser star.
	^ parser flatten
]
