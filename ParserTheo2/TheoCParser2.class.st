Class {
	#name : #TheoCParser2,
	#superclass : #TheoCGrammar2,
	#category : #ParserTheo2
}

{ #category : #accessing }
TheoCParser2 >> argument [
	<generated>
	^ super argument flatten
		==> [ :production | 
			PTASTArgument new
				argument: production;
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> argumentCall [
	<generated>
	^ super argumentCall
		==> [ :production | 
			PTASTArgumentCall new
				argument: production;
				yourself ] 
]

{ #category : #accessing }
TheoCParser2 >> argumentChain [
	<generated>
	^ super argumentChain flatten
		==> [ :production | 
			PTASTArgumentChain new
				argumentChain: production;
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> arguments [
	<generated>
	^ super arguments
		==> [ :production | 
			PTASTArguments new
				arguments: production;
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> argumentsCall [
	<generated>
	^ super argumentsCall flatten
		==> [ :production | 
			PTASTArgumentsCall new
				arguments: (TheoCParser2 parse: production) cFile;
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> cFile [

	^ super cFile
		==> [ :production | 
			PTASTCFile new
				cFile: production;
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> crap [
	<generated>
	^ super crap flatten
		==> [ :production | 
			PTASTCrap new
				crap: production;
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> endStatement [
	<generated>
	^ super endStatement flatten
		==> [ :production | 
			PTASTEndStatement new
				endStatement: production;
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> export [
	<generated>
	^ super export flatten
		==> [ :production | 
			PTASTType new
				type: production;
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> fonctionPointerDeclaration [
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
TheoCParser2 >> functionCall [
	<generated>
	^ super functionCall
		==> [ :production | 
			PTASTFunctionCall new
				identifier: (production at: 1);
				arguments: (production at: 2);
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> functionDeclaration [
	<generated>
	^ super functionDeclaration
		==> [ :production |
			PTASTFunctionDeclaration new
				type: (production at: 1);
				identifier: (production at: 2);
				arguments: (production at: 3);
				endStatement: (production at: 4);
				yourself ]
]

{ #category : #accessing }
TheoCParser2 >> functionPointer [
	<generated>
	^ super functionPointer flatten
		==> [ :production | 
			PTASTFunctionPointer new
				fonctionPointer: production;
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> identifier [
	<generated>
	^ super identifier flatten
		==> [ :production | 
			PTASTIdentifier new
				identifier: production;
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> preproc [
	<generated>
	^ super preproc flatten
		==> [ :production | 
			PTASTPreproc new
				preproc: production;
				yourself ]
]

{ #category : #helpers }
TheoCParser2 >> rejectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex odd]
]

{ #category : #helpers }
TheoCParser2 >> selectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex even]
]

{ #category : #accessing }
TheoCParser2 >> type [
	<generated>
	^ super type flatten
		==> [ :production | 
			PTASTType new
				type: production;
				yourself ]
]
