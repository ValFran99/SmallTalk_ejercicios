!classDefinition: #NumeroTest category: #'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: #'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 10:43:34'!
* aMultiplier 
	^aMultiplier multiplicarPorUnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 10:40:33'!
+ anAdder
	^anAdder sumarUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 11:02:59'!
- aSubtrahend 
	^aSubtrahend restarUnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 10:52:38'!
/ aDivisor 
	^aDivisor dividirsePorUnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sdz 4/16/2024 18:44:42'!
fibonacci
	self subclassResponsibility .! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:50:04'!
dividirsePorUnEntero: unEntero
	^Fraccion with: unEntero over: self.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:59:11'!
dividirsePorUnaFraccion: unaFraccion
	^unaFraccion numerator / (unaFraccion denominator * self) .! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:41:56'!
multiplicarPorUnEntero: unEntero
	^self class with: value * unEntero integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:47:22'!
multiplicarPorUnaFraccion: unaFraccion
	^ self * unaFraccion numerator / unaFraccion denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 11:01:46'!
restarUnEntero: unEntero
	^ self class with: unEntero integerValue - value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 11:11:13'!
restarUnaFraccion: unaFraccion
	^(unaFraccion numerator - (self * unaFraccion denominator )) / unaFraccion denominator .! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:38:44'!
sumarUnEntero: unEntero
	^self class with: value + unEntero integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:33:13'!
sumarUnaFraccion: unaFraccion
	^(self * unaFraccion denominator + unaFraccion numerator) / unaFraccion denominator .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'sdz 4/16/2024 19:37:24'!
with: aValue 

	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan
	"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	^(Entero subclasses detect: [:unaClase | unaClase esPara: aValue ] ) new initializeWith: aValue .! !


!classDefinition: #Cero category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'arithmetic operations' stamp: 'sdz 4/16/2024 19:18:31'!
fibonacci
	^Entero  with: 1.! !


!Cero methodsFor: 'initialization' stamp: 'sdd 4/18/2024 11:42:56'!
encontrarFraccionCon: unNumerador

    ^self error: self class canNotDivideByZeroErrorDescription! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:41:55'!
dividirPorDenominadorUno: unDenominador
    ^self
! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:39:52'!
dividirPorUnDenominadorNegativo: unDenominador
    ^self
! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:42:07'!
dividirPorUnDenominadorPositivo: unDenominador
    ^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'sdd 4/18/2024 11:34:42'!
esPara: unValor
	^(unValor =0)! !


!classDefinition: #Negativo category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:43:22'!
dividirPorDenominadorUno: unDenominador
	^ Fraccion crearFraccionConUno: unDenominador
! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:45:36'!
dividirPorUnDenominadorNegativo: unDenominador
	
	^Fraccion crearFraccionNegativaConNumerador: self yDenominador: unDenominador .

! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:46:31'!
dividirPorUnDenominadorPositivo: unDenominador
	^ Fraccion crearFraccionPositivaConNumerador: self yDenominador: unDenominador 

! !


!Negativo methodsFor: 'initialization' stamp: 'sdd 4/18/2024 11:44:07'!
encontrarFraccionCon: unNumerador
    ^unNumerador dividirPorUnDenominadorNegativo: self! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'sdz 4/16/2024 18:37:21'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription.	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: #'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'instance creation' stamp: 'sdd 4/18/2024 11:34:02'!
esPara: unValor
	^(unValor <0)! !


!classDefinition: #Positivo category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Positivo methodsFor: 'initialization' stamp: 'sdd 4/18/2024 11:48:01'!
encontrarFraccionCon: unNumerador
    ^unNumerador dividirPorUnDenominadorPositivo: self! !


!Positivo methodsFor: 'arithmetic operations' stamp: 'sdz 4/16/2024 19:12:59'!
fibonacci
	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	^ (self - one) fibonacci + (self - two) fibonacci! !


!Positivo methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:44:43'!
dividirPorDenominadorUno: unDenominador

	^self.! !

!Positivo methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:45:36'!
dividirPorUnDenominadorNegativo: unDenominador

	^Fraccion crearFraccionNegativaConNumerador: self yDenominador: unDenominador .! !

