!classDefinition: #MercadoPago category: #'TusLibros-ExternalServices'!
Object subclass: #MercadoPago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-ExternalServices'!

!MercadoPago methodsFor: 'as yet unclassified' stamp: 'fv 6/25/2024 18:28:39'!
debit: anAmountToDebit from: aCreditCard

	"Acá implementaríamos la comunicación con la API de Mercado Pago - Luciano."
	
	aCreditCard number = '1111111111111117' ifTrue: [ self error: 'Stolen card!!' ]! !


!classDefinition: #OAuthAuthenticationSystem category: #'TusLibros-ExternalServices'!
Object subclass: #OAuthAuthenticationSystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-ExternalServices'!

!OAuthAuthenticationSystem methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:39'!
authenticate: aClientId withPassword: aPassword


	"Acá implementaríamos la comunicación con el sistema externo - Luciano."
	
	(aClientId = 'yenny' and: [ aPassword = 'elAteneo2003' ]) ifFalse: [ self error: 'Invalid credentials' ]! !
!classDefinition: #CartTest category: #'TusLibros-Tests'!
TestCase subclass: #CartTest
	instanceVariableNames: 'catalogue cart book1 book2 outOfCatalogueBook oneCopy multipleCopies invalidCopies'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!CartTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 10:16:16'!
setUp

	cart := Cart new.
	book1 := #Book1.
	book2 := #Book2.
	oneCopy := 1.
	multipleCopies := 2.
	invalidCopies := -1.
	outOfCatalogueBook := #Book3.
	catalogue := Dictionary newFromPairs: {book1 . 2000*peso. book2. 3000*peso}.
		! !

!CartTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 10:09:07'!
test01_anEmptyCartHas0Books

	self assertThatThisCartIsEmpty: cart.! !

!CartTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 10:16:23'!
test02_aCartCanAddABook

	cart addBook: book1 withCatalogue: catalogue.

	
	self assertThatThisCart: cart hasThisAmountOfCopies: oneCopy ofThisBook: book1.! !

!CartTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 10:17:08'!
test03_aCartCanAddSeveralBooks

	cart addBook: book1 withCatalogue: catalogue.
	cart addBook: book2 withCatalogue: catalogue.

	self assertThatThisCart: cart hasThisAmountOfCopies: oneCopy ofThisBook: book1. 
	self assertThatThisCart: cart hasThisAmountOfCopies: oneCopy ofThisBook: book2. ! !

!CartTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 10:10:03'!
test04_cartRaisesErrorWhenAddingABookThatIsNotInTheCatalogue

	self assertThisCode:  [cart addBook: outOfCatalogueBook withCatalogue: catalogue.]  throwsThisErrorMessage: cart errorDescriptionAddABookThatsNotInTheCatalogue.
	
	self assertThatThisCartIsEmpty: cart.! !


!CartTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 10:17:22'!
test05_canAddMultipleCopiesOfTheSameBook

	cart addThisAmountOfCopies: multipleCopies ofThisBook: book1  withThisCatalogue: catalogue.
	
	self assertThatThisCart: cart hasThisAmountOfCopies: multipleCopies  ofThisBook: book1.! !

!CartTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 10:17:32'!
test06_addOneMoreCopy_NO_TDD

	cart addThisAmountOfCopies: multipleCopies  ofThisBook: book1 withThisCatalogue: catalogue .
	cart addBook: book1 withCatalogue: catalogue.
	
	self assertThatThisCart: cart hasThisAmountOfCopies: oneCopy + multipleCopies ofThisBook: book1! !

!CartTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 10:17:47'!
test07_cannotAddAnInvalidAmountOfCopiesOfTheSameBook
	self assertThisCode:  [cart addThisAmountOfCopies: invalidCopies ofThisBook: book1  withThisCatalogue: catalogue .] throwsThisErrorMessage: cart errorDescriptionCannotAddAnInvalidAmountOfCopiesOfTheSameBook.
	self assertThatThisCartIsEmpty: cart.! !


!CartTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatThisCart: aCart hasThisAmountOfBooks: anAmountOfBooks

	^ self assert: (aCart bookListSizeEquals: anAmountOfBooks)! !

!CartTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatThisCart: aCart hasThisAmountOfCopies: aNumber ofThisBook: aBook

	self assert: (aCart hasThisAmountOfCopies: aNumber ofThisBook: aBook).
	! !

!CartTest methodsFor: 'assertions' stamp: 'fv 6/28/2024 10:09:26'!
assertThatThisCartIsEmpty: aCart 
	self assertThatThisCart: aCart hasThisAmountOfBooks: 0..! !

!CartTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThisCode: aCode throwsThisErrorMessage: aMessage
	self should: aCode 
	 raise: Error
	 withExceptionDo: [:anError | self assert: anError messageText equals: aMessage].! !


!classDefinition: #CashierTest category: #'TusLibros-Tests'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'catalogue cashier cart expiredCreditCard validCreditCard nextYear nextMonth paymentSystem bookOne bookTwo oneCopy multipleCopies dniPedro dniManuel priceBookOne priceBookTwo nonCreditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!CashierTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 10:42:12'!
addMultipleCopiesOfThisBook: aBook to: aCart 
	aCart addThisAmountOfCopies: multipleCopies ofThisBook: aBook  withThisCatalogue: catalogue.! !

!CashierTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 10:39:52'!
addOneCopyOfThisBook: aBook to: aCart 
	aCart addThisAmountOfCopies: oneCopy ofThisBook: aBook  withThisCatalogue: catalogue.! !

!CashierTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 10:25:06'!
createCards

	|   previousMonth previousYear |
	previousYear := (GregorianYear current number) - 1.
	previousMonth := (GregorianMonth current number) - 1.	
	
	nonCreditCard := #Carton.
	expiredCreditCard := CreditCard withNumber: '1101100101011001' expirationMonth: previousMonth expirationYear: previousYear andName: 'Pedro'.
	validCreditCard := CreditCard withNumber: '1101100101011010' expirationMonth: nextMonth expirationYear: nextYear andName: 'Manuel'.! !

!CashierTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 10:23:21'!
createCommonlyUsedVariables

	bookOne := #Book1.
	bookTwo := #Book2.
	
	oneCopy := 1.
	multipleCopies := 2.
	
	priceBookOne := 2000 * peso.
	priceBookTwo := 3000 * peso.

	nextYear := (GregorianYear current number) + 1.
	nextMonth := (GregorianMonth current number) + 1.
	catalogue := Dictionary newFromPairs: {bookOne. priceBookOne. bookTwo. priceBookTwo}.
	paymentSystem := MercadoPagoStub new acceptAllCards.
	cashier := Cashier withCatalogue: catalogue andAPaymentSystem: paymentSystem .
	cart:= Cart new.
	
	dniPedro := '42132231'.
	dniManuel := '34534212'.
	
	! !

!CashierTest methodsFor: 'setUp' stamp: 'fv 6/25/2024 18:28:03'!
setUp
	self createCommonlyUsedVariables.
	self createCards.
	! !


!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:46:13'!
test01_cannotCalculateThePriceOfAnEmptyCart
	"Este test quedó duplicado"

	self assertThisCode: [cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro ]  throwsThisErrorMessage: cashier errorDescriptionCantCheckoutEmptyCart .
! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:38:51'!
test02_cashierCanCalculateThePriceOfACartWithOnlyOneBook

	self addOneCopyOfThisBook: bookOne to: cart.
	
	self assertThatTheLastLineOfTheTicketRelatedToThisCart: cart equals: priceBookOne .! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:42:52'!
test03_cashierCanCalculateThePriceOfACartWithMultipleCopiesOfTheSameBook

	self addMultipleCopiesOfThisBook: bookOne to: cart.
	self assertThatTheLastLineOfTheTicketRelatedToThisCart: cart equals: priceBookOne * multipleCopies .! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:40:13'!
test04_cashierCanCalculateThePriceOfACartWithAnyBookAndAnyAmountOfCopies

	self addOneCopyOfThisBook: bookOne to: cart.
	self addOneCopyOfThisBook: bookTwo to: cart.
	self assertThatTheLastLineOfTheTicketRelatedToThisCart: cart equals: priceBookOne + priceBookTwo .! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:40:25'!
test05_clientCannotCheckoutWithoutARealCreditCard

	self addOneCopyOfThisBook: bookOne to: cart.
	self addOneCopyOfThisBook: bookTwo to: cart.
	
	self assertThisCode: [cashier checkoutCart: cart withCreditCard: nonCreditCard andAnUniqueCredential: dniPedro.]  throwsThisErrorMessage: cashier errorDescriptionCannotCheckoutWithoutACreditCard.
	self assertThatTheCartisNotEmpty: cart.
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:40:39'!
test06_clientCannotCheckoutWithAnExpiredCard

	self addOneCopyOfThisBook: bookOne to: cart.
	self addOneCopyOfThisBook: bookTwo to: cart.
	
	self assertThisCode: [cashier checkoutCart: cart withCreditCard: expiredCreditCard andAnUniqueCredential: dniPedro .]  throwsThisErrorMessage: cashier errorDescriptionInvalidExpirationDate.
	self assertThatTheCartisNotEmpty: cart.
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:30:42'!
test07_cannotCheckoutWithACreditCardWithAnInvalidAmountOfDigits
	"Este test queda por el TDD, se valida en la tarjeta, directamente no se puede crear una tarjeta con un número inválido"
	"""
	| aCreditCard |
	
	aCreditCard := CreditCard withNumber: '1215' expirationMonth: nextMonth expirationYear: nextYear andName: 'nombre'.
	
	cart addThisAmountOfCopies: 1 ofThisBook: #Libro1 withThisCatalogue: catalogue.
	cart addThisAmountOfCopies: 1 ofThisBook: #Libro2 withThisCatalogue: catalogue.

	self should: [cashier checkoutCart: cart withCreditCard: aCreditCard.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:unError | self assert: unError messageText equals: cashier errorDescriptionInvalidCreditCardNumber].
	"""
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 09:50:30'!
test08_cashierCannotCheckoutAnEmptyCart
	
	self 
	assertThisCode: [cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro.] 
	throwsThisErrorMessage: cashier errorDescriptionCantCheckoutEmptyCart.
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:40:49'!
test09_clientCannotCheckoutWithAStolenCard

	self addOneCopyOfThisBook: bookOne to: cart.
	paymentSystem denyCard.

	self assertThisCode: [cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .]  throwsThisErrorMessage: cashier errorDescriptionStolenCard.
	self assertThatTheCartisNotEmpty: cart.
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:44:29'!
test10_theCashierWillGiveTheUserATicketOfThePurchaseWithOneBook
	
	| ticketFirstLine ticketLastLine |
	self addOneCopyOfThisBook: bookOne to: cart.
	
	ticketFirstLine := Association key: bookOne value: oneCopy.
	ticketLastLine := priceBookOne.
	
	self assertThatTheTicketRelatedToThisCart: cart includes: {ticketFirstLine. ticketLastLine .}.
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:43:17'!
test11_theCashierWillGiveTheUserATicketOfThePurchaseWithMultipleBooks
	
	| ticketLineOne ticketLineTwo ticketLastLine |
	self addOneCopyOfThisBook: bookOne to: cart.
	self addMultipleCopiesOfThisBook: bookTwo to: cart.

	ticketLineOne := Association key: bookOne value: oneCopy.
	ticketLineTwo := Association key: bookTwo value: multipleCopies.
	ticketLastLine := priceBookOne + (priceBookTwo * multipleCopies).
	
	self assertThatTheTicketRelatedToThisCart: cart includes: {ticketLineOne. ticketLineTwo. ticketLastLine.}! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:43:26'!
