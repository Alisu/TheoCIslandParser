Class {
	#name : #TheoCGrammar2,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'cFile',
		'functionCall',
		'argument',
		'argumentChain',
		'identifier',
		'arguments',
		'crap',
		'preproc'
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
			#(crap arguments argument identifier preproc);
		rulesToIgnore: #(cFile);
		parserPackage: #'ParserTheo2-Grammar';
		parserClass: #TheoCParser2;
		astPackage: #'ParserTheo2-AST'; 
		astPrefix: #PTAST;
		visitorPackage: #'ParserTheo2-Visitor';
		visitorClass: #PTCVisitor2;
		yourself
]

{ #category : #rules }
TheoCGrammar2 >> argument [

 ^ #blank asPParser star, (functionCall plus / #word asPParser plus / nil asPParser), #blank asPParser star
]

{ #category : #rules }
TheoCGrammar2 >> argumentChain [

	^($, asPParser, #blank asPParser star , argument) star.
]

{ #category : #rules }
TheoCGrammar2 >> arguments [

	| parser |
	parser := $( asPParser, argument, argumentChain, $) asPParser.
	^parser flatten
]

{ #category : #accessing }
TheoCGrammar2 >> cFile [

	^ (functionCall / crap) star
	
]

{ #category : #accessing }
TheoCGrammar2 >> crap [ 
	^preproc / #any asPParser 
]

{ #category : #rules }
TheoCGrammar2 >> functionCall [

	^ identifier, arguments
]

{ #category : #rules }
TheoCGrammar2 >> identifier [
	^( #letter asPParser / $_ asPParser
		, (#letter asPParser / $_ asPParser / #digit asPParser) star) flatten
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