!Positivo methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:47:44'!
dividirPorUnDenominadorPositivo: unDenominador

	^Fraccion crearFraccionPositivaConNumerador: self yDenominador: unDenominador .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Positivo class' category: #'Numeros-Parte2-Ejercicio'!
Positivo class
	instanceVariableNames: ''!

!Positivo class methodsFor: 'instance creation' stamp: 'sdd 4/18/2024 11:33:47'!
esPara: unValor
	^(unValor >1).! !


!classDefinition: #Uno category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'initialization' stamp: 'sdd 4/18/2024 11:50:12'!
encontrarFraccionCon: unNumerador
    ^unNumerador dividirPorDenominadorUno: self.! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:48:27'!
dividirPorDenominadorUno: unDenominador

	^unDenominador.! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:49:46'!
dividirPorUnDenominadorNegativo: unDenominador

	^Fraccion crearFraccionNegativaConNumerador: self yDenominador: unDenominador .! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/18/2024 11:50:01'!
dividirPorUnDenominadorPositivo: unDenominador

	^Fraccion crearFraccionPositivaConNumerador: self yDenominador: unDenominador.! !


!Uno methodsFor: 'arithmetic operations' stamp: 'sdz 4/16/2024 19:16:55'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'sdd 4/18/2024 11:33:27'!
esPara: unValor
	^(unValor=1).! !


!classDefinition: #Fraccion category: #'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 10:47:44'!
* aMultiplier 
	^aMultiplier multiplicarPorUnaFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 10:36:04'!
+ anAdder 
	^anAdder sumarUnaFraccion: self .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 11:08:32'!
- aSubtrahend 
	^aSubtrahend restarUnaFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sdd 4/15/2024 10:57:55'!
/ aDivisor 
	^aDivisor dividirsePorUnaFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:52:06'!
dividirsePorUnEntero: unEntero
	^self class with: unEntero* denominator over: numerator
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:55:22'!
dividirsePorUnaFraccion: unaFraccion
	^(unaFraccion numerator * denominator) / (unaFraccion denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:43:15'!
multiplicarPorUnEntero: unEntero
	^self class with: numerator *unEntero over: denominator 
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:44:54'!
multiplicarPorUnaFraccion: unaFraccion
	^(numerator * unaFraccion numerator) / (denominator * unaFraccion denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 11:02:47'!
restarUnEntero: unEntero
	^(unEntero * denominator - numerator) /  denominator .! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 11:06:04'!
restarUnaFraccion: unaFraccion
	| newNumerator newDenominator |
	
	newNumerator := (unaFraccion numerator * denominator) - (unaFraccion denominator * numerator).
	newDenominator := unaFraccion denominator * denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:40:19'!
sumarUnEntero: unEntero
	^(unEntero * denominator + numerator) /  denominator .
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'sdd 4/15/2024 10:36:47'!
sumarUnaFraccion: unaFraccion
	^((self numerator * unaFraccion denominator) + (unaFraccion numerator * self denominator)) / (self denominator * unaFraccion denominator).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'fv 4/17/2024 14:44:29'!
crearFraccionConUno: aNumerator

	^aNumerator. 

	! !

!Fraccion class methodsFor: 'intance creation' stamp: 'sdd 4/18/2024 11:46:14'!
crearFraccionNegativaConNumerador: unNumerador yDenominador: unDenominador

	^self new initializeWith: unNumerador negated over: unDenominador negated 

	! !

!Fraccion class methodsFor: 'intance creation' stamp: 'sdd 4/18/2024 11:46:58'!
crearFraccionPositivaConNumerador: unNumerador yDenominador: unDenominador

	^self new initializeWith: unNumerador  over: unDenominador. 

	! !

!Fraccion class methodsFor: 'intance creation' stamp: 'fv 4/17/2024 14:11:33'!
with: aDividend over: aDivisor


	 | greatestCommonDivisor numerator denominator |
    	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
    	numerator := aDividend // greatestCommonDivisor.
    	denominator := aDivisor // greatestCommonDivisor.
    	^denominator encontrarFraccionCon: numerator.! !
