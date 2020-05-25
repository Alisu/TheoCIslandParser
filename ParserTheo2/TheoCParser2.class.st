Class {
	#name : #TheoCParser2,
	#superclass : #TheoCGrammar2,
	#category : #ParserTheo2
}

{ #category : #rules }
TheoCParser2 >> argument [
	<generated>
	^ super argument
		==> [ :production | 
			PTASTArgument new
				argument: production;
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> argumentChain [
	<generated>
	^ super argumentChain
		==> [ :production | 
			PTASTArgumentChain new
				arguments: (production collect: [ :subProduction | subProduction at: 3 ]);
				yourself ]
]

{ #category : #rules }
TheoCParser2 >> arguments [
	<generated>
	^ super arguments flatten
		==> [ :production | 
			PTASTArguments new
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
