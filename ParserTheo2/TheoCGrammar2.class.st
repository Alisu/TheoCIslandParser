Class {
	#name : #TheoCGrammar2,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'cFile',
		'functionCall',
		'identifier',
		'crap',
		'preproc',
		'islandParenthesis',
		'argumentCall',
		'argumentsCall',
		'fonctionPointerDeclaration',
		'functionDeclaration',
		'type',
		'functionPointer',
		'arguments',
		'endStatement',
		'argument',
		'argumentChain'
	],
	#category : #ParserTheo2
}

{ #category : #translating }
TheoCGrammar2 class >> generate [
	<script>
	PPTASTGenerator
		generateEverythingFrom: TheoCGrammar2
		generationStrategy: self generationStrategy
]

{ #category : #accessing }
TheoCGrammar2 class >> generationStrategy [ 
	^ PPTASTGeneratorStrategy  new
		rulesToFlatten:
			#(crap identifier preproc);
		rulesToIgnore: #();
		parserPackage: #'ParserTheo2-Grammar';
		parserClass: #TheoCParser2;
		astPackage: #'ParserTheo2-AST'; 
		astPrefix: #PTAST;
		visitorPackage: #'ParserTheo2-Visitor';
		visitorClass: #PTCVisitor2;
		yourself
]

{ #category : #accessing }
TheoCGrammar2 >> argument [
	| parser |
	parser := (type
		, #word asPParser plus) / type plus / nil asPParser.
	^ parser
]

{ #category : #rules }
TheoCGrammar2 >> argumentCall [

 ^ #blank asPParser star, (argumentsCall / islandParenthesis) star, #blank asPParser star
]

{ #category : #accessing }
TheoCGrammar2 >> argumentChain [
	| parser |
	parser := ($, asPParser, #blank asPParser star, argument)
		star.
	^ parser
]

{ #category : #accessing }
TheoCGrammar2 >> arguments [
	| parser |
	parser := #blank asPParser star, $( asPParser , argument, argumentChain, $) asPParser.
	^ parser flatten
]

{ #category : #rules }
TheoCGrammar2 >> argumentsCall [

	| parser |
	parser := $( asPParser, argumentCall ,$) asPParser.
	^parser
]

{ #category : #accessing }
TheoCGrammar2 >> cFile [

	^ (fonctionPointerDeclaration / functionDeclaration / functionCall / crap) star
	
]

{ #category : #accessing }
TheoCGrammar2 >> crap [ 
	^preproc / #any asPParser 
]

{ #category : #accessing }
TheoCGrammar2 >> endStatement [
	| parser |
	parser := #blank asPParser star, $; asPParser.
	^ parser flatten
]

{ #category : #accessing }
TheoCGrammar2 >> fonctionPointerDeclaration [
	| parser |
	parser := type , functionPointer
		, arguments , endStatement.
	^ parser.
]

{ #category : #rules }
TheoCGrammar2 >> functionCall [

	^ identifier, argumentsCall
]

{ #category : #accessing }
TheoCGrammar2 >> functionDeclaration [
		| parser |
	parser := type , identifier
		, arguments , endStatement.
	^ parser.
]

{ #category : #accessing }
TheoCGrammar2 >> functionPointer [
	| parser |
	
	parser := $( asPParser , $* asPParser , identifier
		, $) asPParser.
	^ parser flatten
]

{ #category : #rules }
TheoCGrammar2 >> identifier [
	^( #letter asPParser / $_ asPParser
		, (#letter asPParser / $_ asPParser / #digit asPParser) star) flatten
]

{ #category : #accessing }
TheoCGrammar2 >> islandParenthesis [
	^ $) asPParser negate
]

{ #category : #rules }
TheoCGrammar2 >> preproc [

	^($# asPParser plus, Character lf asPParser negate star, Character lf asPParser plus) flatten
]

{ #category : #accessing }
TheoCGrammar2 >> start [
	"Answer the production to start this parser with."
	
	^self cFile
]

{ #category : #accessing }
TheoCGrammar2 >> type [
	| parser |
	parser := #word asPParser plus, #blank asPParser star, $* asPParser optional, #blank asPParser star.
	^ parser flatten
]