test12_afterTheCheckoutTheCartIsEmpty

	
	self addOneCopyOfThisBook: bookOne to: cart.
	self addMultipleCopiesOfThisBook: bookTwo to: cart.
	cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .
	
	self assert: cart isEmpty.
	
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:41:14'!
test13_salesBookIsEmptyIfTheresNoCheckouts
	
	self addOneCopyOfThisBook: bookOne to: cart.
	
	self assert: cashier salesBookIsEmpty.! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:43:44'!
test14_salesBookRegistersSaleForACustomer
	
	| aTicket |
	self addOneCopyOfThisBook: bookOne to: cart.
	self addMultipleCopiesOfThisBook: bookTwo to: cart.
	
	aTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .
	
	self assert: (cashier salesBookHasThisTicket: aTicket forThisCustomer: dniPedro).! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:43:51'!
test15_salesBookRegistersMoreThanOneSaleOfOneCustomer
	
	| firstTicket secondTicket |
	self addOneCopyOfThisBook: bookOne to: cart.
	self addMultipleCopiesOfThisBook: bookTwo to: cart.
	
	firstTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .
	
	self addOneCopyOfThisBook: bookOne to: cart.
	
	secondTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .
	
	self assert: (cashier salesBookHasThisTicket: secondTicket forThisCustomer: dniPedro ).
	self assert: (cashier salesBookHasThisTicket: firstTicket forThisCustomer: dniPedro).! !

!CashierTest methodsFor: 'tests' stamp: 'fv 6/28/2024 10:44:17'!
test16_salesBookWontMixupSalesFromDifferentCustomers

	| firstTicket secondTicket |
	self addOneCopyOfThisBook: bookOne to: cart.
	self addMultipleCopiesOfThisBook: bookTwo to: cart.
	
	firstTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro.
	
	self addOneCopyOfThisBook: bookOne to: cart.
	
	secondTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniManuel .
	
	self assert: (cashier salesBookHasThisTicket: firstTicket forThisCustomer: dniPedro).
	self assert: (cashier salesBookHasThisTicket: secondTicket forThisCustomer: dniManuel ).
	
	self deny: (cashier salesBookHasThisTicket: firstTicket forThisCustomer: dniManuel).
	self deny: (cashier salesBookHasThisTicket: secondTicket forThisCustomer: dniPedro).
	! !


!CashierTest methodsFor: 'assertions' stamp: 'fv 6/28/2024 10:29:22'!
assertThatTheCartisNotEmpty: aCart 
	self deny: aCart isEmpty.! !

!CashierTest methodsFor: 'assertions' stamp: 'fv 6/28/2024 09:50:30'!
assertThatTheLastLineOfTheTicketRelatedToThisCart: aCart equals: aString
	| aTicket |
	aTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .
	
	self assert: aTicket last equals: aString.! !

!CashierTest methodsFor: 'assertions' stamp: 'fv 6/28/2024 09:50:30'!
assertThatTheTicketRelatedToThisCart: aCart includes: aCoupleOfStrings
	| aTicket |
	aTicket := cashier checkoutCart: cart withCreditCard: validCreditCard andAnUniqueCredential: dniPedro .
	
	aCoupleOfStrings do: [:aLine| self assert: aTicket includes: aLine].! !

!CashierTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:04'!
assertThisCode: aCode throwsThisErrorMessage: aMessage
	self should: aCode 
	 raise: Error
	 withExceptionDo: [:anError | self assert: anError messageText equals: aMessage].! !


!CashierTest methodsFor: 'stub-paymentSystem' stamp: 'fv 6/25/2024 18:28:04'!
acceptAllCards
	^self validatePayment:[:anAmountToDebit :creditCard].! !

!CashierTest methodsFor: 'stub-paymentSystem' stamp: 'fv 6/25/2024 18:28:04'!
debit: anAmountToDebit from: aCreditCard
	paymentSystem value: anAmountToDebit value: aCreditCard.! !

!CashierTest methodsFor: 'stub-paymentSystem' stamp: 'fv 6/25/2024 18:28:03'!
denyCard
	self validatePayment: [:anAmountToDebit :aCreditCard | self error: 'Stolen card!!'].! !

!CashierTest methodsFor: 'stub-paymentSystem' stamp: 'fv 6/25/2024 18:28:04'!
validatePayment: aBlock
	paymentSystem := aBlock.! !


!classDefinition: #TusLibrosHttpProtocolInterfaceTest category: #'TusLibros-Tests'!
TestCase subclass: #TusLibrosHttpProtocolInterfaceTest
	instanceVariableNames: 'validUser1 validPassword invalidUser invalidPassword authenticationSystem bookQuantityOne firstBookIsbn correctCartId httpProtocolInterface validCreateCartRequest validListCartRequest addOneCopyOfOneBookRequest secondBookIsbn correctCcn correctCced correctCco validCheckOutRequest paymentSystem timeSystem sessionValidator gregorianClock invalidFill validListPurchasesRequest completeCatalogue thirdBookIsbn firstBookPrice secondBookPrice thirdBookPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test01_creatingANewCartReturnsASuccessfulHttpResponseWithTheCartId

	|  createCartResponse |
	
	createCartResponse := httpProtocolInterface createCart: validCreateCartRequest .
	
	self assertThatTheSuccessfulHttpResponse: createCartResponse hasThisBody: '0|1'.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test02_creatingACartWithAnInvalidAmountOfParametersSendsANegativeHttpResponse

	| createCartResponse |
	
	createCartResponse := httpProtocolInterface createCart: (Dictionary newFromPairs: {'clientId'. validUser1 .}).
	
	self assertThatTheNegativeHttpResponse: createCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test03_creatingACartWithInvalidParametersSendsANegativeHttpResponse

	| createCartResponse |
	
	createCartResponse := httpProtocolInterface createCart: (Dictionary newFromPairs: {'clientId'. validUser1 . 'fruta'. 'pera'}).
	
	self assertThatTheNegativeHttpResponse: createCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test04_listingAnEmptyCartSendsASuccessfulHttpResponseWithTheEmptyList

	| listCartResponse |
	
	httpProtocolInterface createCart: validCreateCartRequest .
	listCartResponse := httpProtocolInterface listCart: validListCartRequest.
	
	self assertThatTheSuccessfulHttpResponse: listCartResponse hasThisBody: '0|'.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test05_listingANonExistantCartSendsANegativeHttpResponse

	| listCartResponse |
	listCartResponse := httpProtocolInterface listCart: validListCartRequest.
	
	self assertThatTheNegativeHttpResponse: listCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidCartID.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test06_addingABookThatsInTheCatalogueSendsASuccessfulHttpResponse

	| addToCartResponse |
	httpProtocolInterface createCart: validCreateCartRequest.
	
	addToCartResponse := httpProtocolInterface addToCart: addOneCopyOfOneBookRequest.

	self assertThatTheSuccessfulHttpResponse: addToCartResponse hasThisBody: '0|OK'.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test07_addingABookThatIsNotInTheCatalogueSendANegativeHttpResponse

	| addToCartResponse |
	
	httpProtocolInterface := self createApiWithAnEmptyCatalogue.
	httpProtocolInterface createCart: validCreateCartRequest.
	
	addToCartResponse := httpProtocolInterface addToCart: addOneCopyOfOneBookRequest.
	
	self assertThatTheNegativeHttpResponse: addToCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionTheBookIsNotOnTheCatalogue .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test08_addingABookWithAnInvalidAmountOfParametersSendsANegativeHttpResponse

	| addToCartResponse |
	
	httpProtocolInterface createCart:validCreateCartRequest.
	
	addToCartResponse := httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookQuantity'. bookQuantityOne }).
	
	self assertThatTheNegativeHttpResponse: addToCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test09_addingABookWithInvalidParametersSendsANegativeHttpResponse

	|  addToCartResponse |

	httpProtocolInterface createCart: validCreateCartRequest.
	
	addToCartResponse := httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'frutas'. '2'. 'bookQuantity'. bookQuantityOne }).
	
	self assertThatTheNegativeHttpResponse: addToCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test10_listingACartWithAnInvalidAmountOfParametersSendsANegativeHttpResponse

	| listCartResponse |

	httpProtocolInterface createCart: validCreateCartRequest.
	
	listCartResponse := httpProtocolInterface listCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'hola'. 'chau'}).

	self assertThatTheNegativeHttpResponse: listCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test11_listingACartWithInvalidParametersSendsANegativeHttpResponse

	| listCartResponse |

	httpProtocolInterface createCart: validCreateCartRequest.
	
	listCartResponse := httpProtocolInterface listCart: (Dictionary newFromPairs: {'hola'. correctCartId .}).

	self assertThatTheNegativeHttpResponse: listCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test12_listingACartWithOneBookWillSendASuccessfulHttpResponseWithTheAddedBooks

	| listCartResponse listCartInfoSerialized |
	
	httpProtocolInterface createCart: validCreateCartRequest.
	
	httpProtocolInterface addToCart: addOneCopyOfOneBookRequest.
	
	listCartResponse := httpProtocolInterface listCart: validListCartRequest.

	listCartInfoSerialized := self serializeTheStrings: {firstBookIsbn asString. bookQuantityOne}.

	self assertThatTheSuccessfulHttpResponse: listCartResponse hasThisBody: '0|', listCartInfoSerialized.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:41:38'!
