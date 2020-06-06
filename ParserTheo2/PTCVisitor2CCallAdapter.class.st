Class {
	#name : #PTCVisitor2CCallAdapter,
	#superclass : #PTCVisitor2,
	#instVars : [
		'aStream',
		'selectorsToAdapt',
		'flag',
		'codeGenerator'
	],
	#category : #'ParserTheo2-Visitor'
}

{ #category : #Adapting }
PTCVisitor2CCallAdapter class >> adaptPluginFile: aCollection [
	| files visitor |
	files := '/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/'
		asFileReference allFiles select: [ :f | f fullName last = $c ].
	visitor := self new.
	files
		do: [ :file | 
			file fullName
				=
					'/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/LocalePlugin/src/unix/sqUnixLocale.c'
				ifFalse: [ visitor aStream: String new writeStream.
					aCollection
						ifNil: [ PTCVisitor2CCallAdapter defaultSelectors ]
						ifNotNil: [ visitor selectorsToAdapt: aCollection ].
					visitor visit: (TheoCParser2 parse: file contents) ].
			file delete.
			file
				writeStreamDo: [ :stream | stream << visitor aStream contents ] ]
]

{ #category : #Adapting }
PTCVisitor2CCallAdapter class >> adaptPluginFiles: aCollection [
	| file visitor |
	file := '/Users/theo/openSMVM/opensmalltalk-vm-1/extracted/plugins/B2DPlugin/src/common/B2DPlugin.c'
		asFileReference.
	
	visitor := self new.
	visitor selectorsToAdapt: aCollection.
	visitor visit: (TheoCParser2 parse: file contents).
	self halt.
	"file delete.
	file writeStreamDo: [ :stream | stream << visitor aStream contents ]"
]

{ #category : #'as yet unclassified' }
PTCVisitor2CCallAdapter class >> defaultSelectors [

^#(#interpret #addressIsInPage: #isFree #freeStackPageNoAssert: #freeStackPage: #markStackPageMostRecentlyUsed: #markStackPageNextMostRecentlyUsed: #newStackPage #pageListIsWellFormed #stackPageAt: #stackPageFor: #statAverageLivePagesWhenMapping #canBeImmutable: #cStringOrNullFor: #failed #isNegativeIntegerValueOf: #isPositiveMachineIntegerObject: #magnitude64BitIntegerFor:neg: #magnitude64BitValueOf: #positive32BitValueOf: #positive64BitValueOf: #positiveMachineIntegerValueOf: #primitiveAdd #primitiveAddLargeIntegers #primitiveAdoptInstance #primitiveAllInstances #primitiveAllObjects #primitiveArctan #primitiveArrayBecome #primitiveArrayBecomeOneWay #primitiveArrayBecomeOneWayCopyHash #primitiveArrayBecomeOneWayNoCopyHash #primitiveAsCharacter #primitiveAsFloat #primitiveAt #primitiveAtPut #primitiveBeCursor #primitiveBeDisplay #primitiveBeep #primitiveBehaviorHash #primitiveBitAnd #primitiveBitAndLargeIntegers #primitiveBitOr #primitiveBitOrLargeIntegers #primitiveBitShift #primitiveBitShiftLargeIntegers #primitiveBitXor #primitiveBitXorLargeIntegers #primitiveBytesLeft #primitiveCalloutToFFI #primitiveChangeClass #primitiveClass #primitiveClearVMProfile #primitiveClipboardText #primitiveClockLogAddresses #primitiveClosureValue #primitiveClosureValueNoContextSwitch #primitiveClosureValueWithArgs #primitiveCoarseLocalMicrosecondClock #primitiveCoarseUTCMicrosecondClock #primitiveCompareBytes #primitiveCompareWith #primitiveConstantFill #primitiveControlVMProfiling #primitiveCopyObject #primitiveCrashVM #primitiveDisablePowerManager #primitiveDiv #primitiveDivide #primitiveDivideLargeIntegers #primitiveDivLargeIntegers #primitiveEnterCriticalSection #primitiveEqual #primitiveEqualLargeIntegers #primitiveExitCriticalSection #primitiveExitToDebugger #primitiveExp #primitiveExponent #primitiveFail #primitiveFailForFFIException:at: #primitiveFailForOSError: #primitiveFailFor: #primitiveFailureCode #primitiveFetchNextMourner #primitiveFloatAdd #primitiveFloatAt #primitiveFloatAtPut #primitiveFloatDivide #primitiveFloatEqual #primitiveFloatGreaterOrEqual #primitiveFloatGreaterThan #primitiveFloatLessOrEqual #primitiveFloatLessThan #primitiveFloatMultiply #primitiveFloatNotEqual #primitiveFloatSubtract #primitiveFlushCache #primitiveFlushExternalPrimitives #primitiveForceDisplayUpdate #primitiveFormPrint #primitiveFractionalPart #primitiveFullClosureValue #primitiveFullClosureValueNoContextSwitch #primitiveFullClosureValueWithArgs #primitiveGetAttribute #primitiveGetenv #primitiveGetImmutability #primitiveGetLogDirectory #primitiveGetNextEvent #primitiveGetWindowLabel #primitiveGetWindowSize #primitiveGreaterOrEqual #primitiveGreaterOrEqualLargeIntegers #primitiveGreaterThan #primitiveGreaterThanLargeIntegers #primitiveGrowMemoryByAtLeast #primitiveHashMultiply #primitiveHeartbeatFrequency #primitiveHighResClock #primitiveIdentical #primitiveIdentityHash #primitiveImageFormatVersion #primitiveImageName #primitiveImmediateAsInteger #primitiveInputSemaphore #primitiveInputWord #primitiveIntegerAt #primitiveIntegerAtPut #primitiveInterruptChecksPerMSec #primitiveInterruptSemaphore #primitiveInvokeObjectAsMethod #primitiveIsBigEnder #primitiveIsPinned #primitiveIsWindowObscured #primitiveKbdNext #primitiveKbdPeek #primitiveLessOrEqual #primitiveLessOrEqualLargeIntegers #primitiveLessThan #primitiveLessThanLargeIntegers #primitiveListBuiltinModule #primitiveListExternalModule #primitiveLoadImageSegment #primitiveLocalMicrosecondClock #primitiveLogN #primitiveLowSpaceSemaphore #primitiveMakePoint #primitiveMaxIdentityHash #primitiveMethod #primitiveMillisecondClock #primitiveMillisecondClockMask #primitiveMod #primitiveModLargeIntegers #primitiveMouseButtons #primitiveMousePoint #primitiveMultiply #primitiveMultiplyLargeIntegers #primitiveNew #primitiveNewMethod #primitiveNewWithArg #primitiveNextInstance #primitiveNextObject #primitiveNoop #primitiveNotEqual #primitiveNotEqualLargeIntegers #primitiveNotIdentical #primitiveObjectAt #primitiveObjectAtPut #primitivePathToUsing #primitivePerformInSuperclass #primitivePerformWithArgs #primitiveProfilePrimitive #primitiveProfileSample #primitiveProfileSemaphore #primitiveProfileStart #primitiveQuit #primitiveQuo #primitiveQuoLargeIntegers #primitiveRelinquishProcessor #primitiveRemLargeIntegers #primitiveResume #primitiveScanCharacters #primitiveScreenDepth #primitiveScreenScaleFactor #primitiveScreenSize #primitiveSecondsClock #primitiveSetDisplayMode #primitiveSetFullScreen #primitiveSetImmutability #primitiveSetInterruptKey #primitiveSetLogDirectory #primitiveSetOrHasIdentityHash #primitiveSetWindowLabel #primitiveSetWindowSize #primitiveShortAt #primitiveShortAtPut #primitiveShowDisplayRect #primitiveSignal #primitiveSignalAtBytesLeft #primitiveSine #primitiveSize #primitiveSizeInBytes #primitiveSizeInBytesOfInstance #primitiveSmallFloatAdd #primitiveSmallFloatArctan #primitiveSmallFloatDivide #primitiveSmallFloatEqual #primitiveSmallFloatExp #primitiveSmallFloatExponent #primitiveSmallFloatFractionalPart #primitiveSmallFloatGreaterOrEqual #primitiveSmallFloatGreaterThan #primitiveSmallFloatLessOrEqual #primitiveSmallFloatLessThan #primitiveSmallFloatLogN #primitiveSmallFloatMultiply #primitiveSmallFloatNotEqual #primitiveSmallFloatSine #primitiveSmallFloatSquareRoot #primitiveSmallFloatSubtract #primitiveSmallFloatTimesTwoPower #primitiveSmallFloatTruncated #primitiveSnapshot #primitiveSnapshotEmbedded #primitiveSomeInstance #primitiveSomeObject #primitiveSpecialObjectsOop #primitiveSquareRoot #primitiveStoreImageSegment #primitiveStringAt #primitiveStringAtPut #primitiveStringReplace #primitiveSubtract #primitiveSubtractLargeIntegers #primitiveSuspend #primitiveTestAndSetOwnershipOfCriticalSection #primitiveTestDisplayDepth #primitiveTimesTwoPower #primitiveTruncated #primitiveUnloadModule #primitiveUpdateTimezone #primitiveUTCMicrosecondClock #primitiveUtcAndTimezoneOffset #primitiveUtcWithOffset #primitiveVMPath #primitiveVMProfileSamplesInto #primitiveWait #primitiveYield #signalNoResume: #signed32BitValueOf: #signed64BitValueOf: #signedMachineIntegerValueOf: #sizeOfAlienData: #startOfAlienData: #success: #initializeStack:numSlots:pageSize: #pageIndexFor: #addressAfter: #allocateSlotsForPinningInOldSpace:bytes:format:classIndex: #allocateSlotsInOldSpace:bytes:format:classIndex: #byteSwapped: #bytesInObject: #changeClassOf:to: #dbgFloatValueOf: #defaultEdenBytes #fetchClassTagOf: #fetchLong32:ofFloatObject: #floatObjectOf: #floatValueOf: #headerIndicatesAlternateBytecodeSet: #initFreeChunkWithBytes:at: #initSegmentBridgeWithBytes:at: #instantiateClass:indexableSize: #integerObjectOf: #integerValueOf: #isImmediateFloat: #isIntegerObject: #isIntegerValue: #isLilliputianSize: #isMarked: #isSmallFloatValue: #lengthOf:format: #maxSlotsForAlloc #numFreeLists #shorten:toIndexableSize: #smallFloatValueOf: #smallObjectBytesForSlots: #wordIndexableFormat #addToEphemeronList: #addToWeakList: #allNewSpaceObjectsHaveZeroRTRefCount #allWeakSurvivorsOnWeakList #computeRefCountToShrinkRT #copyAndForwardMourner: #copyAndForward: #copyToOldSpace:bytes:format: #firstCorpse: #growRememberedSet #isInRememberedSet: #isMaybeOldScavengeSurvivor: #isScavengeSurvivor: #is:onWeaklingList: #newSpaceCapacity #noUnfiredEphemeronsAtEndOfRememberedSet #openScavengeLog #printRememberedSet #processEphemerons #processWeaklings #processWeakSurvivor: #remember: #scavengeFutureSurvivorSpaceStartingAt: #scavengeLoop #scavengeReferentsOf: #scavengeRememberedSetStartingAt: #scavengerTenuringThreshold #scavengeUnfiredEphemeronsOnEphemeronList #writeScavengeLog #accessibleObjectAfter: #activeAndDeferredScan: #addFreeSubTree: #addGCRoot: #addressCouldBeObj: #addressCouldBeOop: #addToFreeList:bytes: #allInstancesOf: #allObjects #allObjectsUnmarked #allOldMarkedWeakObjectsOnWeaklingStack #allocateLargestFreeChunk #allocateNewSpaceSlots:format:classIndex: #allocateOldSpaceChunkOfBytes: #allocatePinnedSlots: #allocationUnit #allStrongSlotsOfWeaklingAreMarked: #allUnscannedEphemeronsAreActive #arrayFormat #assertInnerValidFreeObject: #becomeEffectFlagsFor: #become:with: #become:with:twoWay:copyHash: #beRootIfOld: #bitsSetInFreeSpaceMaskForAllFreeLists #bridgeSize #byteFormatMask #byteSizeOf: #characterObjectOf: #characterTable #characterValueOf: #checkedLongAt: #checkHeapFreeSpaceIntegrity #checkHeapIntegrity:classIndicesShouldBeValid: #checkOkayOop: #checkOopHasOkayClass: #checkOopIntegrity:named: #checkOopIntegrity:named:index: #classAlien #classArray #classAtIndex: #classAtIndex:put: #classBitmap #classByteArray #classCharacter #classExternalAddress #classExternalData #classExternalFunction #classExternalLibrary #classExternalStructure #classFloat #classFormatForInstanceFormat: #classIndexFieldWidth #classIndexOf: #classLargeNegativeInteger #classLargePositiveInteger #classOrNilAtIndex: #classPoint #classSemaphore #classSmallInteger #classString #classTableMinorIndexMask #classTablePageSize #classTableRootObj #classTableRootSlots #classTagForClass: #classUnsafeAlien #clearLeakMapAndMapAccessibleFreeSpace #clearLeakMapAndMapAccessibleObjects #cloneInOldSpace:forPinning: #clone: #compactClassIndexOf: #copyObj:toAddr:stopAt:savedFirstFields:index: #countMarkedAndUnmarkdObjects: #currentAllocatedBytes #displayObject #doScavenge: #eeInstantiateClassIndex:format:numSlots: #emptyObjStack: #ensureRoomOnObjStackAt: #enterIntoClassTable: #ephemeronFormat #existInstancesInNewSpaceOf: #expungeFromClassTable: #falseObject #fetchByte:ofObject: #fetchClassOfNonImm: #fetchClassOf: #fetchClassTagOfNonImm: #fetchLong32:ofObject: #fetchPointer:ofFreeChunk: #fetchPointer:ofObject: #findLargestFreeChunk #findStringBeginningWith: #findString: #firstAccessibleObject #firstFixedFieldOfMaybeImmediate: #firstFixedField: #firstIndexableField: #firstStringyFakeFormat #fixedFieldsOfClassFormatMask #fixedFieldsOfClassFormat: #fixedFieldsOfClass: #fixedFieldsOf:format:length: #fixFollowedField:ofObject:withInitialValue: #followField:ofObject: #followForwardedObjectFields:toDepth: #followForwarded: #followObjField:ofObject: #formatOfClass: #formatOf: #forwardedFormat #forwardersIn: #freeChunkNextIndex #freeChunkParentIndex #freeChunkPrevIndex #freeChunkWithBytes:at: #freeObject: #fullGC #getHeapGrowthToSizeGCRatio #goodContextSize: #growOldSpaceByAtLeast: #headerForSlots:format:classIndex: #headerForSlots:hash:format:classIndex: #hiddenRootSlots #hiddenRootsObject #imageSegmentVersion #immutableBitMask #incrementalGC #indexOf:in: #inFreeTreeReplace:with: #initialInstanceOf: #initializeNewSpaceVariables #initializeObjectMemory: #inOrderPrintFreeTree:printList: #inPlaceBecome:and:copyHashFlag: #instanceSizeOf: #instantiateClass: #instSpecOfClassFormat: #instSpecOfClass: #isAnyPointerFormat: #isArrayNonImm: #isArray: #isBytes: #isCharacterObject: #isCharacterValue: #isClassAtUniqueIndex: #isCompiledMethodFormat: #isCompiledMethod: #isContextHeader: #isContextNonImm: #isContext: #isCopiedIntoSegment: #isEmptyObjStack: #isEnumerableObjectNoAssert: #isEnumerableObject: #isEphemeronFormat: #isEphemeron: #isFixedSizePointerFormat: #isForwardedClassTag: #isForwarded: #isFreeObject: #isFreeOop: #isImmediate: #isInClassTable: #isIndexable: #isInEden: #isInFutureSpace: #isInMemory: #isInNewSpace: #isInOldSpace: #isInPastSpace: #isLargeFreeObject: #isMaybeFiredEphemeron: #isNonImmediate: #isObjEphemeron: #isObjImmutable: #isOldObject: #isOopCompiledMethod: #isOopForwarded: #isOopImmutable: #isOopMutable: #isPinned: #isPointers: #isPureBitsFormat: #isReallyYoungObject: #isReallyYoung: #isRemembered: #isSegmentBridge: #isUnambiguouslyForwarder: #isUnmarked: #isValidClassTag: #isValidObjStackAt: #isValidObjStackPage:myIndex: #isValidObjStackPage:myIndex:firstPage: #isValidObjStack: #isWeakFormat: #isWeakNonImm: #isWeak: #isWordsOrBytes: #isWords: #isYoungObject: #isYoung: #is:instanceOf:compactClassIndex: #is:onObjStack: #keyOfEphemeron: #knownClassAtIndex: #lastPointerFormat #lastPointerOfWhileSwizzling: #lastPointerOf: #leakCheckBecome #leakCheckFullGC #leakCheckIncremental #leakCheckNewSpaceGC #lengthOfMaybeImmediate: #lengthOf: #literalCountOfMethodHeader: #literalCountOf: #loadImageSegmentFrom:outPointers: #longPrintInstancesOf: #longPrintInstancesWithClassIndex: #longPrintReferencesTo: #mapExtraRoots #mapMournQueue #mapOopsFrom:to:outPointers:outHashes: #markAndTraceClassOf: #markAndTraceObjStack:andContents: #markAndTrace: #markInactiveEphemerons #markObjects: #markWeaklingsAndMarkAndFireEphemerons #maybeMethodClassOf:seemsToBeInstantiating: #maybeSplObj: #memoryActiveProcess #methodHeaderOf: #minSlotsForShortening #newObjectHash #newSpaceIsEmpty #nilObject #nilUnmarkedWeaklingSlots #noCheckClassAtIndex: #noCheckPush:onObjStack: #noFixupFollowField:ofObject: #noInlineObjectAfter:limit: #nonIndexablePointerFormat #noUnscannedEphemerons #numBytesOfBytes: #numBytesOf: #numPointerSlotsOf: #numSlotsOfAny: #numSlotsOf: #numStrongSlotsOfInephemeral: #numStrongSlotsOfWeakling: #objectAfter: #objectBefore: #objectStartingAt: #objectsReachableFromRoots: #obsoleteDontUseThisFetchWord:ofObject: #okayOop: #oldSpaceObjectAfter: #outOfPlaceBecome:and:copyHashFlag: #pinObject: #popObjStack: #popRemappableOop #postBecomeScanClassTable: #primitiveErrorTable #printActivationsOf: #printBogons #printContextReferencesTo: #printEntity: #printForwarders #printFreeChunks #printFreeChunk: #printFreeChunk:printAsTreeNode: #printFreeListHeads #printFreeList: #printFreeTree #printFreeTreeChunk: #printHeaderOf: #printHeaderTypeOf: #printInstancesOf: #printInstancesWithClassIndex: #printInvalidClassTableEntries #printMarkedOops #printMethodImplementorsOf: #printMethodReferencesTo: #printObjectsFrom:to: #printObjectsWithHash: #printObjStackPage:myIndex:pageType: #printObjStackPage:myIndex:tag: #printObjStack: #printOopsExcept: #printOopsFrom:to: #printOopsSuchThat: #printReferencesTo: #printUnmarkedOops #pushOnUnscannedEphemeronsStack: #pushRemappableOop: #queueMourner: #rawHashBitsOf: #relocateObjStackForPlanningCompactor: #removeGCRoot: #return:restoringObjectsIn:savedFirstFields:and:savedHashes: #return:restoringObjectsIn:upTo:savedFirstFields: #reverseBytesIn32BitWordsIn: #runLeakCheckerForFreeSpace: #runLeakCheckerFor: #runLeakCheckerFor:excludeUnmarkedObjs:classIndicesShouldBeValid: #scavengingGCTenuringIf: #setHeapBase:memoryLimit:endOfMemory: #shortPrintObjectsFrom:to: #shouldRemapOop: #sizeOfObjStack: #slidingCompactionInProgress #slotSizeOf: #splObj: #startOfObject: #statNumGCs #storeCheckBoundary #storeImageSegmentInto:outPointers:roots: #storePointerUnchecked:ofObject:withValue: #storePointer:ofObject:withValue: #stringForCString: #sufficientSpaceAfterGC: #swizzleObjStackAt: #tenuringIncrementalGC #topOfObjStack: #topRemappableOop #totalFreeListBytes #trueObject #unlinkFreeChunk:chunkBytes: #unlinkLilliputianChunk:index: #unlinkSolitaryFreeTreeNode: #unpinObject: #updateListStartingAt: #validClassTableHashes #validClassTableRootPages #validFreeTree #validFreeTreeChunk: #validFreeTreeChunk:parent: #validObjStacks #vmEndianness #compact #copyAndUnmarkMobileObjects #copyAndUnmark: #freeFrom:upTo:nextObject: #initializeScanCheckingForFullyCompactedHeap #isMobile: #isPostMobile: #planCompactSavingForwarders #reinitializeScanFrom: #remapObj: #savedFirstFieldsSpaceWasAllocated #scanForFirstFreeAndFirstMobileObjectFrom: #shouldRemapObj: #updatePointers #updatePointersIn:savedFirstFieldPointer: #useSegmentForSavedFirstFieldsSpace: #validRelocationPlanInPass: #segLimit #addSegmentOfSize: #adjustSegmentSwizzlesBy: #allBridgesMarked #allocateOrExtendSegmentInfos #bridgeAt: #bridgeFor: #bridgeFrom:to: #checkSegments #collapseSegmentsPostSwizzle #firstGapOfSizeAtLeast: #isEmptySegment: #isInSegments: #isValidSegmentBridge: #nextNonEmptySegmentAfter: #postSnapshot #prepareForSnapshot #readHeapFromImageFile:dataBytes: #segmentContainingObj: #segmentOverlap #shrinkObjectMemory: #someSegmentContainsPinned #swizzleObj: #totalBytesInSegments #writeImageSegmentsToFile: #writeSegment:nextSegment:toFile: #activeProcess #addIdleUsecs: #addLastLink:toList: #addNewMethodToCache: #addressCouldBeClassObj: #allOnesAsCharStar #argumentCountOfClosure: #argumentCountOfMethodHeader: #argumentCountOf: #arrayValueOf: #asciiOfCharacter: #assertValidExecutionPointe:r:s: #assertValidExecutionPointe:r:s:imbar:line: #booleanValueOf: #callbackEnter: #callbackLeave: #canContextSwitchIfActivating:header: #characterForAscii: #checkAllAccessibleObjectsOkay #checkCodeIntegrity: #checkDeliveryOfLongRunningPrimitiveSignal #checkedIntegerValueOf: #checkForEventsMayContextSwitch: #checkImageVersionFrom:startingAt: #checkInterpreterIntegrity #checkIsStillMarriedContext:currentFP: #checkOkayFields: #checkOkayInterpreterObjects: #checkOkayStackPage: #checkOkayStackZone: #checkProfileTick: #checkStackIntegrity #checkStackPointerForMaybeMarriedContext: #checkStackPointerIndexForFrame: #classNameOf:Is: #context:hasSender: #context:hasValidInversePCMappingOf:in: #copiedValueCountOfClosure: #copiedValueCountOfFullClosure: #copyBits #copyBitsFrom:to:at: #couldBeProcess: #cr #createActualMessageTo: #defaultNumStackPages #disownVM: #divorceAllFrames #divorceFramesIn: #doPrimitiveDiv:by: #doPrimitiveMod:by: #doSignalSemaphoreWithIndex: #dummyReferToProxy #dumpPrimTraceLog #ensureCallerContext: #ensureImageFormatIsUpToDate: #enterSmalltalkExecutiveImplementation #externalDivorceFrame:andContext: #externalEnsureIsBaseFrame: #externalInstVar:ofContext: #externalInstVar:ofContext:put: #externalQuickPrimitiveResponse #failUnbalancedPrimitive #fetchArray:ofObject: #fetchFloat:ofObject: #fetchInteger:ofObject: #fetchPointer:ofMarriedContext: #fetchStackPointerOf: #findClassContainingMethod:startingAt: #findClassOfMethod:forReceiver: #findFrameAbove:inPage: #findHomeForContext: #findMethodWithPrimitive:FromContext:UpToContext: #findNewMethodInClassTag: #findSelectorOfMethod: #findSPOf:on: #flushExternalPrimitiveOf: #followForwardedFrameContents:stackPointer: #followForwardingPointersInStackZone: #forceInterruptCheck #forceInterruptCheckFromHeartbeat #frameCallerContext: #frameContext: #frameHasContext: #frameIsBlockActivation: #frameMethodObject: #frameMethod: #frameNumArgs: #frameOfMarriedContext: #frameReceiver: #frameStackedReceiverOffset: #freeUntracedStackPages #fullDisplayUpdate #functionPointerFor:inClass: #getCurrentBytecode #getDesiredCogCodeSize #getErrorObjectFromPrimFailCode #getFullScreenFlag #getInterruptKeycode #getInterruptPending #getNextWakeupUsecs #getSavedWindowSize #getSnapshotScreenSize #getStackPointer #getThisSessionID #getWord32FromFile:swap: #handleForwardedSelectorFaultFor: #handleForwardedSendFaultForTag: #handleSpecialSelectorSendFaultFor:fp:sp: #handleStackOverflow #handleStackOverflowOrEventAllowContextSwitch: #highBit: #ifCurrentStackPageHasValidHeadPointers: #iframeMethod: #ifValidWriteBackStack:Pointers:Save:To: #includesBehavior:ThatOf: #instructionPointerForFrame:currentFP:currentIP: #interpreterAllocationReserveBytes #ioFilename:fromString:ofLength:resolveAliases: #isBaseFrame: #isBooleanObject: #isFloatObject: #isFrame:onPage: #isKindOfInteger: #isLargeIntegerObject: #isLargeNegativeIntegerObject: #isLargePositiveIntegerObject: #isLiveContext: #isMarriedOrWidowedContext: #isMetaPrimitiveIndex: #isPrimitiveFunctionPointerAnIndex #isQuickPrimitiveIndex: #isReadMediatedContextInstVarIndex: #isSingleContext: #isWidowedContextDuringGC: #isWidowedContext: #isWriteMediatedContextInstVarIndex: #is:KindOfClass: #is:KindOf: #is:MemberOf: #lengthOfNameOfClass: #literal:ofMethod: #loadBitBltFrom: #loadInitialContext #longPrintOop: #longStoreBytecodeForHeader: #lookupInMethodCacheSel:classTag: #lookupMethodInClass: #lookupOrdinaryNoMNUEtcInClass: #lookupSelector:inClass: #makeBaseFrameFor: #makeContextSnapshotSafe: #makePointwithxValue:yValue: #mapInterpreterOops #mapStackPages #markAndTraceStackPages: #markAndTraceStackPage: #markAndTraceUntracedReachableStackPages #marriedContext:pointsTo:stackDeltaForCurrentFrame: #marryContextInNewStackPageAndInitializeInterpreterRegisters: #marryFrame:SP: #maybeLeakCheckExternalPrimCall: #maybeSelectorOfMethod: #methodArgumentCount #methodClassAssociationOf: #methodClassOf: #methodHeaderIndicatesLargeFrame: #methodPrimitiveIndex #methodReturnBool: #methodReturnFloat: #methodReturnInteger: #methodReturnReceiver #methodReturnString: #methodReturnValue: #methodUsesAlternateBytecodeSet: #methodUsesPrimitiveErrorCode: #moduleUnloaded: #moveFramesIn:through:toPage: #nameOfClass: #noInlineTemporary:in: #noInlineTemporary:in:put: #noMarkedContextsOnPage: #numSlotsOfMarriedContext: #numStkPages #objCouldBeClassObj: #ownVM: #penultimateLiteralOf: #popStack #pop: #pop:thenPush: #positive32BitIntegerFor: #positive64BitIntegerFor: #positiveMachineIntegerFor: #postGCUpdateDisplayBits #primitiveEventProcessingControl #primitiveIndexOfMethod:header: #primitiveIndexOf: #printActivationNameForSelector:startClass: #printActivationNameFor:receiver:isBlock:firstTemporary: #printAllStacks #printCallStack #printCallStackFP: #printCallStackOf: #printCallStackOf:currentFP: #printChar: #printContextCallStackOf: #printContext: #printExternalHeadFrame #printFrameAndCallers:SP:short: #printFrameFlagsForFP: #printFrameOop:at: #printFramesInPage: #printFramesOnStackPageListInUse #printFrameThing:andFrame:at: #printFrameThing:at: #printFrame: #printFrame:WithSP: #printHexnp: #printHex: #printLikelyImplementorsOfSelector: #printMethodCache #printMethodCacheFor: #printMethodDictionaryOf: #printMethodDictionary: #printNameOfClass:count: #printNum: #printOopShort: #printOop: #printProcessStack: #printProcsOnList: #printStackCallStackOf: #printStackPageList #printStackPageListInUse #printStackPages #printStackPagesInUse #printStackPage:useCount: #printStackReferencesTo: #printStringOf: #print: #pushBool: #pushedReceiverOrClosureOfFrame: #pushFloat: #pushInteger: #push: #putLong:toFile: #putShort:toFile: #putToSleep:yieldingIf: #putWord32:toFile: #quickFetchInteger:ofObject: #readableFormat: #readImageFromFile:HeapSize:StartingAt: #reapAndResetErrorCodeTo:header: #reestablishContextPriorToCallback: #removeFirstLinkOfList: #resume:preemptedYieldingIf: #retryPrimitiveOnFailure #returnAs:ThroughCallback:Context: #reverseDisplayFrom:to: #rewriteMethodCacheEntryForExternalPrimitiveToFunction: #roomToPushNArgs: #safeMethodClassOf: #saneFunctionPointerForFailureOfPrimIndex: #sendInvokeCallbackContext: #sendInvokeCallback:Stack:Registers:Jmpbuf: #setBreakMNUSelector: #setBreakSelector: #setFullScreenFlag: #setInterruptCheckChain: #setInterruptKeycode: #setInterruptPending: #setNextWakeupUsecs: #setSavedWindowSize: #setSignalLowSpaceFlagAndSaveProcess #setTraceFlagOnContextsFramesPageIfNeeded: #shortPrintContext: #shortPrintFrameAndCallers: #shortPrintFramesInPage: #shortPrintFramesOnStackPageListInUse #shortPrintFrame: #shortPrintFrame:AndNCallers: #shortPrintOop: #shortReversePrintFrameAndCallers: #showDisplayBits:Left:Top:Right:Bottom: #signalExternalSemaphores #signed32BitIntegerFor: #signed64BitIntegerFor: #sizeOfCallPrimitiveBytecode: #sizeOfLongStoreTempBytecode: #sizeOfSTArrayFromCPrimitive: #snapshot: #space #specialSelector: #spurPostBecomeAction: #stackFloatValue: #stackIntegerValue: #stackLimitBytes #stackLimitOffset #stackObjectValue: #stackPageByteSize #stackPageHeadroom #stackPointerForMaybeMarriedContext: #stackPointerIndexForFrame: #stackPositiveMachineIntegerValue: #stackSignedMachineIntegerValue: #stackTop #stackValue: #startPCOfMethod: #stObject:at: #stObject:at:put: #storeInteger:ofObject:withValue: #storeSenderOfFrame:withValue: #stSizeOf: #superclassOf: #synchronousSignal: #tempCountOf: #temporaryCountOfMethodHeader: #transferTo: #ultimateLiteralOf: #unfollow:atIndex: #updateDisplayLeft:Top:Right:Bottom: #updateStateOfSpouseContextForFrame:WithSP: #validInstructionPointer:inFrame: #validInstructionPointer:inMethod:framePointer: #validStackPageBaseFrames #validStackPageBaseFrame: #voidLongRunningPrimitive: #voidVMStateForSnapshotFlushingExternalPrimitivesIf: #wakeHighestPriority #whereIs: #writeImageFileIO #cloneContext: #fieldOrSenderFP:ofContext: #field:ofFrame: #isAppropriateForCopyObject: #noInlineLoadFloatOrIntFrom: #primitiveAllVMParameters: #primitiveClone #primitiveClosureCopyWithCopiedValues #primitiveContextAt #primitiveContextAtPut #primitiveContextSize #primitiveContextXray #primitiveDeferDisplayUpdates #primitiveDoNamedPrimitiveWithArgs #primitiveDoPrimitiveWithArgs #primitiveExecuteMethod #primitiveExecuteMethodArgsArray #primitiveExternalCall #primitiveFindHandlerContext #primitiveFindNextUnwindContext #primitiveFlushCacheByMethod #primitiveFlushCacheBySelector #primitiveFullGC #primitiveGetVMParameter: #primitiveIncrementalGC #primitiveInstVarAt #primitiveInstVarAtPut #primitiveLongRunningPrimitive #primitiveLongRunningPrimitiveSemaphore #primitiveObjectPointsTo #primitivePerform #primitivePin #primitiveSetGCSemaphore #primitiveSignalAtMilliseconds #primitiveSignalAtUTCMicroseconds #primitiveSlotAt #primitiveSlotAtPut #primitiveStoreStackp #primitiveTerminateTo #primitiveVMParameter #primitiveVoidReceiver #primitiveVoidVMState #pruneStack:stackp: #unmarkAfterPathTo #unmarkAllFrames )
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> aStream [
	^ aStream
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> aStream: anObject [
	aStream := anObject
]

{ #category : #initialization }
PTCVisitor2CCallAdapter >> initialize [ 

	aStream := String new writeStream.
	codeGenerator := CCodeGenerator new.
	flag := false
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> selectorsToAdapt [
	^ selectorsToAdapt
]

{ #category : #accessing }
PTCVisitor2CCallAdapter >> selectorsToAdapt: anObject [
	selectorsToAdapt := anObject
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgument: anPTASTArgument [
	<generated>
	^ anPTASTArgument argument
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgumentCall: anPTASTArgumentCall [
	<generated>
	^ anPTASTArgumentCall argument
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgumentChain: aPTASTArgumentChain [
	<generated>
	super visitAll: aPTASTArgumentChain arguments
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArguments: aPTASTArguments [
	<generated>
	| arguments |
	arguments := aPTASTArguments arguments.
	flag
		ifTrue: [ arguments = '(void)'
				ifTrue: [ ^ aStream nextPutAll: '(struct foo * self)' ].
			arguments = '()'
				ifTrue: [ ^ aStream nextPutAll: '(struct foo * self)' ].
			aStream
				nextPutAll: arguments allButLast;
				nextPutAll: ', struct foo * self)' ]
		ifFalse: [ aStream nextPutAll: arguments ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTArgumentsCall: anPTASTArgumentsCall [

	flag
		ifTrue: [ anPTASTArgumentsCall isNull
				ifTrue: [ anPTASTArgumentsCall arguments
						add: (PTASTCrap new crap: 'interpreterProxy->interpreterState')
						before: anPTASTArgumentsCall arguments last ]
				ifFalse: [ anPTASTArgumentsCall isVoid
						ifFalse: [ anPTASTArgumentsCall arguments
								add: (PTASTCrap new crap: ', interpreterProxy->interpreterState')
								beforeIndex: anPTASTArgumentsCall arguments size] ] ].
	self visitAll: anPTASTArgumentsCall arguments
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTCFile: anPTASTCFile [
	<generated>
	^ super visitPTASTCFile: anPTASTCFile
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTCrap: anPTASTCrap [
	anPTASTCrap crap class = ByteString
		ifTrue: [ aStream nextPutAll: anPTASTCrap crap ]
		ifFalse: [ aStream nextPut: anPTASTCrap crap ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTEndStatement: anPTASTEndStatement [
	aStream nextPutAll: anPTASTEndStatement endStatement.
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration [
	super
		visitPTASTFonctionPointerDeclaration: aPTASTFonctionPointerDeclaration.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionCall: anPTASTFunctionCall [
	<generated>

	super visitPTASTFunctionCall: anPTASTFunctionCall.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionDeclaration: aPTASTFunctionDeclaration [
	super
		visitPTASTFunctionDeclaration: aPTASTFunctionDeclaration.
	flag := false
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTFunctionPointer: anPTASTFunctionPointer [
	<generated>
	| functionPointerName |
	functionPointerName := anPTASTFunctionPointer functionPointer.
	aStream nextPutAll: functionPointerName.
	(selectorsToAdapt
		anySatisfy: [ :s | ('(*' ,(codeGenerator cFunctionNameFor: s selector), ')') = functionPointerName ])
		ifTrue: [ flag := true ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTIdentifier: anPTASTIdentifier [
		
	| identifier |
	identifier := anPTASTIdentifier identifier.
	aStream nextPutAll: identifier.
	(identifier = 'EXPORT') ifTrue:[flag := false. ^self ].
	(selectorsToAdapt
		anySatisfy: [ :s | (codeGenerator cFunctionNameFor: s selector) = identifier ])
		ifTrue: [ flag := true ]
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTPreproc: anPTASTPrepoc [
	<generated>
	^ anPTASTPrepoc identifier
]

{ #category : #visiting }
PTCVisitor2CCallAdapter >> visitPTASTType: anPTASTType [
	<generated>
	aStream nextPutAll: anPTASTType type.
]
