!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:47:22'!
assertThat: aMarsRover whenExecuting: aCommandChain itsLog: marsRoverLog isEqualTo: expectedLog

	aMarsRover processCommands: aCommandChain.
	self assert: 	marsRoverLog log equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 17:30:35'!
createMarsRoverAt: aStartingPoint heading: aCardinalPoint withCompleteLog: aMarsRoverLog
	| marsRover |
	
	marsRover := MarsRover startingAt: aStartingPoint heading: aCardinalPoint.
	marsRover addPositionObserver: aMarsRoverLog.
	marsRover addOrientationObserver: aMarsRoverLog.
	^marsRover.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:48:58'!
test01MarsRoverLogIsEmptyWhenNoCommandsWereGiven
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #North withCompleteLog: marsRoverLog.

	expectedLog := ReadWriteStream with: ''.
	self assertThat: marsRover whenExecuting: '' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:49:33'!
test02MarsRoverLogUpdatesWhenMovingUp
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #North withCompleteLog: marsRoverLog.
	
	expectedLog := ReadWriteStream with: '0@1'.
	self assertThat: marsRover whenExecuting: 'f' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:49:45'!
test03MarsRoverLogUpdatesWhenMovingDown

	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #North withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: '0@-1'.
	self assertThat: marsRover whenExecuting: 'b' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:49:56'!
test04MarsRoverLogUpdatesWhenMovingLeft
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #West withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: '-1@0'.
	
	self assertThat: marsRover whenExecuting: 'f' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:50:02'!
test05MarsRoverLogUpdatesWhenMovingRight
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #West withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: '1@0'.
	
	self assertThat: marsRover whenExecuting: 'b' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:50:10'!
test06MarsRoverLogUpdatesWhenHeadingWest

	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #North withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: 'West'.
	
		self assertThat: marsRover whenExecuting: 'l' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:50:17'!
test07MarsRoverLogUpdatesWhenHeadingEast

	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #North withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: 'East'.
	self assertThat: marsRover whenExecuting: 'r' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:50:25'!
test08MarsRoverLogUpdatesWhenHeadingNorth
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #East withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: 'North'.
		self assertThat: marsRover whenExecuting: 'l' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:50:31'!
test09MarsRoverLogUpdatesWhenHeadingSouth
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #West withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: 'South'.
	
	self assertThat: marsRover whenExecuting: 'l' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 15:51:41'!
test10MarsRoverLogKeepsUpWithMultipleCommands
	
	| marsRover marsRoverLog expectedLog |
	
	marsRoverLog := MarsRoverLog new.
	marsRover := self createMarsRoverAt: (0@0) heading: #North withCompleteLog: marsRoverLog.
	expectedLog := ReadWriteStream with: '0@1'.	expectedLog newLine.	expectedLog nextPutAll: 'East'. 	self assertThat: marsRover whenExecuting: 'fr' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:23:40'!
test11MarsRoverLogCanLogPositionUpdatesOnly
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.	marsRoverLog := MarsRoverLog new.
	marsRover addPositionObserver: marsRoverLog.
	expectedLog := ReadWriteStream with: '0@1'.
		self assertThat: marsRover whenExecuting: 'fr' itsLog: marsRoverLog isEqualTo: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:23:34'!
test12MarsRoverLogCanLogRotationUpdatesOnly
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.	marsRoverLog := MarsRoverLog new.
	marsRover addOrientationObserver: marsRoverLog.
	expectedLog := ReadWriteStream with: 'East'.
	self assertThat: marsRover whenExecuting: 'fr' itsLog: marsRoverLog isEqualTo: expectedLog.! !


!classDefinition: #TestMarsRoverWindow category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
assertThatAMarsRoverStartingAt: aStartingPosition heading: aStartingOrientation executing: aCommandChain aCompleteWindowShowThePosition: anExpectedMarsRoverWindowPosition andTheOrientation: anExpectedMarsRoverWindowOrientation

	| marsRover marsRoverWindow|
	
	marsRover := MarsRover startingAt: aStartingPosition heading: aStartingOrientation.
	marsRoverWindow := MarsRoverWindow new.
	marsRover addPositionObserver: marsRoverWindow.
	marsRover addOrientationObserver: marsRoverWindow.
	marsRover processCommands: aCommandChain.
	
	self assert: marsRoverWindow visualizePosition equals: anExpectedMarsRoverWindowPosition .
	self assert: marsRoverWindow visualizeOrientation equals: anExpectedMarsRoverWindowOrientation .
	! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test01MarsRoverLogIsStartingStatusWhenNoCommandsWereGiven
	self assertThatAMarsRoverStartingAt: (0@0) heading: #North executing: '' aCompleteWindowShowThePosition: '' andTheOrientation: ''.

! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test02MarsRoverWindowUpdatesWhenMovingUp

	self assertThatAMarsRoverStartingAt: (0@0) heading: #North executing: 'f' aCompleteWindowShowThePosition: '0@1' andTheOrientation: ''.
	! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test03MarsRoverWindowUpdatesWhenMovingDown	self assertThatAMarsRoverStartingAt: (0@0) heading: #North executing: 'b' aCompleteWindowShowThePosition: '0@-1' andTheOrientation: ''.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test04MarsRoverWindowUpdatesWhenMovingLeft

	self assertThatAMarsRoverStartingAt: (0@0) heading: #West executing: 'f' aCompleteWindowShowThePosition: '-1@0' andTheOrientation: ''.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test05MarsRoverWindowUpdatesWhenMovingRight

	self assertThatAMarsRoverStartingAt: (0@0) heading: #East executing: 'f' aCompleteWindowShowThePosition: '1@0' andTheOrientation: ''.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test06MarsRoverWindowUpdatesWhenHeadingWest	
	self assertThatAMarsRoverStartingAt: (0@0) heading: #North executing: 'l' aCompleteWindowShowThePosition: '' andTheOrientation: 'West'.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test07MarsRoverWindowUpdatesWhenHeadingEast
	self assertThatAMarsRoverStartingAt: (0@0) heading: #North executing: 'r' aCompleteWindowShowThePosition: '' andTheOrientation: 'East'.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test08MarsRoverWindowUpdatesWhenHeadingNorth
	self assertThatAMarsRoverStartingAt: (0@0) heading: #East executing: 'l' aCompleteWindowShowThePosition: '' andTheOrientation: 'North'.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:25:08'!
test09MarsRoverWindowUpdatesWhenHeadingSouth
	self assertThatAMarsRoverStartingAt: (0@0) heading: #West executing: 'l' aCompleteWindowShowThePosition: '' andTheOrientation: 'South'.
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:23:49'!
test10MarsRoverWindowCanShowPositionUpdatesOnly
	| marsRover marsRoverWindow |
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	marsRoverWindow := MarsRoverWindow new.
	marsRover addPositionObserver: marsRoverWindow.
	marsRover processCommands: 'fr'.
	
	self assert: marsRoverWindow visualizePosition equals: '0@1'.
	self assert: marsRoverWindow visualizeOrientation equals: ''.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 16:23:55'!
test11MarsRoverWindowCanShowRotationUpdatesOnly

	| marsRover marsRoverWindow |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	marsRoverWindow := MarsRoverWindow new.
	marsRover addOrientationObserver: marsRoverWindow.
	marsRover processCommands: 'fr'.
	
	self assert: marsRoverWindow visualizePosition equals: ''.
	self assert: marsRoverWindow visualizeOrientation equals: 'East'.! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'FV 7/22/2021 15:38:14'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := ObservableCollaborator newWith: aPosition withUpdateMessage: #updatePosition:.
	head := ObservableCollaborator newWith: (MarsRoverHead of: self facing: aCardinalPoint) withUpdateMessage: #updateOrientation:.
! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'FV 7/21/2021 18:07:09'!
isAt: aPosition heading: aCardinalPoint

	^ position value = aPosition and: [ head value isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'FV 7/21/2021 19:35:49'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head value movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head value movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head value rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head value rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'FV 7/19/2021 20:58:09'!
moveDown
	self updatePosition: 0@-1.
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'FV 7/19/2021 20:58:00'!
moveLeft
	self updatePosition: -1@0.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'FV 7/19/2021 20:57:49'!
moveRight
	self updatePosition: 1@0.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'FV 7/21/2021 20:19:53'!
moveUp
	self updatePosition: 0@1.
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'FV 7/22/2021 15:58:38'!
updatePosition: aMovementUnit

	position updateValue: (position value) + aMovementUnit.! !


!MarsRover methodsFor: 'dd - heading' stamp: 'FV 7/21/2021 16:43:25'!
headEast
	self updateCurrentHead: MarsRoverHeadFacingEast.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'FV 7/21/2021 16:43:39'!
headNorth
	self updateCurrentHead: MarsRoverHeadFacingNorth.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'FV 7/21/2021 16:43:48'!
headSouth
	self updateCurrentHead: MarsRoverHeadFacingSouth.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'FV 7/21/2021 16:43:56'!
headWest
	self updateCurrentHead: MarsRoverHeadFacingWest.
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'FV 7/21/2021 17:51:27'!
updateCurrentHead: aMarsRoverHead

	head updateValue: (aMarsRoverHead of: self).! !


!MarsRover methodsFor: 'observers setters' stamp: 'FV 7/21/2021 19:45:36'!
addOrientationObserver: anOrientationObserver
	
	head addObserver: anOrientationObserver.! !

!MarsRover methodsFor: 'observers setters' stamp: 'FV 7/21/2021 18:05:11'!
addPositionObserver: aPositionObserver

	position addObserver: aPositionObserver.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 19:24:07'!
representOn: aVisitor
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 20:27:38'!
representOn: aVisitor
	aVisitor representAnEastHeadedMarsRover: self.! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 20:27:45'!
representOn: aVisitor
	aVisitor representANorthHeadedMarsRover: self.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 20:28:13'!
representOn: aVisitor
	aVisitor representASouthHeadedMarsRover: self.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 20:28:05'!
representOn: aVisitor
	aVisitor representAWestHeadedMarsRover: self.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'observers updates' stamp: 'FV 7/21/2021 20:26:36'!
updateOrientation: aMarsRoverHead
	
	aMarsRoverHead representOn: self.! !

!MarsRoverLog methodsFor: 'observers updates' stamp: 'FV 7/21/2021 16:48:21'!
updatePosition: aPosition
	self writeInLog: aPosition asString.! !


!MarsRoverLog methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:26:13'!
representANorthHeadedMarsRover: aMarsRoverHeadFacingNorth
	self writeInLog: 'North'.! !

!MarsRoverLog methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:26:42'!
representASouthHeadedMarsRover: aMarsRoverHeadFacingSouth
	self writeInLog: 'South'.! !

!MarsRoverLog methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:27:21'!
representAWestHeadedMarsRover: aMarsRoverHeadFacingWest
	self writeInLog: 'West'.! !

!MarsRoverLog methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:25:35'!
representAnEastHeadedMarsRover: aMarsRoverHeadFacingEast
	self writeInLog: 'East'.! !


!MarsRoverLog methodsFor: 'private' stamp: 'FV 7/21/2021 16:48:21'!
writeInLog: aString
	log position = 0 ifFalse: [log newLine.].
	log nextPutAll: aString.! !


!MarsRoverLog methodsFor: 'main protocol' stamp: 'FV 7/19/2021 21:08:55'!
log
	^log copy.! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'FV 7/21/2021 15:40:44'!
initialize
	log := ReadWriteStream with: ''.! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'actualPosition actualOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:28:46'!
representANorthHeadedMarsRover: aNorthHeadedMarsRover
	actualOrientation := 'North'! !

!MarsRoverWindow methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:28:59'!
representASouthHeadedMarsRover: aSouthHeadedMarsRover
	actualOrientation := 'South'! !

!MarsRoverWindow methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:29:11'!
representAWestHeadedMarsRover: aWestHeadedMarsRover
	actualOrientation := 'West'! !

!MarsRoverWindow methodsFor: 'rotation head representation' stamp: 'FV 7/21/2021 19:28:34'!
representAnEastHeadedMarsRover: anEastHeadedMarsRover
	actualOrientation := 'East'! !


!MarsRoverWindow methodsFor: 'observers update' stamp: 'FV 7/21/2021 19:27:57'!
updateOrientation: aMarsRoverHead
	aMarsRoverHead representOn: self.! !

!MarsRoverWindow methodsFor: 'observers update' stamp: 'FV 7/21/2021 19:29:25'!
updatePosition: aNewPosition

	actualPosition := aNewPosition.! !


!MarsRoverWindow methodsFor: 'main protocol' stamp: 'FV 7/21/2021 16:17:09'!
visualizeOrientation
	^actualOrientation.
! !

!MarsRoverWindow methodsFor: 'main protocol' stamp: 'FV 7/21/2021 16:19:49'!
visualizePosition
	^actualPosition asString.! !


!MarsRoverWindow methodsFor: 'initialization' stamp: 'FV 7/21/2021 16:21:55'!
initialize
	actualPosition := ''.
	actualOrientation := ''.! !


!classDefinition: #ObservableCollaborator category: 'MarsRover-Solucion'!
Object subclass: #ObservableCollaborator
	instanceVariableNames: 'value observers updateMessage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObservableCollaborator methodsFor: 'private' stamp: 'FV 7/22/2021 16:45:12'!
notifyObservers

	observers do: [:anObserver | updateMessage sendTo: anObserver with: value].! !


!ObservableCollaborator methodsFor: 'initialization' stamp: 'FV 7/22/2021 16:45:12'!
initializeWith: aValue withUpdateMessage: anUpdateMessage
	value := aValue.
	observers := OrderedCollection new.
	updateMessage := anUpdateMessage.! !


!ObservableCollaborator methodsFor: 'main protocol' stamp: 'FV 7/21/2021 20:29:24'!
addObserver: anObserver
	observers add: anObserver.! !

!ObservableCollaborator methodsFor: 'main protocol' stamp: 'FV 7/21/2021 20:14:13'!
updateValue: newValue
	value := newValue.
	self notifyObservers.! !

!ObservableCollaborator methodsFor: 'main protocol' stamp: 'FV 7/21/2021 17:52:31'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObservableCollaborator class' category: 'MarsRover-Solucion'!
ObservableCollaborator class
	instanceVariableNames: ''!

!ObservableCollaborator class methodsFor: 'as yet unclassified' stamp: 'FV 7/21/2021 19:34:37'!
newWith: aValue
	^self new initializeWith: aValue.! !

!ObservableCollaborator class methodsFor: 'as yet unclassified' stamp: 'FV 7/22/2021 15:23:09'!
newWith: aValue withUpdateMessage: anUpdateMessageName
	^self new initializeWith: aValue withUpdateMessage: anUpdateMessageName.! !