test13_listingACartWithMultipleBooksWillSendASuccessfulHttpResponseWithTheBooksCorrectlySerialized

	| listCartResponse listCartInfoSerialized |

	httpProtocolInterface createCart: validCreateCartRequest.
	
	httpProtocolInterface addToCart: addOneCopyOfOneBookRequest.
	httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. secondBookIsbn . 'bookQuantity'. bookQuantityOne }).
	
	listCartResponse := httpProtocolInterface listCart: validListCartRequest.
	
	listCartInfoSerialized := self serializeTheStrings: {firstBookIsbn asString. bookQuantityOne. secondBookIsbn asString. bookQuantityOne}.

	self assertThatTheSuccessfulHttpResponse: listCartResponse hasThisBody: '0|',listCartInfoSerialized.! !


!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 11:41:38'!
test18_receivingAnInvalidRequestSendsAnInvalidRequestResponse

	"Acá colapsamos todos los tests que chequean que los parámetros de la request sean los correctos"

	| checkoutCartResponse checkoutRequest |
	
	checkoutRequest := Dictionary newFromPairs: {'cartId'. correctCartId. 'ccn'. 'NaN'. 'cced'. correctCced}.
	
	checkoutCartResponse := httpProtocolInterface checkOutCart: checkoutRequest .
	
	self assertThatTheNegativeHttpResponse: checkoutCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 11:41:38'!
test19_aCheckoutWithANonCreatedCartSendsANegativeHttpResponse

	| checkoutCartResponse checkoutRequest nonCreatedCartId |
	
	nonCreatedCartId := 1.
	
	checkoutRequest := Dictionary newFromPairs: {'cartId'. nonCreatedCartId. 'ccn'. correctCcn. 'cced'. correctCced. 'cco'. correctCco}.
	
	checkoutCartResponse := httpProtocolInterface checkOutCart: checkoutRequest .
	
	self assertThatTheNegativeHttpResponse: checkoutCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidCartID .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 11:41:38'!
test20_doingACheckoutWithACartFilledWithBooksSendsBackTheIdOfThePurchase

	| checkoutCartResponse |

	httpProtocolInterface createCart: validCreateCartRequest.
	httpProtocolInterface addToCart: addOneCopyOfOneBookRequest .
	
	checkoutCartResponse := httpProtocolInterface checkOutCart: validCheckOutRequest .
	
	self assertThatTheHttpResponseHasAValidUUID: checkoutCartResponse .! !


!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 11:41:38'!
test14_multipleCopiesOfTheSameBookWillBeSerializedCorrectlyWhenListingTheCart

	| listCartResponse bookQuantity |
	
	bookQuantity := '2'.
	httpProtocolInterface createCart: validCreateCartRequest.
	
	httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. firstBookIsbn . 'bookQuantity'. bookQuantity}).
	
	listCartResponse := httpProtocolInterface listCart: validListCartRequest.

	self assertThatTheSuccessfulHttpResponse: listCartResponse hasThisBody: '0|',firstBookIsbn asString ,'|',bookQuantity.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 11:41:38'!
test15_addingAnNonNumericalAmountOfCopiesWillRespondWithANegativeHttpResponse

	| bookQuantity addToCartResponse |

	bookQuantity := 'x'.
	httpProtocolInterface createCart: validCreateCartRequest.
	
	addToCartResponse := httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. firstBookIsbn . 'bookQuantity'. bookQuantity}).

	self assertThatTheNegativeHttpResponse: addToCartResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 11:07:44'!
test16_addingANonNumericalBookIsbnWillRespondWithANegativeHttpResponse
"Quedó de antes, en realidad las ISBN no tienen por que se números"

"""
	| bookIsbn addToCartResponse |
	
	bookIsbn := 'x'.

	externalApi createCart: validCreateCartRequest.
	
	addToCartResponse := externalApi addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. bookIsbn . 'bookQuantity'. bookQuantityOne }).

	self assertThatTheNegativeHttpResponse: addToCartResponse hasThisBody: '1|',externalApi errorDescriptionInvalidParameters .
	"""! !


!TusLibrosHttpProtocolInterfaceTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:02'!
assertThatTheHttpResponse: aHttpResponse hasThisStatusCode: aStatusCode andThisResponseBody: aResponseBody

	self assert: (aHttpResponse at: 'httpCode') equals: aStatusCode.
	self assert: (aHttpResponse at: 'responseBody') equals: aResponseBody.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatTheHttpResponseHasAValidUUID: checkoutCartResponse

	|  responseBody |
	
	responseBody := checkoutCartResponse at: 'responseBody'.
	
	self assert: (responseBody copyFrom: 3 to: responseBody size) size equals: 36.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatTheNegativeHttpResponse: aHttpResponse hasThisBody: aHttpResponseBody 
	self assertThatTheHttpResponse: aHttpResponse hasThisStatusCode: '400' andThisResponseBody: aHttpResponseBody .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatTheSuccessfulHttpResponse: aHttpResponse hasThisBody: aHttpResponseBody 

	self assertThatTheHttpResponse: aHttpResponse hasThisStatusCode: '200' andThisResponseBody: aHttpResponseBody .! !


!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:36:47'!
createApiWithAnEmptyCatalogue
	| emptyCatalogue |
	emptyCatalogue := Dictionary new.
	^TusLibrosHttpProtocolInterface createWithCatalogue: emptyCatalogue andAuthenticationSystem: authenticationSystem andAPaymentSystem: paymentSystem andASessionValidator: sessionValidator .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:41:38'!
createApis

	completeCatalogue := Dictionary newFromPairs: {firstBookIsbn . firstBookPrice . secondBookIsbn . secondBookPrice . thirdBookIsbn . thirdBookPrice }.
	
	sessionValidator := SessionValidator createWithInternalClock: gregorianClock andASessionLength: 30 * minute.
	
	httpProtocolInterface := TusLibrosHttpProtocolInterface createWithCatalogue: completeCatalogue andAuthenticationSystem: authenticationSystem andAPaymentSystem: paymentSystem andASessionValidator: sessionValidator .! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/27/2024 18:54:15'!
createCommonlyUsedVariables
	validUser1 := 'user'.
	validPassword := 'pass'.
	invalidUser := 'invalidUser'.
	invalidPassword := 'invalidPass'.
	bookQuantityOne := '1'.
	firstBookIsbn:= 101.
	firstBookPrice := 2000 * peso.
	secondBookIsbn:= 2.
	secondBookPrice := 3000 * peso.
	thirdBookIsbn := 3.
	thirdBookPrice := 4000 * peso.
	correctCartId:= '1'.
	correctCcn := '0110101010101010'.
	correctCced := '102024'.
	correctCco := 'nombre'.
	invalidFill := 'Something Invalid'.
	
	timeSystem := GregorianTimeStub new.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/25/2024 19:28:14'!
createStuds
	authenticationSystem := OAuthStub new acceptAllCredentials .	
	paymentSystem:= MercadoPagoStub new acceptAllCards.
	gregorianClock := GregorianTimeStub new.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/27/2024 15:33:42'!
createValidRequests
	
	validCreateCartRequest := Dictionary newFromPairs: {'clientId'. validUser1 . 'password'. validPassword }.
	validListCartRequest := Dictionary newFromPairs: {'cartId'. correctCartId.}.
	addOneCopyOfOneBookRequest := Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. firstBookIsbn . 'bookQuantity'. bookQuantityOne }.
	validCheckOutRequest := Dictionary newFromPairs: {'cartId'. correctCartId. 'ccn'. correctCcn. 'cced'. correctCced. 'cco'. correctCco}.
	validListPurchasesRequest := Dictionary newFromPairs: {'clientId'. validUser1 . 'password'. validPassword }.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:18:22'!
serializeTheStrings: aCollectionOfStrings

	| serialized |
	serialized := ''.

	aCollectionOfStrings do: [:aString | 
		serialized := serialized,aString,'|'.
		].
	
	^serialized allButLast.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'setUp' stamp: 'fv 6/25/2024 18:28:03'!
setUp
	
	self createCommonlyUsedVariables.
	self createValidRequests.
	self createStuds.
	self createApis.! !


!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:41:38'!
test21_cantReceiveAnInvalidListPurchasesRequest

	"Acá colapsamos todos los tests que chequean que los parámetros de la request sean los correctos"

	| listPurchasesRequest listPurchasesResponse |
	
	listPurchasesRequest := Dictionary newFromPairs: {'clientId'. validPassword .}.
	
	listPurchasesResponse := httpProtocolInterface listPurchases: listPurchasesRequest .
	
	self assertThatTheNegativeHttpResponse: listPurchasesResponse hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidParameters .
	
	! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:41:38'!
test22_anEmptySalesBookWillRespondWithAPositiveHttpResponseOfZero

	| listPurchasesResponse |.
	
	listPurchasesResponse := httpProtocolInterface listPurchases: validListPurchasesRequest .
	
	self assertThatTheSuccessfulHttpResponse: listPurchasesResponse hasThisBody: '0|0'.
	
	! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:41:38'!
test23_theClientCanListThePurchasesOfOneBook

	| listPurchasesResponse purchasesListInfoSerialized |

	httpProtocolInterface createCart: validCreateCartRequest.
	
	httpProtocolInterface addToCart: addOneCopyOfOneBookRequest.
	
	httpProtocolInterface checkOutCart: validCheckOutRequest .
	
	listPurchasesResponse := httpProtocolInterface listPurchases: validListPurchasesRequest .

	purchasesListInfoSerialized := self serializeTheStrings: {firstBookIsbn asString. bookQuantityOne. (firstBookPrice asString copyUpTo: $ ) }.

	self assertThatTheSuccessfulHttpResponse: listPurchasesResponse hasThisBody: '0|',purchasesListInfoSerialized.! !

