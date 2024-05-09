!classDefinition: #MarsRoverTests category: #MarsRover!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRover norte sur este oeste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'setUp' stamp: 'fv 4/29/2024 19:26:42'!
setUp
	
	sur := (0@-1).
	norte:=(0@1).
	oeste := (-1@0).
	este := (1@0).
	marsRover := MarsRover crearEnLaPosicion: (0@0) apuntandoAl: norte.! !


!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test01_marsRoverNoHaceNadaAlRecibirUnaListaDeComandosVacia
	marsRover ejecutarComandos: ''.
	self assert: (marsRover estaEnLaPosicion:  (0@0)).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:27'!
test02_marsRoverAvanzaCorrectamente
	marsRover ejecutarComandos: 'f'.
	self assert: (marsRover estaEnLaPosicion: (0@1)).
	! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test03_marsRoverRetrocedeCorrectamente
	marsRover ejecutarComandos: 'b'.
	self assert: (marsRover estaEnLaPosicion: (0@-1)).
	! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:27'!
test04_marsRoverPuedeRotarALaIzquierda
	marsRover ejecutarComandos: 'l'.
	self assert: (marsRover estaApuntandoAl: oeste).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test05_marsRoverPuedeRotarALaDerecha
	marsRover ejecutarComandos: 'r'.
	self assert: (marsRover estaApuntandoAl: este).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:27'!
test06_marsRoverPuedeAvanzarVariasVeces
	marsRover ejecutarComandos: 'ff'.
	self assert: (marsRover  estaEnLaPosicion: 0@2).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test07_marsRoverPuedeRetrocederVariasVeces
	marsRover ejecutarComandos: 'bb'.
	self assert: (marsRover  estaEnLaPosicion: 0@-2).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test08_alRotarYAvanzarElMarsRoverAvanzaCorrectamente
	marsRover ejecutarComandos: 'lf'.
	self assert: (marsRover  estaEnLaPosicion: -1@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test09_alRotarYRetrocederElMarsRoverRetrocedeCorrectamente
	marsRover ejecutarComandos: 'lb'.
	self assert: (marsRover  estaEnLaPosicion: (1@0)).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test10_alRotarDosVecesALaIzquierdaApuntaCorrectamenteAlSur
	marsRover ejecutarComandos: 'll'.
	self assert: (marsRover  estaApuntandoAl: sur).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test11_alRotarDosVecesALaDerechaElMarsRoverApuntaCorrectamenteAlSur
	marsRover ejecutarComandos: 'rr'.
	self assert: (marsRover  estaApuntandoAl: sur).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'fv 4/30/2024 15:39:28'!
test12_alRecibirUnComandoDesconocidoNoProcesaMasComandos
	
	self  should: [marsRover ejecutarComandos: 'lffxf'.] 
		raise:  Error
		withExceptionDo: [:unError | self assert: (MarsRover descripcionDeErrorComandoDesconocido: $x) equals: unError messageText].
	
	self assert: (marsRover  estaApuntandoAl: oeste).
	self assert: (marsRover estaEnLaPosicion: (-2@0))! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'ubicacion direccion direccionesAlRotarALaIzquierda comandos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'testing' stamp: 'fv 4/28/2024 19:47:22'!
estaApuntandoAl: unaDireccion 
	^unaDireccion = direccion.! !

!MarsRover methodsFor: 'testing' stamp: 'fv 4/30/2024 15:36:29'!
estaEnLaPosicion: unPuntoDelPlano 
	^ubicacion = unPuntoDelPlano .! !


!MarsRover methodsFor: 'inicializacion' stamp: 'fv 4/29/2024 20:02:37'!
inicializarEnLaPosicion: unaPosicion apuntandoAl: unPuntoCardinal 
	
	
	ubicacion := unaPosicion .
	direccion := unPuntoCardinal .
	
	comandos := Dictionary new.
	direccionesAlRotarALaIzquierda := Dictionary new.
	
	comandos at: $f put: #avanzar;
			at: $b put: #retroceder;
			at: $l put: #rotarALaIzquierda;
			at: $r put: #rotarALaDerecha.

	direccionesAlRotarALaIzquierda at: (0@1) put: (-1@0);
					at: (0@-1) put: (1@0);
					at: (-1@0) put: (0@-1);
					at: (1@0) put: (0@1).	! !


!MarsRover methodsFor: 'procesamiento - public' stamp: 'fv 4/30/2024 15:39:27'!
ejecutarComandos: unaCadenaDeComandos 

	unaCadenaDeComandos do: [:unComando | self procesarComando: unComando].
	! !


!MarsRover methodsFor: 'movimiento - private' stamp: 'fv 4/29/2024 19:56:13'!
avanzar
	ubicacion := ubicacion + direccion! !

!MarsRover methodsFor: 'movimiento - private' stamp: 'fv 4/29/2024 19:56:24'!
retroceder
	ubicacion := ubicacion - direccion! !

!MarsRover methodsFor: 'movimiento - private' stamp: 'fv 4/29/2024 19:57:16'!
rotarALaDerecha
	direccion := (direccionesAlRotarALaIzquierda at: direccion) * -1.	! !

!MarsRover methodsFor: 'movimiento - private' stamp: 'fv 4/29/2024 19:57:00'!
rotarALaIzquierda
	direccion := direccionesAlRotarALaIzquierda at: direccion.	! !


!MarsRover methodsFor: 'procesamiento - private' stamp: 'fv 4/30/2024 15:40:01'!
procesarComando: unComando

	(comandos at: unComando ifAbsent: [self error:  (MarsRover descripcionDeErrorComandoDesconocido: unComando )]) sendTo: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'fv 4/29/2024 19:28:32'!
crearEnLaPosicion: unaPosicion apuntandoAl: unPuntoCardinal 
	^self basicNew inicializarEnLaPosicion: unaPosicion apuntandoAl: unPuntoCardinal.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'fv 4/30/2024 15:36:54'!
descripcionDeErrorComandoDesconocido: unCaracterDesconocido
	^'el caracter ' , unCaracterDesconocido asString , ' no es un comando válido'.! !
