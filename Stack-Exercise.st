!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'FV 6/10/2021 15:12:08'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JP 6/9/2021 14:47:31'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'FV 6/10/2021 15:57:04'!
test11StackLimitCannotBeNegative


	self should: [ OOStack newWithSizeLimit: -1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackSizeLimitCannotBeNegativeErrorDescription ]! !

!OOStackTest methodsFor: 'test' stamp: 'FV 6/10/2021 15:57:36'!
test12StackLimitCannotBeFloat


	self should: [ OOStack newWithSizeLimit: 4.5 . ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackSizeLimitCannotBeFloatErrorDescription ]! !

!OOStackTest methodsFor: 'test' stamp: 'FV 6/10/2021 15:57:48'!
test13StackLimitCannotBeZero.


	self should: [ OOStack newWithSizeLimit: 0 . ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackSizeLimitCannotBeZeroErrorDescription ]! !

!OOStackTest methodsFor: 'test' stamp: 'FV 6/10/2021 16:09:52'!
test14CanPushElementsInLimitedStack
	| stack |
	
	stack := OOStack newWithSizeLimit: 3.
	stack push: 'An element'.
	
	self assert: stack pop equals: 'An element'.! !

!OOStackTest methodsFor: 'test' stamp: 'FV 6/10/2021 16:10:38'!
test15CannotStackBeyondLimit
	| stack |
	
	stack := OOStack newWithSizeLimit: 3.
	stack push: 'An element'.
	stack push: 'A second element'.
	stack push: 'A third element'.
	
	
	self should: [ stack push: 'A fourth element' ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackAtFullCapacityErrorDescription.
			self assert: stack size equals: 3.
			self assert: stack top equals: 'A third element'].! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:00:51'!
setUp

	stack := OOStack new.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:26:07'!