!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:41:38'!
test24_theClientCanListTheirPurchasesOfMoreThanOneBookAndSale

	| listPurchasesResponse purchasesListInfoSerialized |

	httpProtocolInterface createCart: validCreateCartRequest.
	
	httpProtocolInterface addToCart: addOneCopyOfOneBookRequest.
	httpProtocolInterface checkOutCart: validCheckOutRequest .
	
	httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. secondBookIsbn . 'bookQuantity'. 3 }).
	httpProtocolInterface addToCart: (Dictionary newFromPairs: {'cartId'. correctCartId . 'bookIsbn'. firstBookIsbn . 'bookQuantity'. 4 }).
	httpProtocolInterface checkOutCart: validCheckOutRequest .
	
	listPurchasesResponse := httpProtocolInterface listPurchases: validListPurchasesRequest .

	

	purchasesListInfoSerialized := self serializeTheStrings: {firstBookIsbn asString. '5'. secondBookIsbn asString. '3'. ((firstBookPrice * 5) + (secondBookPrice * 3)) asString copyUpTo: $ .}.

	self assertThatTheSuccessfulHttpResponse: listPurchasesResponse hasThisBody: '0|',purchasesListInfoSerialized.! !


!TusLibrosHttpProtocolInterfaceTest methodsFor: 'tests-historia4' stamp: 'fv 6/28/2024 11:41:38'!
test17_creatingACartWithAnUnregisteredClientIdSendsANegativeHttpResponse

	| responseCreateCart |
	authenticationSystem denyCredentials.
	responseCreateCart := httpProtocolInterface createCart: (Dictionary newFromPairs: {'clientId'. invalidUser . 'password'. 	invalidPassword }).
	
	self assertThatTheNegativeHttpResponse: responseCreateCart hasThisBody: '1|',httpProtocolInterface errorDescriptionInvalidCredentials.! !


!classDefinition: #TusLibrosWebPageTest category: #'TusLibros-Tests'!
TestCase subclass: #TusLibrosWebPageTest
	instanceVariableNames: 'validUser1 validPassword validUser2 invalidUser invalidPassword webPage validCreditCardParameters authenticationSystem paymentSystem gregorianClock acceptableDelay notAcceptableDelay sessionLength sessionValidator isbn1 price1 isbn2 price2 oneCopy multipleCopies invalidCartId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!TusLibrosWebPageTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:40:34'!
test01_creatingACartWithApiInternalLayerCreatesItEmpty
	
	| firstCartId |
	firstCartId := self createValidCart.
	
	self assert: (webPage listCart: firstCartId) isEmpty.
	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:40:34'!
test02_addingABookWithApiInternalLayerWorks

	| firstCartId |
	firstCartId := self createValidCart.
	self addOneCopyOfThisBook: isbn1 to: firstCartId.

	
	self assertThatTheCartList: (webPage listCart: firstCartId ) includesThisBookIsbn: isbn1 andItsSizeIs: oneCopy .
	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 10:48:54'!
test04_differentUsersHaveDifferentCarts
	| secondCartId firstCartId |
	
	
	firstCartId := self createValidCart.
	secondCartId := self createValidCart.
	
	self deny: (firstCartId = secondCartId).
	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:40:34'!
test05_addingABookToOneUsersCartWontAddItToTheSecondUsersCart
	| secondCartId firstCartId |
	
	firstCartId := self createValidCart.
	secondCartId := self createValidCart.
	self addOneCopyOfThisBook: isbn1 to: firstCartId.

	self assertThatTheCartList: (webPage listCart: firstCartId ) includesThisBookIsbn: isbn1 andItsSizeIs: oneCopy .
	self assertThatTheCartList: (webPage listCart: secondCartId) doesntIncludeThisBookIsbn: isbn1 andItsSizeIs: 0.
	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:40:34'!
test06_listingAnInvalidCartIdRaisesError
	
	self assertThatTheApiThrowsThisError: webPage errorDescriptionInvalidCartID whenThisClosureRuns:  [webPage listCart: invalidCartId.].! !

!TusLibrosWebPageTest methodsFor: 'tests-historia2' stamp: 'fv 6/28/2024 11:40:34'!
test07_addingABookToInvalidCartIdRaisesError
	
	self assertThatTheApiThrowsThisError: webPage errorDescriptionInvalidCartID whenThisClosureRuns: [webPage addToCart: invalidCartId withISBN: isbn1 withThisQuantity: oneCopy ].! !


!TusLibrosWebPageTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 11:40:34'!
test10_cannotCheckoutInvalidCartId

	self assertThatTheApiThrowsThisError: webPage errorDescriptionInvalidCartID whenThisClosureRuns: [webPage checkoutCart: invalidCartId withACreditCard: '10101010101010' ].
	
	

	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 11:40:34'!
test11_checkoutGivesCorrectTransactionIdAndLeavesTheCartEmpty

	| aTransactionId firstCartId |
	firstCartId := self createValidCart.
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	aTransactionId := webPage checkoutCart: firstCartId withACreditCard: validCreditCardParameters .
	
	self assert: aTransactionId size equals: 36.
	self assert: (webPage listCart: firstCartId ) isEmpty.
	
	
	

	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 11:40:34'!
test12_twoCheckoutsHaveDIfferentTransactionId

	| aTransactionId aTransactionId2 firstCartId |
	firstCartId := self createValidCart.
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	aTransactionId := webPage checkoutCart: firstCartId withACreditCard:  validCreditCardParameters .
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	aTransactionId2 := webPage checkoutCart: firstCartId withACreditCard: validCreditCardParameters .
	
	
	self deny: (aTransactionId = aTransactionId2 ).
	
	
	

	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia5' stamp: 'fv 6/27/2024 14:38:25'!
test13_salesBookExists
"Test viejo, queda por tdd"
"""
	self createValidCart.
	internalApi addToCart: validCartId withISBN: isbn1 withThisQuantity: oneBook .
	internalApi checkoutCart: validCartId withACreditCard:  validCreditCardParameters .
	
	self assert: (internalApi salesBook includesKey: validCreditCardParameters last). """! !

!TusLibrosWebPageTest methodsFor: 'tests-historia5' stamp: 'fv 6/28/2024 10:50:56'!
test14_salesBookTicketIsCorrect
"Lo mismo del anterior test"
"""
	self createValidCart.
	internalApi addToCart: validCartId withISBN: isbn1 withThisQuantity: oneBook .
	internalApi checkoutCart: validCartId withACreditCard:  validCreditCardParameters .
	
	self assert: (internalApi salesBook at: validCreditCardParameters last ) first first equals: (Association key: isbn1 value: 1).
	self assert: (internalApi salesBook at: validCreditCardParameters last ) first last equals: price1.
	"""! !


!TusLibrosWebPageTest methodsFor: 'tests-historia4' stamp: 'fv 6/28/2024 11:40:34'!
test08_anInvalidUserCantCreateANewCart
	
	authenticationSystem denyCredentials.
	
	self assertThatTheApiThrowsThisError: TusLibrosWebPage errorDescriptionInvalidCredentials 
	whenThisClosureRuns: [webPage createCartwithUser: invalidUser andPassword: validPassword ].
	
	! !

!TusLibrosWebPageTest methodsFor: 'tests-historia4' stamp: 'fv 6/28/2024 11:40:34'!
test09_aValidUserWithAnInvalidPasswordCantCreateANewCart
	
	authenticationSystem denyCredentials.	
	self assertThatTheApiThrowsThisError: TusLibrosWebPage errorDescriptionInvalidCredentials whenThisClosureRuns: [webPage createCartwithUser: validUser1 andPassword: invalidPassword ] .
	
	! !


!TusLibrosWebPageTest methodsFor: 'tests-historia3' stamp: 'fv 6/28/2024 11:40:34'!
test03_addingABookWithQuantityAddsToTheCartTheRightQuantity
	
	| firstCartId |
	firstCartId := self createValidCart.
	
	self addMultipleCopiesOfThisBook: isbn1 to: firstCartId.
	
	self assertThatTheCartList: (webPage listCart: firstCartId ) includesThisBookIsbn: isbn1 andItsSizeIs: multipleCopies .
	! !


!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:40:34'!
addMultipleCopiesOfThisBook: aBookIsbn to: aCartId 
	webPage addToCart: aCartId withISBN: aBookIsbn withThisQuantity: multipleCopies .! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:40:34'!
addOneCopyOfThisBook: aBookIsbn to: aCartId 
	webPage addToCart: aCartId withISBN: aBookIsbn withThisQuantity: oneCopy .! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:40:34'!
createApis
	| completeCatalogue |
	completeCatalogue := Dictionary newFromPairs: {isbn1. price1. isbn2. price2}.
	webPage := TusLibrosWebPage createWithCatalogue: completeCatalogue andAuthenticationSystem: authenticationSystem andPaymentSystem: paymentSystem andASessionValidator: sessionValidator .! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/27/2024 14:29:01'!
createCardParameters

	| nextMonth nextYear validCreditCardNumber |
	validCreditCardNumber := '1010100101101010'.
	nextYear := (GregorianYear current number) + 1.
	nextMonth := (GregorianMonth current number) + 1.
	
	validCreditCardParameters := {validCreditCardNumber. nextMonth . nextYear . validUser1 }! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:04:22'!
createCommonlyUsedVariables

	validUser1 := 'user'.
	validUser2 := 'user2'.
	validPassword := 'pass'.
	invalidUser := 'invalidUser'.
	invalidPassword := 'invalidPass'.
	invalidCartId := -1.
	
	acceptableDelay := 2*minute.
	notAcceptableDelay := 6*minute.
	
	sessionLength := 4 * minute.
	
	sessionValidator := SessionValidator createWithInternalClock: gregorianClock andASessionLength: sessionLength.
	isbn1 := 101.
	price1 := 2000 * peso.
	isbn2 := 102.
	price2 := 3000 * peso.
	oneCopy := 1.
	multipleCopies := 2.! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/25/2024 19:28:14'!
createStuds
	authenticationSystem :=OAuthStub new acceptAllCredentials.
	paymentSystem :=MercadoPagoStub new acceptAllCards.
	gregorianClock := GregorianTimeStub new.! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/28/2024 11:40:34'!
createValidCart

	^webPage createCartwithUser: validUser1 andPassword: validPassword.
	
	! !

!TusLibrosWebPageTest methodsFor: 'setUp' stamp: 'fv 6/25/2024 18:28:03'!
setUp
	self createStuds.
	self createCommonlyUsedVariables.
	self createApis.
	self createCardParameters.
	! !


!TusLibrosWebPageTest methodsFor: 'tests-historia6' stamp: 'fv 6/28/2024 11:40:34'!
test15_cantListCartWithAnExpiredSession

	| firstCartId |
	firstCartId := self createValidCart.
	
	webPage listCart: firstCartId .
	
	gregorianClock delayAnAmountOfTime: (notAcceptableDelay).

	self assertThatTheApiThrowsThisError: webPage errorDescriptionExpiredSession whenThisClosureRuns:
	[webPage listCart: firstCartId ].! !

