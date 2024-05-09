!classDefinition: #PortfolioTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolio1 portfolio2 portfolio3 cuenta1 cuenta2 cuenta3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'setUp' stamp: 'sdz 5/3/2024 19:08:40'!
setUp
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	cuenta3 := ReceptiveAccount new.! !


!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:44:50'!
test01agregarUnaCuenta

	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	self assert: portfolio1 balance equals: 0*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:45:20'!
test02transaccionesUnaCuenta

	Deposit register: 50*peso on: cuenta1 .
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	
	self assert: portfolio1 transactions equals: cuenta1 transactions .! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:45:39'!
test03registroUnaTransaccionunacuenta

	| deposit |
	deposit := Deposit register: 50*peso on: cuenta1 .
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	
	self assert: (portfolio1 hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:46:02'!
test04AgregarCuentayportfolio

	Deposit register: 150 *peso on: cuenta1 .
	Deposit register: 50*peso on: cuenta2 .
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta2 .
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2 .
	
	self assert: portfolio1 balance equals: 200*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:46:17'!
test05transaccionesMultiplesCuentas

	| coleccion deposito1 deposito2 |
	
	deposito1 := Deposit register: 50*peso on: cuenta1 .
	deposito2 := Deposit register: 150 *peso on: cuenta2 .
	coleccion := OrderedCollection with: deposito1 with: deposito2. 
	
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta2 .
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2 .
	
	self assert: portfolio1 transactions equals: coleccion .! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:46:41'!
test06registroTransaccionMultiplesCuentas

	| deposito1 |
	deposito1 := Deposit register: 50*peso on: cuenta1 .
	
	Deposit register: 150 *peso on: cuenta2 .
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta2 .
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2 .
	
	self assert: (portfolio1 hasRegistered: deposito1) .! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:01:30'!
test07errorCuentaRepetida
	"Un portfolio no puede agregar dos veces la misma cuenta"
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	
	self 
        		should: [portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorAñadirCuentaRepetida equals: anError messageText ]
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:01:22'!
test08errorPortfolioEnCuentaRepetida
	"No puedo agregar un portfolio a otro porfolio, si el primero incluye una cuenta que el segundo ya tiene."
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta1.
	
	self 
        		should: [portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorAñadirCuentaRepetida equals: anError messageText ].
	

	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:00:55'!
test09agregarseASiMismo
	"Un portfolio no se puede incluir a sí mismo"
	self 
        		should: [portfolio1 agregarUnaCuentaOUnPortfolio: portfolio1.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorPortfolioNoSePuedeAñadirASiMismo equals: anError messageText ]
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:00:41'!
test10cuentaCuandoOtroPortfolioYaLaTiene
	"Un portfolio no puede agregar una cuenta ya incluída en un portfolio previamente agregado."
	
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.
	self 
        		should: [portfolio2 agregarUnaCuentaOUnPortfolio: cuenta1.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorAñadirCuentaRepetida equals: anError messageText ]
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 19:48:01'!
test11yaEsHijoDeOtro
	"No puedo agregar una cuenta a un portfolio cuando este último ya es hijo de otro portfolio padre que tenía dicha cuenta."
	
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.
	portfolio2 agregarUnaCuentaOUnPortfolio: portfolio3.
	self 
        		should: [portfolio3 agregarUnaCuentaOUnPortfolio: cuenta1.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorAñadirCuentaRepetida equals: anError messageText ]
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:00:17'!
test12agregarCuentaRepetidaAPortfolioHijo
	"No puedo agregar una cuenta a un portfolio cuando este último ya es hijo de otro portfolio padre que tenía dicha cuenta."
	
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.
	self 
        		should: [portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorAñadirCuentaRepetida equals: anError messageText ]
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:07:32'!
test13NoPuedoAgregarUnPortfolioVacioDosVeces
	"""Un portfolio no puede agregar dos veces el mismo portfolio.
	Caso borde que no contabilizamos antes con las cuentas.
	"""
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.
	self 
        		should: [portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Portfolio descripcionErrorAñadirCuentaRepetida equals: anError messageText ]
	
! !


!classDefinition: #ReceptiveAccountTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'sdz 4/30/2024 20:49:02'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: account transactions includes: deposit.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fv 5/3/2024 15:12:02'!
test08AlRealizarUnaTransferenciaSeModificaElBalanceDeAmbasCuentasCorrectamente 

	| cuentaOrigen cuentaDestino deposito transferencia |
	
	cuentaOrigen := ReceptiveAccount new.
	cuentaDestino := ReceptiveAccount  new.
	
	deposito := Deposit register: 50 * peso on: cuentaOrigen.
	transferencia := Transferencia transferir: 50*peso desde: cuentaOrigen a: cuentaDestino.
	
	self assert: cuentaOrigen balance equals: 0*peso.
	self assert: cuentaDestino balance equals: 50*peso.
	
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fv 5/3/2024 15:12:16'!
test09UnaTransferenciaConoceSuValor

	| cuentaOrigen cuentaDestino deposito transferencia|
	
	cuentaOrigen := ReceptiveAccount new.
	cuentaDestino := ReceptiveAccount  new.
	deposito := Deposit register: 100 * peso on: cuentaOrigen.
	transferencia := Transferencia transferir: 50*peso desde: cuentaOrigen a: cuentaDestino.
	
	self assert: (transferencia value) equals: (50*peso).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fv 5/6/2024 20:49:45'!
test10AlRealizarUnaTransferenciaAmbasPatasSeConocenEntreSi

	| cuentaOrigen cuentaDestino deposito transferencia pataDeposito pataExtraccion |
	
	cuentaOrigen := ReceptiveAccount new.
	cuentaDestino := ReceptiveAccount  new.
	deposito := Deposit register: 100 * peso on: cuentaOrigen.
	transferencia := Transferencia transferir: 50*peso desde: cuentaOrigen a: cuentaDestino.
	
	pataDeposito := cuentaDestino ultimaTransaccion.
	pataExtraccion := cuentaOrigen ultimaTransaccion.
	
	self assert: pataDeposito equals: pataExtraccion contraparte.
	self assert: pataExtraccion equals: pataDeposito contraparte.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fv 5/3/2024 15:12:55'!
test11NoPuedoTransferirCeroPesosAOtraCuenta

	| cuentaOrigen cuentaDestino deposito |
	
	cuentaOrigen := ReceptiveAccount new.
	cuentaDestino := ReceptiveAccount  new.
	deposito := Deposit register: 100 * peso on: cuentaOrigen.
	
	self 
        		should: [Transferencia transferir: 0*peso desde: cuentaOrigen a: cuentaDestino]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Transferencia descripcionErrorTransferirCeroPesos equals: anError messageText ]
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fv 5/3/2024 15:13:11'!
test12NoPuedoTransferirUnSaldoNegativoAOtraCuenta

	| cuentaOrigen cuentaDestino deposito |
	
	cuentaOrigen := ReceptiveAccount new.
	cuentaDestino := ReceptiveAccount  new.
	deposito := Deposit register: 100 * peso on: cuentaOrigen.
	
	self 
        		should: [Transferencia transferir: -50*peso desde: cuentaOrigen a: cuentaDestino]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Transferencia descripcionErrorTransferenciaNegativa equals: anError messageText ]! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'sdz 5/3/2024 19:38:46'!