test01SentenceFinderShouldFailWhenPrefixIsEmpty
	|prefix|
	
	prefix := ''.
	stack push: 'Hola'.
	
	self should: [ SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixError ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:26:27'!
test02SentenceFinderShouldFailWhenPrefixHasASpace
	|prefix|
	
	prefix := 'H '.
	stack push: 'H ola'.
	
	self should: [ SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpaceError ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:06:04'!
test03SentenceFinderShouldNotFindAnythingWithNonMatchingPrefix
		
	|prefix resultsCollection sentenceFinder|
	
	prefix := 'Hi'.
	stack push: 'sentence1'	.
	stack push: 'sentence2'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	resultsCollection := sentenceFinder find.
	
	self assert: resultsCollection isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:06:11'!
test04SentenceFinderShouldFindTheSentenceWithMatchingPrefix
		
	|prefix resultsCollection sentenceFinder|
	
	prefix := 'se'.
	stack push: 'sentence'	.
	stack push: 'not a sentence'.
	stack push: 'not another sentence'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	resultsCollection := sentenceFinder find.
	
	self assert: resultsCollection size equals: 1.
	self assert: (resultsCollection at: 1) equals: 'sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:26:49'!
test05SentenceFinderShouldFindAllTheSentencesWithMatchingPrefix
		
	|prefix resultsCollection sentenceFinder|
	
	prefix := 'not'.
	stack push: 'sentence'	.
	stack push: 'not a sentence'.
	stack push: 'not another sentence'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	resultsCollection := sentenceFinder find.
	
	self assert: resultsCollection size equals: 2.
	self assert: (resultsCollection at: 1) equals: 'not another sentence'.
	self assert: (resultsCollection at: 2) equals: 'not a sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:06:41'!
test06SentenceFinderIsCaseSensitive
		
	|prefix resultsCollection sentenceFinder|
	
	prefix := 'Not'.
	stack push: 'sentence'	.
	stack push: 'Not a sentence'.
	stack push: 'not another sentence'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	resultsCollection := sentenceFinder find.
	
	self assert: resultsCollection size equals: 1.
	self assert: (resultsCollection at: 1) equals: 'Not a sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:06:35'!
test07SentenceFinderDoesNotModifyStack
		
	|prefix sentenceFinder|
	
	prefix := 'not'.
	stack push: 'sentence'	.
	stack push: 'notASentence'.
	stack push: 'notAnotherSentence'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	
	sentenceFinder find.
	
	self assert: stack size equals: 3.
	self assert: stack pop equals: 'notAnotherSentence'.
	self assert: stack pop equals: 'notASentence'.
	self assert: stack pop equals: 'sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:07:01'!
test08SentenceFinderDoesNotFailWhenPrefixIsLargerThanSentence
		
	|prefix resultsCollection sentenceFinder|
	
	prefix := 'ThisIsAReallyLongPrefix'.
	stack push: 'sentence'	.
	stack push: 'another sentence'.
	stack push: 'ThisIsAReallyLongPrefixButItMatches'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	
	resultsCollection := sentenceFinder find.
	
	self assert: resultsCollection size equals: 1.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:08:17'!
test09SentenceFinderShouldNotFailWhenEmptyStack
		
	|prefix resultsCollection sentenceFinder|
	
	prefix := 'aPrefix'.
	sentenceFinder := SentenceFinderByPrefix newWithStack: stack andPrefix: prefix.
	
	resultsCollection := sentenceFinder find.
	
	self assert: resultsCollection isEmpty.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/5/2021 16:14:55'!
isEmpty
	^ stackedElements isEmpty.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/8/2021 22:27:55'!
pop
	|stackTop|
	
	stackTop := self top.
	stackedElements removeLast.
	^stackTop.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/10/2021 15:15:57'!
push: anElement
	self subclassResponsibility.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/5/2021 16:27:18'!
size
	^stackedElements size.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/10/2021 16:46:11'!
top
	|stackTopVisualizer|
	stackTopVisualizer := OOStackTopVisualizer initializeWith: stackedElements.
	^stackTopVisualizer seeTop.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 15:28:33'!
new
	^OOUnlimitedStack basicNew initialize.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 16:01:28'!
newWithSizeLimit: aSizeLimit
	aSizeLimit isFloat ifTrue: [^self error: self stackSizeLimitCannotBeFloatErrorDescription ].
	aSizeLimit isZero ifTrue: [^self error: self stackSizeLimitCannotBeZeroErrorDescription ].
	aSizeLimit < 0 ifTrue: [^self error: self stackSizeLimitCannotBeNegativeErrorDescription ].

	
	
	^ OOLimitedStack basicNew initializeWith: aSizeLimit.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 16:06:28'!
stackAtFullCapacityErrorDescription
	^ 'Stack is already at full capacity'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 15:42:36'!
stackInvalidSizeLimitErrorDescription
	^ 'Stack size must be a positive integer'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 15:56:42'!
stackSizeLimitCannotBeFloatErrorDescription
	^ 'Stack limit size cannot be Float'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 15:56:22'!
stackSizeLimitCannotBeNegativeErrorDescription
	^ 'Stack limit size cannot be Negative'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/10/2021 15:56:12'!
stackSizeLimitCannotBeZeroErrorDescription
	^ 'Stack limit size cannot be Zero'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'sizeLimit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:35:36'!
initializeWith: aSizeLimit
	sizeLimit := aSizeLimit.
	stackedElements := OrderedCollection new.! !

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:55:19'!
push: anElement

	"Para que el stack pueda tener un límite primero pensamos en que tenga un colaborador interno que represente la capacidad, y en el push con un if nos fijabamos si ya 
	estaba en el límite o no. A la hora de sacar el if fue una situación similar con la del top. La jerarquía resultante parecería sobrecomplejizar el modelo para simplemente
	quitar 2 ifs que parecerían ser de control, por lo que no es una buena idea. No creemos que resulte en un mejor modelo el quitar los ifs de Top y Push."
	
	|stackElementPusher|
	stackElementPusher := OOStackElementPusher newWithElements: stackedElements andSizeLimit: sizeLimit.
	^stackElementPusher pushElement: anElement.! !


!classDefinition: #OOUnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOUnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStack methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:33:34'!
initialize
	stackedElements := OrderedCollection new.! !

!OOUnlimitedStack methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 15:15:42'!
push: anElement
	^stackedElements addLast: anElement.! !


!classDefinition: #OOStackElementPusher category: 'Stack-Exercise'!
Object subclass: #OOStackElementPusher
	instanceVariableNames: 'stackedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElementPusher methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:29:37'!
pushElement: anElement
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackElementPusher class' category: 'Stack-Exercise'!
OOStackElementPusher class
	instanceVariableNames: ''!

!OOStackElementPusher class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:34:05'!
isAValidSetOfStackedElements: aSetOfStackedElements atThisSizeLimit: aSizeLimit
	self subclassResponsibility.! !

!OOStackElementPusher class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:40:35'!
newWithElements: aSetOfStackedElements andSizeLimit: aSizeLimit

	|validClass|
	
	validClass := OOStackElementPusher allSubclasses detect: [:aClass| aClass isAValidSetOfStackedElements: aSetOfStackedElements atThisSizeLimit: aSizeLimit].
	
	^validClass new initializeWith: aSetOfStackedElements.! !


!classDefinition: #OOStackAtLimitElementPusher category: 'Stack-Exercise'!
OOStackElementPusher subclass: #OOStackAtLimitElementPusher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackAtLimitElementPusher methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:46:11'!
initializeWith: aSetOfStackedElements! !

!OOStackAtLimitElementPusher methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:29:37'!
pushElement: anElement
	^ self error: self class stackAtFullCapacityErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackAtLimitElementPusher class' category: 'Stack-Exercise'!
OOStackAtLimitElementPusher class
	instanceVariableNames: ''!

!OOStackAtLimitElementPusher class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:34:40'!
isAValidSetOfStackedElements: aSetOfStackedElements atThisSizeLimit: aSizeLimit
	 ^ aSetOfStackedElements size = aSizeLimit.! !

!OOStackAtLimitElementPusher class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:50:23'!
stackAtFullCapacityErrorDescription
	^OOStack stackAtFullCapacityErrorDescription.! !


!classDefinition: #OOStackNotAtLimitElementPusher category: 'Stack-Exercise'!
OOStackElementPusher subclass: #OOStackNotAtLimitElementPusher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotAtLimitElementPusher methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:46:11'!
initializeWith: aSetOfStackedElements 
	stackedElements := aSetOfStackedElements.! !

!OOStackNotAtLimitElementPusher methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:29:37'!
pushElement: anElement
	^stackedElements addLast: anElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotAtLimitElementPusher class' category: 'Stack-Exercise'!
OOStackNotAtLimitElementPusher class
	instanceVariableNames: ''!

!OOStackNotAtLimitElementPusher class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:35:10'!
isAValidSetOfStackedElements: aSetOfStackedElements atThisSizeLimit: aSizeLimit
	^ aSetOfStackedElements size < aSizeLimit.! !


!classDefinition: #OOStackTopVisualizer category: 'Stack-Exercise'!
Object subclass: #OOStackTopVisualizer
	instanceVariableNames: 'stackedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:14:35'!
initializeWith: aSetOfStackedElements.
	self subclassResponsibility.! !

!OOStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:10:28'!
seeTop
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTopVisualizer class' category: 'Stack-Exercise'!
OOStackTopVisualizer class
	instanceVariableNames: ''!

!OOStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:46:11'!
initializeWith: aSetOfStackedElements
	|validClass|
	validClass := OOStackTopVisualizer allSubclasses detect: [:aClass| aClass isAValidSetOfStackedElements: aSetOfStackedElements].
	^validClass new initializeWith: aSetOfStackedElements.! !

!OOStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:16:47'!
isAValidSetOfStackedElements: aSetOfStackedElements
	self subclassResponsibility! !


!classDefinition: #OOEmptyStackTopVisualizer category: 'Stack-Exercise'!
OOStackTopVisualizer subclass: #OOEmptyStackTopVisualizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:14:44'!
initializeWith: aSetOfStackedElements.
	! !

!OOEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:10:28'!
seeTop
	^self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackTopVisualizer class' category: 'Stack-Exercise'!
OOEmptyStackTopVisualizer class
	instanceVariableNames: ''!

!OOEmptyStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:19:25'!
isAValidSetOfStackedElements: aSetOfStackedElements
	^ aSetOfStackedElements isEmpty.! !

!OOEmptyStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:48:31'!
stackEmptyErrorDescription


	^ OOStack stackEmptyErrorDescription.! !


!classDefinition: #OONonEmptyStackTopVisualizer category: 'Stack-Exercise'!
OOStackTopVisualizer subclass: #OONonEmptyStackTopVisualizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONonEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:15:03'!
initializeWith: aSetOfStackedElements
	stackedElements := aSetOfStackedElements.! !

!OONonEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:10:28'!
seeTop
	^stackedElements last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONonEmptyStackTopVisualizer class' category: 'Stack-Exercise'!
OONonEmptyStackTopVisualizer class
	instanceVariableNames: ''!

!OONonEmptyStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:19:49'!
isAValidSetOfStackedElements: aSetOfStackedElements
	^ aSetOfStackedElements isEmpty not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefix auxiliarStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FV 6/10/2021 14:18:39'!
isPrefixInSentence: aSentence
	|substringSentence|
	aSentence size < prefix size ifTrue: [^ false].
	
	substringSentence := aSentence copyFrom: 1 to: prefix size.
	^ substringSentence = prefix.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FV 6/10/2021 14:58:26'!
popStackAndIfMatchesWithPrefixAddToCollection: aCollectionOfValidSentences

		|aSentence| 	
		aSentence := stack pop.
		auxiliarStack push: aSentence.
		(self isPrefixInSentence: aSentence ) ifTrue: [aCollectionOfValidSentences add: aSentence].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FV 6/10/2021 14:45:34'!
rebuildOriginalStack
	[auxiliarStack isEmpty] whileFalse: [stack push: (auxiliarStack pop)].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FV 6/10/2021 14:09:31'!
initializeWithStack: aStack andPrefix: aPrefix
	stack := aStack.
	prefix := aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 14:59:24'!
find

	|aCollectionOfValidSentences |
	
	auxiliarStack  := OOStack new.
	aCollectionOfValidSentences := OrderedCollection new.
	
	[stack isEmpty] whileFalse: [self popStackAndIfMatchesWithPrefixAddToCollection: aCollectionOfValidSentences].
	self rebuildOriginalStack.		
	
	^aCollectionOfValidSentences. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'JP 6/9/2021 14:37:28'!
emptyPrefixError

	^ 'The prefix cannot be Empty'! !

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'FV 6/8/2021 23:41:37'!
prefixHasSpaceError
	^ 'The prefix cannot have any spaces'! !


!SentenceFinderByPrefix class methodsFor: 'private' stamp: 'FV 6/10/2021 14:13:43'!
charIsSpace: aChar
	^ aChar ~= $ .! !

!SentenceFinderByPrefix class methodsFor: 'private' stamp: 'FV 6/10/2021 14:13:17'!
stringContainSpaces: aString

	^(aString allSatisfy: [:aChar| self charIsSpace: aChar ]) not.! !


!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 16:46:11'!
initializeWith: aStack
	^self new initializeWith: aStack.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FV 6/10/2021 14:15:10'!
newWithStack: aStack andPrefix: aPrefix
	"Aca planteamos que Prefix sea una clase con la siguiente jerarquia:
		Prefix
			InvalidPrefix
				EmptyPrefix
				SpacedPrefix
			ValidPrefix
	con el objetivo de quitarlos siguientes ifs vía el concepto de Switch dinamico, pero sobrecomplejizaba la solución. Por lo que decidimos dejar los ifs.
	"
	aPrefix isEmpty ifTrue: [^self error:  self emptyPrefixError].
	(self stringContainSpaces: aPrefix ) ifTrue: [^self error: self prefixHasSpaceError].
	
	
	^self new initializeWithStack: aStack andPrefix: aPrefix.! !