!TusLibrosWebPageTest methodsFor: 'tests-historia6' stamp: 'fv 6/28/2024 11:40:34'!
test16_cantAddBooksWithAnExpiredSession

	| firstCartId |
	firstCartId := self createValidCart.
	
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	
	gregorianClock delayAnAmountOfTime: (notAcceptableDelay ).
	
	self assertThatTheApiThrowsThisError: webPage errorDescriptionExpiredSession whenThisClosureRuns: [self addOneCopyOfThisBook: isbn1 to: firstCartId. ].! !

!TusLibrosWebPageTest methodsFor: 'tests-historia6' stamp: 'fv 6/28/2024 11:40:34'!
test17_cantCheckoutWithExpiredSession

	| firstCartId |
	firstCartId := self createValidCart.
	
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	webPage listCart: firstCartId .
	
	gregorianClock delayAnAmountOfTime: (notAcceptableDelay ).

	self assertThatTheApiThrowsThisError: webPage errorDescriptionExpiredSession  whenThisClosureRuns: [webPage checkoutCart: firstCartId withACreditCard: validCreditCardParameters ].! !

!TusLibrosWebPageTest methodsFor: 'tests-historia6' stamp: 'fv 6/28/2024 11:40:34'!
test18_theSessionTimerWillResetAfterTakingAnyAction

	| firstCartId |
	firstCartId := self createValidCart.
	gregorianClock delayAnAmountOfTime: (acceptableDelay ).
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	gregorianClock delayAnAmountOfTime: (acceptableDelay).
	webPage listCart: firstCartId .
	
	gregorianClock delayAnAmountOfTime: (notAcceptableDelay).

	self assertThatTheApiThrowsThisError: webPage errorDescriptionExpiredSession whenThisClosureRuns:  [webPage checkoutCart: firstCartId withACreditCard: validCreditCardParameters ].
	! !


!TusLibrosWebPageTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatTheApiThrowsThisError: anErrorMessageText whenThisClosureRuns: aClosure 

	self should: aClosure
	raise:  Error
	withExceptionDo: [:unError | self assert: unError messageText equals:  anErrorMessageText ].! !

!TusLibrosWebPageTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatTheCartList: aCartList doesntIncludeThisBookIsbn: aBookIsbn andItsSizeIs: aSize

	self deny: (aCartList includes: aBookIsbn).
	self assert: aCartList size equals: aSize.
	! !

!TusLibrosWebPageTest methodsFor: 'assertions' stamp: 'fv 6/25/2024 18:28:03'!
assertThatTheCartList: aCartList includesThisBookIsbn: aBookIsbn andItsSizeIs: aSize

	self assert: aCartList includes: aBookIsbn.
	self assert: aCartList size equals: aSize.
	! !


!TusLibrosWebPageTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:40:34'!
test19_thePurchasesListIsEmptyWhenTheClientDidntPurchaseAnything

	| firstCartId |
	firstCartId := self createValidCart .
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	
	self assert: (webPage purchasesBy: validUser1 andPassword: validPassword) isEmpty .! !

!TusLibrosWebPageTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:40:34'!
test20_theSalesBookRegistersASaleFromOneClient

	| expectedTicket firstCartId |
	firstCartId := self createValidCart .
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	webPage checkoutCart: firstCartId withACreditCard: validCreditCardParameters .
	
	expectedTicket := OrderedCollection with: (Association key: isbn1 value: oneCopy) with: price1.
		
	self assert: (webPage purchasesBy: validUser1 andPassword: validPassword) includes: expectedTicket .! !

!TusLibrosWebPageTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:40:34'!
test21_differentClientSalesWontMixupInTheSalesBook
"NO TDD, para probar"
	| expectedTicketFirstClient secondUsersCartId expectedTicketSecondClient firstUsersCart |
	
	firstUsersCart := self createValidCart .
	secondUsersCartId := webPage createCartwithUser: validUser2 andPassword: validPassword .
	
	self addOneCopyOfThisBook: isbn1 to: firstUsersCart.
	
	self addMultipleCopiesOfThisBook: isbn2 to: secondUsersCartId .
	self addMultipleCopiesOfThisBook: isbn1 to: secondUsersCartId .
	
	webPage checkoutCart: firstUsersCart withACreditCard: validCreditCardParameters .
	webPage checkoutCart: secondUsersCartId withACreditCard: validCreditCardParameters .
	
	expectedTicketFirstClient := OrderedCollection with: (Association key: isbn1 value: oneCopy) with: price1.
	expectedTicketSecondClient := OrderedCollection with: (Association key: isbn1 value: multipleCopies ) with: (Association key: isbn2 value: multipleCopies ) with: (price1 * multipleCopies ) + (price2 * multipleCopies ).
	
	self assert: (webPage purchasesBy: validUser1 andPassword: validPassword) includes: expectedTicketFirstClient .
	self assert: (webPage purchasesBy: validUser2 andPassword: validPassword) includes: expectedTicketSecondClient.! !

!TusLibrosWebPageTest methodsFor: 'tests-historia7' stamp: 'fv 6/28/2024 11:40:34'!
test22_theSalesBookIsNotAffectedByTheSessionLength
"tampoco TDD, pasa de una"
	| expectedTicket firstCartId |
	firstCartId := self createValidCart .
	self addOneCopyOfThisBook: isbn1 to: firstCartId.
	webPage checkoutCart: firstCartId withACreditCard: validCreditCardParameters .
	
	gregorianClock delayAnAmountOfTime: (notAcceptableDelay ).
	
	expectedTicket := OrderedCollection with: (Association key: isbn1 value: oneCopy) with: price1.
		
	self assert: (webPage purchasesBy: validUser1 andPassword: validPassword) includes: expectedTicket .! !
!classDefinition: #Cart category: #'TusLibros-MainObjects'!
Object subclass: #Cart
	instanceVariableNames: 'listOfBooks'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!Cart methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionAddABookThatsNotInTheCatalogue

	^ 'That book is not in the catalogue'! !

!Cart methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionCannotAddAnInvalidAmountOfCopiesOfTheSameBook
	^'Cannot add an invalid amount of copies'.! !


!Cart methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:31'!
addBook: aBook  withCatalogue: aCatalogue

	self addThisAmountOfCopies: 1 ofThisBook: aBook withThisCatalogue: aCatalogue.! !

!Cart methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:45:10'!
addThisAmountOfCopies: anAmountOfCopies ofThisBook: aBookIsbn withThisCatalogue: aCatalogue 

	self assertThatTheBook: aBookIsbn isInTheCatalogue: aCatalogue.
	self assertThatTheAmountOfCopiesIsValid: anAmountOfCopies.
	
	listOfBooks add: aBookIsbn withOccurrences: anAmountOfCopies .! !

!Cart methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:31'!
emptyCart
	listOfBooks:= Bag new.! !

!Cart methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:31'!
listBooks
	^listOfBooks copy.! !


!Cart methodsFor: 'validations' stamp: 'fv 6/28/2024 11:45:10'!
assertThatTheAmountOfCopiesIsValid: anAmountOfCopies

	^ (anAmountOfCopies <= 0) ifTrue: [self error: self errorDescriptionCannotAddAnInvalidAmountOfCopiesOfTheSameBook ]! !

!Cart methodsFor: 'validations' stamp: 'fv 6/25/2024 18:28:31'!
assertThatTheBook: aBook isInTheCatalogue: aCatalogue

	^ (aCatalogue keys includes: aBook) ifFalse: [self error: self errorDescriptionAddABookThatsNotInTheCatalogue]! !

!Cart methodsFor: 'validations' stamp: 'fv 6/25/2024 18:28:31'!
bookListSizeEquals: anAmountOfBooks 
	^listOfBooks size = anAmountOfBooks .! !

!Cart methodsFor: 'validations' stamp: 'fv 6/25/2024 18:28:31'!
hasThisAmountOfCopies: anAmountOfCopies ofThisBook: aBookIsbn 
	
	^(listOfBooks occurrencesOf: aBookIsbn) = anAmountOfCopies .! !

!Cart methodsFor: 'validations' stamp: 'fv 6/25/2024 18:28:31'!
hasThisBook: aBook 
	^listOfBooks includes: aBook.! !

!Cart methodsFor: 'validations' stamp: 'fv 6/25/2024 18:28:31'!
isEmpty

	^listOfBooks isEmpty.! !


!Cart methodsFor: 'intialization' stamp: 'fv 6/25/2024 18:28:31'!
initialize

	listOfBooks := Bag new.! !


!classDefinition: #Cashier category: #'TusLibros-MainObjects'!
Object subclass: #Cashier
	instanceVariableNames: 'catalogue paymentSystem salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!Cashier methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:51:30'!
checkoutCart: aCart withCreditCard: aCreditCard andAnUniqueCredential: anUniqueCredential 
	
	| aTicket totalPrice creditCardIsExpired |
	self checkIfTheCartIsEmpty: aCart.
	
	creditCardIsExpired := [(aCreditCard checkIfTheCardIsExpired: GregorianMonthOfYear current)] ifError: [self error: self errorDescriptionCannotCheckoutWithoutACreditCard ].
	
	creditCardIsExpired ifTrue: [self error: self errorDescriptionInvalidExpirationDate ].
	
	totalPrice := self calculateTotalPriceFrom: aCart listBooks .
	paymentSystem debit: totalPrice from: aCreditCard.
	aTicket := self createTicket: aCart .
	
	salesBook at: anUniqueCredential 
	ifPresent: [:salesForThisCustomer | salesForThisCustomer add: aTicket] 
	ifAbsent: [salesBook at: anUniqueCredential put: (OrderedCollection with: aTicket )].
	
	aCart emptyCart.
	
	^aTicket.! !

!Cashier methodsFor: 'main-protocol' stamp: 'fv 6/27/2024 17:27:00'!
purchasesBy: anUniqueCredential 
	^salesBook at: anUniqueCredential ifAbsent: [^OrderedCollection new].! !


!Cashier methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionCannotCheckoutWithoutACreditCard
	^'Cannot checkout without a credit card'.! !

!Cashier methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionCantCheckoutEmptyCart
	^'Cant checkout an empty cart'! !