test13NoPuedoHacerUnaTransferenciaConMigoMismo

	| cuentaOrigen |
	
	cuentaOrigen := ReceptiveAccount new.
	
	self 
        		should: [Transferencia transferir: 50*peso desde: cuentaOrigen a: cuentaOrigen ]
        		raise: Error
        		withExceptionDo: [ :anError | self assert: Transferencia descripcionErrorNoPuedoTransferirmeAMiMismo equals: anError messageText ]! !


!classDefinition: #ReporteNetoTransferenciasTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReporteNetoTransferenciasTest
	instanceVariableNames: 'portfolio1 portfolio2 portfolio3 cuenta1 cuenta2 cuenta3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReporteNetoTransferenciasTest methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 20:26:44'!
setUp
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	cuenta3 := ReceptiveAccount new.! !

!ReporteNetoTransferenciasTest methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 21:07:19'!
test01Sintransferencias
	
	| reporteNeto |
	reporteNeto := (ReporteNetoTransferencias paraLaCuenta: cuenta1) calcular.
	self assert: reporteNeto equals: 0 * peso.! !

!ReporteNetoTransferenciasTest methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 21:07:29'!
test02UnaTransferenciaUnacuenta
	
	| reporteNeto |
	Transferencia transferir: 50 * peso desde: cuenta1 a: cuenta2.
	reporteNeto := (ReporteNetoTransferencias paraLaCuenta: cuenta2) calcular.
	self assert: reporteNeto equals: 50 * peso.! !

