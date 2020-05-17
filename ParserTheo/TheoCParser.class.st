Class {
	#name : #TheoCParser,
	#superclass : #TheoCGrammar,
	#category : #'ParserTheo-Grammar'
}

{ #category : #rules }
TheoCParser >> argument [
	<generated>
	^ super argument flatten
		==> [ :production | 
			PTASTArgument new
				argument: production;
				yourself ]
]

{ #category : #rules }
TheoCParser >> argumentChain [
	<generated>
	^ super argumentChain flatten
		==> [ :production | 
			PTASTArgumentChain new
				argumentChain: production;
				yourself ]
]

{ #category : #rules }
TheoCParser >> arguments [
	<generated>
	^ super arguments
		==> [ :production | 
			PTASTArguments new
				arguments: production;
				yourself ]
]

{ #category : #rules }
TheoCParser >> crap [

	^ super crap
		==> [ :production | 
			PTASTCrap new
				crap: production;
				yourself ]
]

{ #category : #rules }
TheoCParser >> endStatement [
	<generated>
	^ super endStatement flatten
		==> [ :production | 
			PTASTEndStatement new
				endStatement: production;
				yourself ]
]

{ #category : #rules }
TheoCParser >> fonctionPointerDeclaration [
	<generated>
	^ super fonctionPointerDeclaration
		==> [ :production | 
			PTASTFonctionPointerDeclaration new
				type: (production at: 1);
				fonctionPointer: (production at: 2);
				arguments: (production at: 3);
				endStatement: (production at: 4);
				yourself ]
]

{ #category : #rules }
TheoCParser >> functionPointer [
	<generated>
	^ super functionPointer flatten
		==> [ :production | 
			PTASTFunctionPointer new
				fonctionPointer: production;
				yourself ]
]

{ #category : #rules }
TheoCParser >> hFile [

	^ super hFile
		==> [ :production | 
			PTASTHFile new
				hFile: production;
				yourself ]
]

{ #category : #helpers }
TheoCParser >> rejectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex odd]
]

{ #category : #helpers }
TheoCParser >> selectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex even]
]

{ #category : #rules }
TheoCParser >> type [
	<generated>
	^ super type flatten
		==> [ :production | 
			PTASTType new
				type: production;
				yourself ]
]