!Cashier methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionInvalidCreditCardNumber
	^'Cannot pay with a credit card with an invalid card number'.! !

!Cashier methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionInvalidExpirationDate
	^'Invalid expiration date'.! !

!Cashier methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionStolenCard
	^'Stolen card!!'.! !


!Cashier methodsFor: 'private' stamp: 'fv 6/26/2024 15:53:41'!
addAllTheBooksAndItsCopiesTo: aTicket using: aBookList

	aBookList asSet do: [:aBook | 
		aTicket add: (Association key: aBook value: (aBookList occurrencesOf: aBook)).
		]! !

!Cashier methodsFor: 'private' stamp: 'fv 6/26/2024 15:43:12'!
addTheFinalPriceTo: aTicket using: aBookList

	| total |
	total := self calculateTotalPriceFrom: aBookList.

	aTicket add: total! !

!Cashier methodsFor: 'private' stamp: 'fv 6/26/2024 15:13:11'!
calculateTotalPriceFrom: aBookList

	^ aBookList asSet sum: [:aBook | 
		(aBookList occurrencesOf: aBook) * catalogue at: aBook
		]! !

!Cashier methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
checkIfTheCartIsEmpty: aCart

	^ aCart isEmpty ifTrue: [self error: self errorDescriptionCantCheckoutEmptyCart ]! !

!Cashier methodsFor: 'private' stamp: 'fv 6/26/2024 15:51:34'!
createTicket: aCart  

	| aBookList aTicket |
	
	aBookList := aCart listBooks .
	aTicket := OrderedCollection new.
	
	self addAllTheBooksAndItsCopiesTo: aTicket using: aBookList.
	self addTheFinalPriceTo: aTicket using: aBookList.
	
	^aTicket
	
	
	
	! !

!Cashier methodsFor: 'private' stamp: 'fv 6/27/2024 14:02:28'!
salesBook
	^salesBook! !

!Cashier methodsFor: 'private' stamp: 'fv 6/26/2024 19:29:46'!
salesBookHasThisTicket: aTicket forThisCustomer: aCustomerName 
	^(salesBook at: aCustomerName) includes: aTicket.! !

!Cashier methodsFor: 'private' stamp: 'fv 6/26/2024 15:57:29'!
salesBookIsEmpty
	^salesBook isEmpty.! !


!Cashier methodsFor: 'initialization' stamp: 'fv 6/26/2024 19:41:45'!
initializeWith: aCatalogue andPaymentSystem: aPaymentSystem 

	catalogue := aCatalogue.
	paymentSystem := aPaymentSystem .
	salesBook := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-MainObjects'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'fv 6/25/2024 18:28:31'!
withCatalogue: aCatalogue andAPaymentSystem: aPaymentSystem 

	^self new initializeWith: aCatalogue andPaymentSystem: aPaymentSystem.! !


!classDefinition: #CreditCard category: #'TusLibros-MainObjects'!
Object subclass: #CreditCard
	instanceVariableNames: 'cardNumber expirationDate holderName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!CreditCard methodsFor: 'initialization' stamp: 'fv 6/28/2024 09:47:05'!
initializeWithNumber: aCreditCardNumber expirationMonth: aMonthNumber expirationYear: aYearNumber andName: aCreditCardHolderName 

	
	self checkIfTheNumberIsLongerThan15Digits: aCreditCardNumber.
	
	cardNumber := aCreditCardNumber.
	expirationDate := GregorianMonthOfYear yearNumber: aYearNumber monthNumber: aMonthNumber.
	holderName := aCreditCardHolderName.! !


!CreditCard methodsFor: 'accessing' stamp: 'fv 6/25/2024 18:28:31'!
expirationDate
	^expirationDate .! !

!CreditCard methodsFor: 'accessing' stamp: 'fv 6/26/2024 14:23:51'!
holderName
	^holderName .! !

!CreditCard methodsFor: 'accessing' stamp: 'fv 6/26/2024 14:24:01'!
number
	^cardNumber .! !


!CreditCard methodsFor: 'checks' stamp: 'fv 6/27/2024 17:38:06'!
checkIfTheCardIsExpired: aGregorianDateTimeNow

	^ (aGregorianDateTimeNow > expirationDate).! !