!ReporteNetoTransferenciasTest methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 21:07:42'!
test03UnaTransferenciaAmbasCuentas
	
	| reporteNetoCuenta1 reporteNetoCuenta2 |
	
	Transferencia transferir: 50 * peso desde: cuenta1 a: cuenta2.
	
	reporteNetoCuenta1 := (ReporteNetoTransferencias paraLaCuenta: cuenta1) calcular.
	reporteNetoCuenta2 := (ReporteNetoTransferencias paraLaCuenta: cuenta2) calcular.
	
	self assert: reporteNetoCuenta1 equals: -50 * peso.
	self assert: reporteNetoCuenta2 equals: 50*peso.! !

!ReporteNetoTransferenciasTest methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 21:07:53'!
test04MultiplesTransferencias
	
	| reporteNetoCuenta1 |
	
	Transferencia transferir: 50 * peso desde: cuenta1 a: cuenta2.
	Transferencia transferir: 100*peso desde: cuenta3 a: cuenta1.
	
	reporteNetoCuenta1 := (ReporteNetoTransferencias paraLaCuenta: cuenta1) calcular.
	
	self assert: reporteNetoCuenta1 equals: 50 * peso.! !

!ReporteNetoTransferenciasTest methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 21:08:05'!
test05Portfolios
	
	| reporteNetoPortfolio1 |
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta2.
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.
	
	Deposit register: 100 * peso on: cuenta1.
	Withdraw register: 50 * peso on: cuenta1.
	Transferencia transferir: 20*peso desde: cuenta1 a: cuenta2.
	Transferencia transferir: 50 * peso desde: cuenta2 a: cuenta3.
	Deposit register: 100 * peso on: cuenta2.
	
	reporteNetoPortfolio1 := (ReporteNetoTransferencias paraLaCuenta: portfolio1) calcular.
	
	self assert: reporteNetoPortfolio1 equals: -50 * peso.
	! !


!classDefinition: #ResumenTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ResumenTest
	instanceVariableNames: 'portfolio1 portfolio2 portfolio3 cuenta1 cuenta2 cuenta3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 20:45:32'!
setUp
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	cuenta3 := ReceptiveAccount new.! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test01resumenVacioDaBalance0

	| resumenCuenta1 resumenEsperado |
	
	resumenCuenta1 := (ResumenDeTransacciones paraLaCuenta: cuenta1) calcular.
	resumenEsperado := OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: resumenCuenta1 equals: resumenEsperado.! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test02muestraUnDeposito

	| resumenCuenta1 resumenEsperado |
	
	Deposit register: 100 * peso on: cuenta1.
	resumenCuenta1 := (ResumenDeTransacciones paraLaCuenta: cuenta1) calcular.
	resumenEsperado := OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	self assert: resumenCuenta1 equals: resumenEsperado.! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test03muestraExtraccion

	| resumenCuenta1 resumenEsperado |
	
	Withdraw register: 100 * peso on: cuenta1.
	resumenCuenta1 := (ResumenDeTransacciones paraLaCuenta: cuenta1) calcular.
	resumenEsperado := OrderedCollection with: 'Extracción por 100 pesos' with: 'Balance = -100 pesos'.
	
	self assert: resumenCuenta1 equals: resumenEsperado.! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test04TransferenciaSalida

	| resumenCuenta1 resumenEsperado |
	
	Transferencia transferir: 50*peso desde: cuenta1 a: cuenta2.
	resumenCuenta1 := (ResumenDeTransacciones paraLaCuenta: cuenta1) calcular.
	resumenEsperado := OrderedCollection with: 'Salida por transferencia de 50 pesos' with: 'Balance = -50 pesos'.
	
	self assert: resumenCuenta1 equals: resumenEsperado.! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test05TransferenciaDeposito

	| resumenCuenta2 resumenEsperado |
	
	Transferencia transferir: 50*peso desde: cuenta1 a: cuenta2.
	resumenCuenta2 := (ResumenDeTransacciones paraLaCuenta: cuenta2) calcular.
	resumenEsperado := OrderedCollection with: 'Entrada por transferencia de 50 pesos' with: 'Balance = 50 pesos'.
	
	self assert: resumenCuenta2 equals: resumenEsperado.! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test06MultiplesTransacciones

	| resumenCuenta1 resumenEsperado |
	Deposit register: 100 * peso on: cuenta1.
	Withdraw register: 50 * peso on: cuenta1.
	Transferencia transferir: 20*peso desde: cuenta1 a: cuenta2.
	resumenCuenta1 := (ResumenDeTransacciones paraLaCuenta: cuenta1) calcular.
	resumenEsperado := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 20 pesos' with: 'Balance = 30 pesos'.
	
	self assert: resumenCuenta1 equals: resumenEsperado.
