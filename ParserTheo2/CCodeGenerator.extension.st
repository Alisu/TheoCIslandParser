Extension { #name : #CCodeGenerator }

{ #category : #'*ParserTheo2' }
CCodeGenerator >> emitCCodeOn: aStream doInlining: inlineFlag doAssertions: assertionFlag [
	"Emit C code for all methods in the code base onto the given stream. All inlined method calls should already have been expanded."

	| verbose methodList listOfSelector array stream |
	"method preparation"
	verbose := false.
	self prepareMethods.
	verbose ifTrue: [
		self printUnboundCallWarnings.
		self printUnboundVariableReferenceWarnings.
		logger cr.
	].
	assertionFlag ifFalse: [ self removeAssertions ].
	self doInlining: inlineFlag.

	"code generation"
	"If we're outputting the VM put the main interpreter loop first for two reasons.
	 1, so that the dispdbg.h header included at the bytecode dispatch can define
	 macros that affect all C code in the interpreter,  and 2, so that all primitive
	 functions will come after and have relatively high addresses.  This provides safety
	 in the use of primitiveFunctionPointer as a function pointer and an index by trying
	 to ensure that primitives have addresses much higher than any indices."
	methodList := self sortMethods: methods.
	(methods includesKey: #interpret) ifTrue:
		[methodList := { methods at: #interpret }, (methodList copyWithout: (methods at: #interpret))].
	"clean out no longer valid variable names and then
	 handle any global variable usage in each method"
	methodList do: [:m | self checkForGlobalUsage: (m removeUnusedTempsAndNilIfRequiredIn: self) in: m].
	self localizeGlobalVariables.
	
	listOfSelector := (methodList select: [ :aMethod | 
    (aMethod isRealMethod 
        and: [ (self shouldGenerateMethod: aMethod)])]).

array := listOfSelector collect: [ :e | e selector ].
stream := String new writeStream.
stream nextPutAll:'#('.
array do: [:e | stream nextPut: $#; nextPutAll: e; nextPut: Character space ].
stream nextPut: $).

 self halt.
	"PTCVisitorHFileAdapter adaptHFile: listOfSelector."
	PTCVisitor2CCallAdapter adaptPluginFile: listOfSelector.
	self halt.

	self emitCHeaderOn: aStream.
	self emitCConstantsOn: aStream.
	self emitCTypesOn: aStream. "Emitting types after constants allows use of constant names, e.g. in declaring arrays."
	self emitCFunctionPrototypes: methodList on: aStream.
	self emitCVariablesOn: aStream.
	self emitCMacros: methodList on: aStream.
	self emitCMethods: methodList on: aStream.
	self emitExportsOn: aStream.

]