!CreditCard methodsFor: 'checks' stamp: 'fv 6/25/2024 18:28:31'!
checkIfTheNumberIsLongerThan15Digits: aCreditCardNumber

	^ (aCreditCardNumber  size < 15) ifTrue: [self error: CreditCard errorDescriptionInvalidCreditCardNumber ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros-MainObjects'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionInvalidCreditCardNumber
	^'Cannot pay with a credit card with an invalid card number'.! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'fv 6/27/2024 17:19:17'!
errorDescriptionInvalidExpirationDate
	^'Cannot pay with an expired card'.! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'fv 6/25/2024 18:28:31'!
withNumber: aCreditCardNumber expirationMonth: aMonthNumber expirationYear: aYearNumber andName: aCreditCardHolderName 

	^self new initializeWithNumber: aCreditCardNumber expirationMonth: aMonthNumber expirationYear: aYearNumber andName: aCreditCardHolderName .! !


!classDefinition: #SessionValidator category: #'TusLibros-MainObjects'!
Object subclass: #SessionValidator
	instanceVariableNames: 'cartCreationDates internalClock sessionLength'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!SessionValidator methodsFor: 'errorMessages' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionExpiredSession

	^'The session has expired'! !


!SessionValidator methodsFor: 'mainProtocol' stamp: 'fv 6/25/2024 18:28:31'!
addCreationDateFor: newCartId 
	cartCreationDates add: (Association key: newCartId value: internalClock now ).! !

!SessionValidator methodsFor: 'mainProtocol' stamp: 'fv 6/28/2024 14:55:25'!
checkIfTheSessionHasExpiredFor: aCartID 
	| creationTime timeNow sessionIsExpired |
	timeNow := internalClock now.
	creationTime := (cartCreationDates at: aCartID).
	
	sessionIsExpired := ((creationTime distanceTo: timeNow) > sessionLength).
	
	sessionIsExpired ifTrue: [cartCreationDates removeKey: aCartID.] ifFalse: [self updateSessionStartFor: aCartID].
	
	^sessionIsExpired.! !

!SessionValidator methodsFor: 'mainProtocol' stamp: 'fv 6/25/2024 18:28:31'!
modifySessionLength: aSessionLength

	sessionLength := aSessionLength .! !

!SessionValidator methodsFor: 'mainProtocol' stamp: 'fv 6/25/2024 18:28:31'!
updateSessionStartFor: aCartID 
	cartCreationDates at: aCartID put: internalClock now.! !


!SessionValidator methodsFor: 'initialization' stamp: 'fv 6/25/2024 18:28:31'!
initializeWithAnInternalClock: anInternalClock andASessionLength: aSessionLength

	internalClock := anInternalClock .
	sessionLength := aSessionLength.
	cartCreationDates := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SessionValidator class' category: #'TusLibros-MainObjects'!
SessionValidator class
	instanceVariableNames: ''!

!SessionValidator class methodsFor: 'as yet unclassified' stamp: 'fv 6/25/2024 18:28:31'!
createWithInternalClock: anInternalClock andASessionLength: aSessionLength

	^self basicNew initializeWithAnInternalClock: anInternalClock andASessionLength: aSessionLength.! !


!classDefinition: #TusLibrosHttpProtocolInterface category: #'TusLibros-MainObjects'!
Object subclass: #TusLibrosHttpProtocolInterface
	instanceVariableNames: 'webPage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!TusLibrosHttpProtocolInterface methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:30'!
errorDescriptionCannotAddAnInvalidAmountOfCopiesOfTheSameBook
	^'Error: Cannot add an invalid amount of copies'.! !

!TusLibrosHttpProtocolInterface methodsFor: 'error-descriptions' stamp: 'fv 6/28/2024 15:37:07'!
errorDescriptionInvalidCartID
	^'Error: That cart doesnt exist'.! !

!TusLibrosHttpProtocolInterface methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionInvalidCredentials
	^'Error: Invalid credentials'.! !

!TusLibrosHttpProtocolInterface methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:30'!
errorDescriptionInvalidParameters
	^'Error: The request fields are invalid'.! !

!TusLibrosHttpProtocolInterface methodsFor: 'error-descriptions' stamp: 'fv 6/25/2024 18:28:30'!
errorDescriptionTheBookIsNotOnTheCatalogue

	^ 'Error: That book is not in the catalogue'! !


!TusLibrosHttpProtocolInterface methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:37:02'!
addToCart: aHttpRequestParameters

	| bookIsbn bookQuantity cartId |
	
	[self validateThatTheAddToCartHttpRequestIsValid: aHttpRequestParameters] ifError: [^self createInvalidHttpRequestResponse ].
	
	cartId := aHttpRequestParameters at: 'cartId' .
	bookIsbn := aHttpRequestParameters at: 'bookIsbn'.
	bookQuantity := aHttpRequestParameters at: 'bookQuantity'.
	
	[ webPage addToCart: cartId asNumber withISBN: bookIsbn asNumber withThisQuantity: bookQuantity asNumber] 
				ifError: [:anErrorMessageText | ^self createNegativeHttpResponseWithInfo: anErrorMessageText ].
				
	^self createPositiveHttpResponseWithInfo: 'OK'.! !

!TusLibrosHttpProtocolInterface methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:37:02'!
checkOutCart: aHttpRequestParameters 
	
	| cardExpirationDate cardHolderName cardNumber cartId expirationMonth expirationYear transactionId |  
	[self validateThatTheCheckOutCartHttpRequestIsValid: aHttpRequestParameters] ifError: [^self createInvalidHttpRequestResponse ].
	
	cartId := aHttpRequestParameters at: 'cartId'.
	cardNumber := aHttpRequestParameters at: 'ccn'.
	cardExpirationDate := aHttpRequestParameters at: 'cced'.
	cardHolderName := aHttpRequestParameters at: 'cco'.
	
	expirationMonth := (cardExpirationDate copyFrom: 1 to: 2) asNumber.
	expirationYear := (cardExpirationDate copyFrom: 3 to: 6) asNumber.
	
	[  transactionId := webPage checkoutCart: cartId asNumber withACreditCard: {cardNumber. expirationMonth. expirationYear . cardHolderName }]
				ifError: [:anErrorMessageText | ^self createNegativeHttpResponseWithInfo: anErrorMessageText ].
	
	^self createPositiveHttpResponseWithInfo: transactionId.! !

!TusLibrosHttpProtocolInterface methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:37:02'!
createCart: aHttpRequestParameters 
	
	|   cartId clientId password |
	
	[self validateThatTheCreateCartHttpRequestIsValid: aHttpRequestParameters ] ifError: [^self createInvalidHttpRequestResponse]. 
	
	clientId := aHttpRequestParameters at: 'clientId'.
	password := aHttpRequestParameters at: 'password'.

	[cartId := webPage createCartwithUser: clientId andPassword: password] 
					ifError: [:anErrorMessageText | ^self createNegativeHttpResponseWithInfo: anErrorMessageText ].
	
	^self createPositiveHttpResponseWithInfo: cartId asString .! !

!TusLibrosHttpProtocolInterface methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:37:02'!
listCart: aHttpRequestParameters 
	
	| cartId bookList bookListSerialized |
	[self validateThatTheListCartHttpRequestIsValid: aHttpRequestParameters] ifError: [^self createInvalidHttpRequestResponse ].
	
	cartId := aHttpRequestParameters at: 'cartId'.
	
	bookList := [webPage listCart: cartId asNumber] ifError: [:anErrorMessageText | ^self createNegativeHttpResponseWithInfo: anErrorMessageText ].
	
	bookListSerialized := self serializeTheBookList: bookList.
	
	^self createPositiveHttpResponseWithInfo: bookListSerialized.! !

!TusLibrosHttpProtocolInterface methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 11:37:02'!
listPurchases: aHttpRequestParameters 
	| clientId password purchasesList |
	
	[self validateThatTheListPurchasesHttpRequestIsValid: aHttpRequestParameters ] ifError: [^self createInvalidHttpRequestResponse ].
	
	clientId := aHttpRequestParameters at: 'clientId'.
	password := aHttpRequestParameters at: 'password'.
	
	purchasesList := [webPage purchasesBy: clientId andPassword: password ] ifError: [:anErrorMessageText | ^self createNegativeHttpResponseWithInfo: anErrorMessageText ].
	
	purchasesList ifEmpty: [ ^self createPositiveHttpResponseWithInfo: '0'].
	
	
	^self createPositiveHttpResponseWithInfo: (self serializeThePurchasesList: purchasesList ).! !


!TusLibrosHttpProtocolInterface methodsFor: 'httpResponse-creation' stamp: 'fv 6/25/2024 18:28:31'!
createHttpResponseWithHttpCode: httpCode statusCode: aStatusCode andInfo: anInfoString
	
	| response |
	response := Dictionary new.
	
	response add: (Association key: 'httpCode' value: httpCode).
	response add: (Association key: 'responseBody' value: aStatusCode,'|',anInfoString).
	
	^response! !

!TusLibrosHttpProtocolInterface methodsFor: 'httpResponse-creation' stamp: 'fv 6/25/2024 18:28:30'!
createInvalidHttpRequestResponse

	^ self createHttpResponseWithHttpCode: '400' statusCode: '1' andInfo: self errorDescriptionInvalidParameters! !

!TusLibrosHttpProtocolInterface methodsFor: 'httpResponse-creation' stamp: 'fv 6/25/2024 18:28:30'!
createNegativeHttpResponseWithInfo: anInformationString

	^ self createHttpResponseWithHttpCode: '400' statusCode: '1' andInfo: anInformationString! !

!TusLibrosHttpProtocolInterface methodsFor: 'httpResponse-creation' stamp: 'fv 6/25/2024 18:28:30'!
createPositiveHttpResponseWithInfo: anInformationString

	^ self createHttpResponseWithHttpCode: '200' statusCode: '0' andInfo: anInformationString! !


!TusLibrosHttpProtocolInterface methodsFor: 'private' stamp: 'fv 6/28/2024 00:46:05'!
calculateTotalSpentAmountFrom: aPurchasesList 

	^aPurchasesList sum: [:aTicket | 
		aTicket last.
		].! !

!TusLibrosHttpProtocolInterface methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:30'!
checkThatTheSizeOfTheHttpRequest: aHttpRequest equals: aSize

	(aHttpRequest size = aSize) ifFalse: [self error: self errorDescriptionInvalidParameters ].! !

!TusLibrosHttpProtocolInterface methodsFor: 'private' stamp: 'fv 6/28/2024 00:42:10'!
combineEveryTicketTogether: aPurchasesList 

	| countingBag |
	
	countingBag := Bag new.
	
	aPurchasesList do: [:aTicket | 
		aTicket allButLast do: [:aPairIsbnQuantity | 
			countingBag add: aPairIsbnQuantity key withOccurrences: aPairIsbnQuantity value].
		].
	
	^countingBag.! !

!TusLibrosHttpProtocolInterface methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:30'!
serializeTheBookList: aBookList
	
	| bookListSerialized |
	bookListSerialized := ''.
	aBookList asSet do: [:aBookIsnb | | amountOfCopies | 
		amountOfCopies := aBookList occurrencesOf: aBookIsnb.
		bookListSerialized := bookListSerialized,aBookIsnb asString,'|',amountOfCopies asString,'|'
		].
	^bookListSerialized allButLast.! !

!TusLibrosHttpProtocolInterface methodsFor: 'private' stamp: 'fv 6/28/2024 09:37:21'!
serializeThePurchasesList: aPurchasesList 

	| purchasesListSerialized soldCopiesPerBook total |
	
	soldCopiesPerBook := self combineEveryTicketTogether: aPurchasesList .
	purchasesListSerialized := self serializeTheBookList: soldCopiesPerBook.
	total := self calculateTotalSpentAmountFrom: aPurchasesList .
	
	^purchasesListSerialized,'|',(total asString copyUpTo: $ ).! !


!TusLibrosHttpProtocolInterface methodsFor: 'validations-private' stamp: 'fv 6/27/2024 15:53:41'!
validateThatTheAddToCartHttpRequestIsValid: aHttpRequest

	self checkThatTheSizeOfTheHttpRequest: aHttpRequest equals: 3.

	(aHttpRequest at: 'cartId') asNumber.
	(aHttpRequest at: 'bookIsbn').
	(aHttpRequest at: 'bookQuantity') asNumber.! !

!TusLibrosHttpProtocolInterface methodsFor: 'validations-private' stamp: 'fv 6/28/2024 12:01:02'!
validateThatTheCheckOutCartHttpRequestIsValid: aHttpRequest

	
	| cartId creditCardNumber expirationDate name |
	self checkThatTheSizeOfTheHttpRequest: aHttpRequest equals: 4.

	cartId := aHttpRequest at: 'cartId'.
	creditCardNumber := aHttpRequest at: 'ccn' .
	expirationDate := aHttpRequest at: 'cced'.
	name := aHttpRequest at: 'cco'.
	
	
	creditCardNumber size = 16 ifFalse: [^self error: 'Invalid credit card number'].
	expirationDate size = 6 ifFalse: [^self error: 'Expiration date needs to be 6 digits long'].
	
	cartId asNumber .
	creditCardNumber asNumber.
	expirationDate asNumber.
	
	
	! !

!TusLibrosHttpProtocolInterface methodsFor: 'validations-private' stamp: 'fv 6/25/2024 18:28:30'!
validateThatTheCreateCartHttpRequestIsValid: aHttpRequest 
	
	self checkThatTheSizeOfTheHttpRequest: aHttpRequest equals: 2.
	(aHttpRequest keys includesAllOf: {'clientId'. 'password'.}) ifFalse: [self error: self errorDescriptionInvalidParameters ].! !

!TusLibrosHttpProtocolInterface methodsFor: 'validations-private' stamp: 'fv 6/25/2024 18:28:31'!
validateThatTheListCartHttpRequestIsValid: aHttpRequest 
	
	self checkThatTheSizeOfTheHttpRequest: aHttpRequest equals: 1.
	(aHttpRequest at: 'cartId') asNumber.! !

!TusLibrosHttpProtocolInterface methodsFor: 'validations-private' stamp: 'fv 6/27/2024 16:00:21'!
validateThatTheListPurchasesHttpRequestIsValid: aHttpRequest 
	
	self checkThatTheSizeOfTheHttpRequest: aHttpRequest equals: 2.
	(aHttpRequest keys includesAllOf: {'clientId'. 'password'.}) ifFalse: [self error: self errorDescriptionInvalidParameters ].! !


!TusLibrosHttpProtocolInterface methodsFor: 'initialization' stamp: 'fv 6/28/2024 11:37:02'!
initializeWithCatalogue: aCatalogue andWithAnAuthenticationSystem: anAuthenticationSystem andPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator     
	webPage := TusLibrosWebPage createWithCatalogue: aCatalogue andAuthenticationSystem: anAuthenticationSystem andPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosHttpProtocolInterface class' category: #'TusLibros-MainObjects'!
TusLibrosHttpProtocolInterface class
	instanceVariableNames: ''!

!TusLibrosHttpProtocolInterface class methodsFor: 'as yet unclassified' stamp: 'fv 6/25/2024 18:28:31'!
createWithCatalogue: aCatalogue andAuthenticationSystem: anAuthenticationSystem andAPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator      
	^self basicNew initializeWithCatalogue: aCatalogue andWithAnAuthenticationSystem: anAuthenticationSystem andPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator .! !


!classDefinition: #TusLibrosWebPage category: #'TusLibros-MainObjects'!
Object subclass: #TusLibrosWebPage
	instanceVariableNames: 'cartList cartIDs catalogue authenticationSystem paymentSystem sessionValidator clientIdsByCartIds cashier'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!TusLibrosWebPage methodsFor: 'errors' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionExpiredSession

	^'The session has expired'! !

!TusLibrosWebPage methodsFor: 'errors' stamp: 'fv 6/28/2024 15:37:01'!
errorDescriptionInvalidCartID
	^'That cart doesnt exist'.! !


!TusLibrosWebPage methodsFor: 'initialization' stamp: 'fv 6/27/2024 15:11:03'!
initializeWithACatalogue: aCatalogue andWithAnAuthenticationSystem: anAuthenticationSystem andWithAPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator  
	cartIDs :=0.
	cartList := Dictionary new.
	catalogue:= aCatalogue.
	
	authenticationSystem := anAuthenticationSystem.
	paymentSystem:=aPaymentSystem .
	sessionValidator := aSessionValidator.
	
	cashier := Cashier withCatalogue: catalogue andAPaymentSystem: paymentSystem .
	clientIdsByCartIds := Dictionary new.
	
	! !


!TusLibrosWebPage methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:31'!
addToCart: aCartID withISBN: anISBN withThisQuantity: aQuantity
	
	| cart |
	cart := self getCart: aCartID.
	
	self validSessionCheckFor: aCartID.
	
	cart addThisAmountOfCopies: aQuantity ofThisBook: anISBN withThisCatalogue: catalogue.
	! !

!TusLibrosWebPage methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 09:42:53'!
checkoutCart: aCartID withACreditCard: aCreditCardParameters        

	| aCreditCard aTransactionId cartToCheckout |
	
	cartToCheckout := self getCart: aCartID.
	self validSessionCheckFor: aCartID.
	
	aCreditCard := self createCreditCardWithParameters:  aCreditCardParameters .

	cashier checkoutCart: cartToCheckout withCreditCard: aCreditCard andAnUniqueCredential: (clientIdsByCartIds at: aCartID).
	aTransactionId := self createNewTransactionId.
	
	^aTransactionId 	
	! !

!TusLibrosWebPage methodsFor: 'main-protocol' stamp: 'fv 6/27/2024 15:11:03'!
createCartwithUser: anUser andPassword: aPassword 
	
	| newCartId |
	self authenticateUser: anUser andPassword: aPassword .
	newCartId := self createNewCartId.
	cartList add: (Association key: newCartId value: Cart new).
	clientIdsByCartIds at: newCartId put: anUser.
	sessionValidator addCreationDateFor: newCartId.
	
	^newCartId.! !

!TusLibrosWebPage methodsFor: 'main-protocol' stamp: 'fv 6/27/2024 14:26:50'!
listCart: aCartID
	
	| cartToList |
	cartToList := self getCart: aCartID .
	self validSessionCheckFor: aCartID.
	
	
	^cartToList listBooks.! !

!TusLibrosWebPage methodsFor: 'main-protocol' stamp: 'fv 6/27/2024 15:07:25'!
purchasesBy: aClientId andPassword: aPassword 

	self authenticateUser: aClientId andPassword: aPassword .

	^cashier purchasesBy: aClientId.! !


!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
addANewCartToTheCartList

	^ cartList add: Cart new! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
authenticateUser: anUser andPassword: aPassword

	^ authenticationSystem authenticate: anUser withPassword: aPassword! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
createCreditCardWithParameters: aCreditCardParameters

	| creditCardExpirationMonth creditCardExpirationYear creditCardHolderName creditCardNumber |
	creditCardNumber := aCreditCardParameters first.
	creditCardExpirationMonth := aCreditCardParameters second.
	creditCardExpirationYear := aCreditCardParameters third.
	creditCardHolderName := aCreditCardParameters last.
	
	^CreditCard withNumber: creditCardNumber expirationMonth: creditCardExpirationMonth expirationYear: creditCardExpirationYear andName: creditCardHolderName.
	
	! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
createNewCartId

	cartIDs := cartIDs + 1.
	^cartIDs! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
createNewTransactionId

	^ UUID new asString! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/25/2024 18:28:31'!
getCart: aCartId

	^ cartList at: aCartId ifAbsent: [self error: self errorDescriptionInvalidCartID]! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/27/2024 14:02:53'!
salesBook
	^cashier salesBook.! !

!TusLibrosWebPage methodsFor: 'private' stamp: 'fv 6/28/2024 14:54:15'!
validSessionCheckFor: aCartID

	(sessionValidator checkIfTheSessionHasExpiredFor: aCartID) ifTrue: [cartList removeKey: aCartID.
															self error: self errorDescriptionExpiredSession .].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosWebPage class' category: #'TusLibros-MainObjects'!
TusLibrosWebPage class
	instanceVariableNames: ''!

!TusLibrosWebPage class methodsFor: 'initialization' stamp: 'fv 6/25/2024 18:28:31'!
createWithCatalogue: aCatalogue andAuthenticationSystem: anAuthenticationSystem andPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator     
	^self basicNew initializeWithACatalogue: aCatalogue andWithAnAuthenticationSystem: anAuthenticationSystem andWithAPaymentSystem: aPaymentSystem andASessionValidator: aSessionValidator .! !


!TusLibrosWebPage class methodsFor: 'error' stamp: 'fv 6/25/2024 18:28:31'!
errorDescriptionInvalidCredentials
	^'Invalid credentials'.! !


!classDefinition: #TusLibrosWebServer category: #'TusLibros-MainObjects'!
Object subclass: #TusLibrosWebServer
	instanceVariableNames: 'httpProtocolInterface server catalogue authenticationSystem sessionValidator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-MainObjects'!

!TusLibrosWebServer methodsFor: 'initialization' stamp: 'fv 6/28/2024 15:14:37'!
initialize
	 
	catalogue := Dictionary newFromPairs: {9780137314942. 31505 * peso. 9780321278654. 45305*peso. 9780201710915. 45180*peso. 9780321125217. 41000*peso. 9780735619654. 34900*peso. 9780321146533. 29100*peso}.

	authenticationSystem := OAuthAuthenticationSystem new.	
	
	sessionValidator := SessionValidator createWithInternalClock: GregorianDateTime andASessionLength: 30 * minute.

	httpProtocolInterface := TusLibrosHttpProtocolInterface createWithCatalogue: catalogue andAuthenticationSystem: authenticationSystem andAPaymentSystem: MercadoPago new andASessionValidator: sessionValidator .
	
	server := WebServer reset default.! !


!TusLibrosWebServer methodsFor: 'private' stamp: 'fv 6/28/2024 15:54:00'!
addEndpointAddToCart
	
	self addEndpointNamed: 'addToCart' withSymbol: #addToCart:.! !

!TusLibrosWebServer methodsFor: 'private' stamp: 'fv 6/28/2024 15:54:04'!
addEndpointCheckoutCart

	self addEndpointNamed: 'checkOutCart' withSymbol: #checkOutCart:.! !

!TusLibrosWebServer methodsFor: 'private' stamp: 'fv 6/28/2024 15:54:11'!
addEndpointCreateCart

	self addEndpointNamed: 'createCart' withSymbol: #createCart:.! !

!TusLibrosWebServer methodsFor: 'private' stamp: 'fv 6/28/2024 15:54:15'!
addEndpointListCart

	self addEndpointNamed: 'listCart' withSymbol: #listCart:.! !

!TusLibrosWebServer methodsFor: 'private' stamp: 'fv 6/28/2024 15:54:18'!
addEndpointListPurchases

	self addEndpointNamed: 'listPurchases' withSymbol: #listPurchases:.! !

!TusLibrosWebServer methodsFor: 'private' stamp: 'fv 6/28/2024 15:54:22'!
addEndpointNamed: aMessageName withSymbol: aMessageSymbol

	server addService: '/',aMessageName action: [:request | | requestFields response | 
		requestFields := request fields.
		response := httpProtocolInterface perform: aMessageSymbol with: requestFields.
		"response := httpProtocolInterface listPurchases: requestFields."
		request sendResponseCode: (response at: 'httpCode')
		content: (response at: 'responseBody') 
		type: 'text/plain; charset=utf-8' 
		do: [:aResponse |]].! !


!TusLibrosWebServer methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 15:15:22'!
modifySessionLength: aSessionLength

	sessionValidator modifySessionLength: aSessionLength.! !

!TusLibrosWebServer methodsFor: 'main-protocol' stamp: 'fv 6/28/2024 00:17:56'!
startOnPort: aPort 

	self addEndpointCreateCart.
	
	self addEndpointListCart.
	
	self addEndpointAddToCart.
	
	self addEndpointCheckoutCart.
	
	self addEndpointListPurchases .
	
	server listenOn: aPort.
	server useDebugErrorHandler.! !

!TusLibrosWebServer methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:31'!
stop
	server destroy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosWebServer class' category: #'TusLibros-MainObjects'!
TusLibrosWebServer class
	instanceVariableNames: ''!

!TusLibrosWebServer class methodsFor: 'as yet unclassified' stamp: 'fv 6/28/2024 00:10:19'!
createServer

	^self basicNew initialize.
	! !
!classDefinition: #GregorianTimeStub category: #'TusLibros-Stubs'!
Object subclass: #GregorianTimeStub
	instanceVariableNames: 'timeOfDay actual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Stubs'!

!GregorianTimeStub methodsFor: 'initialization' stamp: 'fv 6/25/2024 18:28:22'!
initialize
	actual := GregorianDateTime now .! !


!GregorianTimeStub methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:22'!
delayAnAmountOfTime: aPeriodOfTime
	
	actual :=  actual next: aPeriodOfTime .
! !

!GregorianTimeStub methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:22'!
now
	^actual.! !

!GregorianTimeStub methodsFor: 'main-protocol' stamp: 'fv 6/25/2024 18:28:22'!
timeOfDay

	^actual timeOfDay.! !


!classDefinition: #MercadoPagoStub category: #'TusLibros-Stubs'!
Object subclass: #MercadoPagoStub
	instanceVariableNames: 'stolenCards paymentSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Stubs'!

!MercadoPagoStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
acceptAllCards
	^self validatePayment:[:anAmountToDebit :creditCard].! !

!MercadoPagoStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
debit: anAmountToDebit from: aCreditCard
	paymentSystem value: anAmountToDebit value: aCreditCard.! !

!MercadoPagoStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
denyCard
	self validatePayment: [:anAmountToDebit :aCreditCard | self error: 'Stolen card!!'].! !

!MercadoPagoStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
validatePayment: aBlock
	paymentSystem := aBlock.! !


!classDefinition: #OAuthStub category: #'TusLibros-Stubs'!
Object subclass: #OAuthStub
	instanceVariableNames: 'registeredUsers authenticationSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Stubs'!

!OAuthStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
acceptAllCredentials
	^self validateUser:[:user :password].! !

!OAuthStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
authenticate: aUser withPassword: aPassword
	authenticationSystem value: aUser value: aPassword.! !

!OAuthStub methodsFor: 'public' stamp: 'fv 6/28/2024 11:28:42'!
denyCredentials
	self validateUser: [:userId :password | self error: TusLibrosWebPage errorDescriptionInvalidCredentials].! !

!OAuthStub methodsFor: 'public' stamp: 'fv 6/25/2024 18:28:22'!
validateUser: aBlock
	authenticationSystem := aBlock.! !