! !

!ResumenTest methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:43:37'!
test07FuncionaEnPortfolios

	| resumenCuenta1 resumenEsperado |
	portfolio1 agregarUnaCuentaOUnPortfolio: cuenta1.
	portfolio2 agregarUnaCuentaOUnPortfolio: cuenta2.
	portfolio1 agregarUnaCuentaOUnPortfolio: portfolio2.
	Deposit register: 100 * peso on: cuenta1.
	Withdraw register: 50 * peso on: cuenta1.
	Transferencia transferir: 20*peso desde: cuenta1 a: cuenta2.
	Deposit register: 100 * peso on: cuenta2.
	resumenCuenta1 := (ResumenDeTransacciones paraLaCuenta: portfolio1) calcular.
	resumenEsperado := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 20 pesos' with: 'Entrada por transferencia de 20 pesos' with: 'Depósito por 100 pesos' with: 'Balance = 150 pesos'.
	resumenCuenta1.
	resumenEsperado.
	self assert: resumenCuenta1 equals: resumenEsperado.
! !


!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'sdz 4/30/2024 20:32:11'!
valueForBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'fv 5/8/2024 14:35:45'!
añadirAReporte: unReporte

	^unReporte añadirDeposito: self.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'sdz 4/30/2024 20:32:33'!
valueForBalance

	^ value! !

!Deposit methodsFor: 'value' stamp: 'fv 5/8/2024 14:19:57'!
valueForReport

	| valorParaResumen valorTransaccion |
	valorTransaccion := self value asString substringsSeparatedBy: $ .
	valorParaResumen :=  (valorTransaccion at: 1), ' ', (valorTransaccion at: 3).
	^valorParaResumen.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transferencia category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transferencia
	instanceVariableNames: 'value parteDeposito parteExtraccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transferencia methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:14:08'!
initializeWith: unaCantidadDeDineroEnPesos with: cuentaOrigen with: cuentaDestino

	| pataDeposito pataExtraccion |

	pataDeposito := TransferenciaDeposito registrar: unaCantidadDeDineroEnPesos a: cuentaDestino con: self.
	pataExtraccion := TransferenciaExtraccion registrar: unaCantidadDeDineroEnPesos a: cuentaOrigen con: self.
	
	
	value := unaCantidadDeDineroEnPesos .
	parteDeposito := pataDeposito.
	parteExtraccion := pataExtraccion.
	
	
	
	
	! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:57:22'!
pataDeposito
	^parteDeposito.! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:57:36'!
pataExtraccion
	^parteExtraccion! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:32:11'!
value
	^value! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:21:16'!
valueForReport

	| valorParaResumen valorTransaccion |
	valorTransaccion := self value asString substringsSeparatedBy: $ .
	valorParaResumen :=  (valorTransaccion at: 1), ' ', (valorTransaccion at: 3).
	^valorParaResumen.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transferencia class' category: #'ServiciosFinancieros-Ejercicio'!
Transferencia class
	instanceVariableNames: 'parteDeposito parteExtraccion'!

!Transferencia class methodsFor: 'as yet unclassified' stamp: 'sdz 5/3/2024 19:39:10'!
descripcionErrorNoPuedoTransferirmeAMiMismo
	^'No se puede realizar una transferencia entre la misma cuenta'! !

!Transferencia class methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:09:27'!
descripcionErrorTransferenciaNegativa

	^'No es posible realizar una trasferencia de una cantidad negativa de pesos'.! !

!Transferencia class methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:07:05'!
descripcionErrorTransferirCeroPesos

	^'No es posible hacer una transferencia de 0 pesos'.! !

!Transferencia class methodsFor: 'as yet unclassified' stamp: 'sdz 5/3/2024 19:39:53'!
transferir: unaCantidadDeDineroEnPesos desde: cuentaOrigen a: cuentaDestino

	unaCantidadDeDineroEnPesos = 0 ifTrue:[^self error: Transferencia descripcionErrorTransferirCeroPesos].
	unaCantidadDeDineroEnPesos < 0 ifTrue:[^self error: Transferencia descripcionErrorTransferenciaNegativa ].
	cuentaOrigen = cuentaDestino ifTrue: [^self error: Transferencia descripcionErrorNoPuedoTransferirmeAMiMismo ].
	
	^self new initializeWith: unaCantidadDeDineroEnPesos with:cuentaOrigen with: cuentaDestino .! !


!classDefinition: #TransferenciaDeposito category: #'ServiciosFinancieros-Ejercicio'!
Transferencia subclass: #TransferenciaDeposito
	instanceVariableNames: 'transferencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenciaDeposito methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:35:52'!
añadirAReporte: unReporte

	
	^unReporte añadirTransferenciaDeposito: self .! !

!TransferenciaDeposito methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:51:36'!
contraparte
	^transferencia pataExtraccion.! !

!TransferenciaDeposito methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:52:51'!
initializeFor: unaTransferencia

	transferencia := unaTransferencia ! !

!TransferenciaDeposito methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 14:27:38'!
value

	^transferencia value.! !

!TransferenciaDeposito methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:55:05'!
valueForBalance

	^ transferencia value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenciaDeposito class' category: #'ServiciosFinancieros-Ejercicio'!
TransferenciaDeposito class
	instanceVariableNames: ''!

!TransferenciaDeposito class methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:00:31'!
crearCon: unaTransferencia

	^ self new initializeFor: unaTransferencia. ! !

!TransferenciaDeposito class methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:00:31'!
registrar: unaCantidadDeDineroEnPesos a: cuenta con: unaTransferencia

	| transaction |
	
	transaction := self crearCon: unaTransferencia.
	cuenta register: transaction.
		
	^ transaction! !


!classDefinition: #TransferenciaExtraccion category: #'ServiciosFinancieros-Ejercicio'!
Transferencia subclass: #TransferenciaExtraccion
	instanceVariableNames: 'transferencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenciaExtraccion methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:35:57'!
añadirAReporte: unReporte

	^unReporte añadirTransferenciaExtraccion: self.! !

!TransferenciaExtraccion methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:49:30'!
contraparte
	^transferencia pataDeposito.! !

!TransferenciaExtraccion methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:52:55'!
initializeFor: unaTransferencia

	transferencia := unaTransferencia ! !

!TransferenciaExtraccion methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 14:27:45'!
value

	^transferencia value.! !

!TransferenciaExtraccion methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 14:55:11'!
valueForBalance

	^ transferencia value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenciaExtraccion class' category: #'ServiciosFinancieros-Ejercicio'!
TransferenciaExtraccion class
	instanceVariableNames: ''!

!TransferenciaExtraccion class methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:00:20'!
crearCon: unaTransferencia

	^ self new initializeFor: unaTransferencia. ! !

!TransferenciaExtraccion class methodsFor: 'as yet unclassified' stamp: 'fv 5/3/2024 15:00:20'!
registrar: unaCantidadDeDineroEnPesos a: cuenta con: unaTransferencia

	| transaction |
	
	transaction := self crearCon: unaTransferencia.
	cuenta register: transaction.
		
	^ transaction! !


!classDefinition: #Withdraw category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'fv 5/8/2024 14:36:01'!
añadirAReporte: unReporte

	^unReporte añadirExtraccion: self.! !

!Withdraw methodsFor: 'value' stamp: 'sdz 4/30/2024 20:20:22'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'sdz 4/30/2024 20:32:47'!
valueForBalance

	^ value negated.! !

!Withdraw methodsFor: 'value' stamp: 'fv 5/8/2024 14:22:04'!
valueForReport

	| valorParaResumen valorTransaccion |
	valorTransaccion := self value asString substringsSeparatedBy: $ .
	valorParaResumen :=  (valorTransaccion at: 1), ' ', (valorTransaccion at: 3).
	^valorParaResumen.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'listaDeCuentasYPortfolios portfolioPadre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 20:18:41'!
agregarUnaCuentaOUnPortfolio: unaCuenta

	(unaCuenta = self) ifTrue: [self error: Portfolio descripcionErrorPortfolioNoSePuedeAñadirASiMismo ].
	
	(self estaLaCuentaEnAlgunPadre: unaCuenta) ifTrue: [ self error: Portfolio descripcionErrorAñadirCuentaRepetida  ].
	
"	(portfolioPadre = nil) ifFalse: [(portfolioPadre laCuentaYaEstaEnElPortfolio: unaCuenta) ifTrue: [self error: Portfolio descripcionErrorAñadirCuentaRepetida ]].
	"
	(self laCuentaYaEstaEnElPortfolio: unaCuenta) ifTrue: [self error: Portfolio descripcionErrorAñadirCuentaRepetida].
	listaDeCuentasYPortfolios add: unaCuenta.
	(unaCuenta isKindOf: Portfolio) ifTrue: [unaCuenta definirPortfolioPadre: self].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'sdz 5/3/2024 18:21:33'!
balance
	^listaDeCuentasYPortfolios sum: [:unaCuenta | unaCuenta balance ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 20:18:40'!
definirPortfolioPadre: unPortfolio

	portfolioPadre := unPortfolio.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 19:43:20'!
estaLaCuentaEnAlgunPadre: unaCuenta

	(portfolioPadre = nil) ifTrue: [^self laCuentaYaEstaEnElPortfolio: unaCuenta] ifFalse: [^portfolioPadre estaLaCuentaEnAlgunPadre: unaCuenta].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'sdz 5/3/2024 19:01:45'!
hasRegistered: aTransaction

	^self transactions includes: aTransaction.
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 11:43:26'!
initialize
	listaDeCuentasYPortfolios := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 20:06:20'!
laCuentaYaEstaEnElPortfolio: unaCuenta

	| listaDeCuentasRecibida |
	listaDeCuentasRecibida := unaCuenta listaDeCuentas .
	
	(listaDeCuentasRecibida size = 0) ifTrue: [^listaDeCuentasYPortfolios includes: unaCuenta].
	
	^listaDeCuentasRecibida anySatisfy: [:cuentaRecibida | listaDeCuentasYPortfolios anySatisfy: [:cuentaLocal | cuentaLocal laCuentaYaEstaEnElPortfolio: cuentaRecibida ]] .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 10:43:00'!
listaDeCuentas
	^listaDeCuentasYPortfolios copy.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'sdz 5/3/2024 19:02:45'!
transactions 
	
	| listaDeTransacciones |
	listaDeTransacciones := OrderedCollection new.
	listaDeCuentasYPortfolios  do: [:unaCuentaOUnPortfolio | unaCuentaOUnPortfolio transactions do:[:unaTransaccion| listaDeTransacciones add: 	unaTransaccion ]].
	^listaDeTransacciones .	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'sdz 5/3/2024 19:43:49'!
descripcionErrorAñadirCuentaRepetida
	^'No se puede añadir la cuenta, ya está dentro del portfolio.'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 11:12:10'!
descripcionErrorPortfolioNoSePuedeAñadirASiMismo
	^'Un portfolio no se puede añadir a si mismo.'! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'fv 5/6/2024 10:53:39'!
laCuentaYaEstaEnElPortfolio: unaCuenta
	^self = unaCuenta.
	! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sdz 4/30/2024 20:34:24'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueForBalance ]
			       ifEmpty: [ 0 ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fv 5/6/2024 10:49:23'!
listaDeCuentas
	^OrderedCollection with: self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fv 5/6/2024 21:14:43'!
ultimaTransaccion

	transactions ifEmpty: [^''].

	^transactions last.! !


!classDefinition: #ReportesDeTransacciones category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReportesDeTransacciones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReportesDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:38:07'!
añadirDeposito: unDeposito

	^self subclassResponsibility .! !

!ReportesDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:38:39'!
añadirExtraccion: unaExtraccion

	^self subclassResponsibility .! !

!ReportesDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:38:48'!
añadirTransferenciaDeposito: unaTransferenciaDeposito

	^self subclassResponsibility .! !

!ReportesDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:38:58'!
añadirTransferenciaExtraccion: unaTransferenciaExtraccion

	^self subclassResponsibility .! !

!ReportesDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:39:06'!
calcular

	^self subclassResponsibility .! !

!ReportesDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:39:21'!
inicializarCon: unaCuenta

	^self subclassResponsibility .! !


!classDefinition: #ReporteNetoTransferencias category: #'ServiciosFinancieros-Ejercicio'!
ReportesDeTransacciones subclass: #ReporteNetoTransferencias
	instanceVariableNames: 'cuenta'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReporteNetoTransferencias methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:30:14'!
añadirDeposito: unDeposito

	^0 * peso.! !

!ReporteNetoTransferencias methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:30:17'!
añadirExtraccion: unaExtraccion

	^0 * peso.! !

!ReporteNetoTransferencias methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:30:52'!
añadirTransferenciaDeposito: unaTransferenciaDeposito

	^unaTransferenciaDeposito valueForBalance.! !

!ReporteNetoTransferencias methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:30:38'!
añadirTransferenciaExtraccion: unaTransferenciaExtraccion

	^unaTransferenciaExtraccion valueForBalance.! !

!ReporteNetoTransferencias methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:35:08'!
calcular

	| transacciones |
	transacciones := cuenta transactions.
	^transacciones sum: [:unaTransaccion | unaTransaccion añadirAReporte: self ] ifEmpty: [0 * peso].! !

!ReporteNetoTransferencias methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 20:30:08'!
inicializarCon: unaCuenta 
	cuenta := unaCuenta.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReporteNetoTransferencias class' category: #'ServiciosFinancieros-Ejercicio'!
ReporteNetoTransferencias class
	instanceVariableNames: ''!

!ReporteNetoTransferencias class methodsFor: 'as yet unclassified' stamp: 'fv 5/7/2024 20:29:54'!
paraLaCuenta: unaCuenta 
	^self basicNew inicializarCon: unaCuenta.! !


!classDefinition: #ResumenDeTransacciones category: #'ServiciosFinancieros-Ejercicio'!
ReportesDeTransacciones subclass: #ResumenDeTransacciones
	instanceVariableNames: 'cuenta resumenLineas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ResumenDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:25:34'!
añadirDeposito: unDeposito

	resumenLineas add: 'Depósito por ', unDeposito valueForReport.! !

!ResumenDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:26:25'!
añadirExtraccion: unaExtraccion

	resumenLineas add: 'Extracción por ', unaExtraccion valueForReport .! !

!ResumenDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:27:13'!
añadirTransferenciaDeposito: unaTransferenciaDeposito

	resumenLineas add: 'Entrada por transferencia de ', unaTransferenciaDeposito valueForReport.! !

!ResumenDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:27:33'!
añadirTransferenciaExtraccion: unaTransferenciaExtraccion

	resumenLineas add: 'Salida por transferencia de ', unaTransferenciaExtraccion valueForReport.! !

!ResumenDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/8/2024 14:17:27'!
calcular

	| balance balanceParaResumen transacciones |
	
	transacciones := cuenta transactions.
	
	(transacciones isEmpty) ifTrue: [^OrderedCollection with: 'Balance = 0 pesos'].
	
	transacciones do: [:unaTransaccion | unaTransaccion añadirAReporte: self.].
	
	balance := cuenta balance asString substringsSeparatedBy: $ .
	balanceParaResumen := (balance at: 1), ' ', (balance at: 3).
	resumenLineas add: 'Balance = ', balanceParaResumen.
	^resumenLineas.! !

!ResumenDeTransacciones methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 21:12:59'!
inicializarCon: unaCuenta
	cuenta := unaCuenta.
	resumenLineas := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ResumenDeTransacciones class' category: #'ServiciosFinancieros-Ejercicio'!
ResumenDeTransacciones class
	instanceVariableNames: ''!

!ResumenDeTransacciones class methodsFor: 'as yet unclassified' stamp: 'fv 5/6/2024 20:37:53'!
paraLaCuenta: cuenta1 
	^self basicNew inicializarCon: cuenta1.! !
