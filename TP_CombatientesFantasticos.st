!classDefinition: #CombateTest category: #TP_CombatientesFantasticos!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 12:15:16'!
test01_hayUnGanadorEnUnCombate

	| bando1 bando2 ganador combate |

	bando1 := Bando crearConGuerreros: {Humano new. Humano new}.
	bando2 := Bando crearConGuerreros: {Humano new}.
	combate := Combate crearCon: bando1 y: bando2.
	
	combate desarrollar.
	ganador :=  combate ganador.
	
	self assert: ganador = bando1.! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 12:15:32'!
test02_puedeGanarElBando2

	| bando1 bando2 ganador combate |

	bando1 := Bando crearConGuerreros: {Humano new}.
	bando2 := Bando crearConGuerreros: {Humano new. Humano new}.
	combate := Combate crearCon: bando1 y: bando2.

	self assert: combate cantidadDeRondas = 0.

	combate desarrollar.
	ganador :=  combate ganador.

	self assert: ganador = bando2.! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 12:25:34'!
test03_AmbosBandosNoEstanSanosDespuesDeUnCombate

	| bando1 bando2 combate goliat isac|

	goliat := Humano new.
	isac := Humano new.
	bando1 := Bando crearConGuerreros: {goliat. Humano new}.
	bando2 := Bando crearConGuerreros: {isac}.
	combate := Combate crearCon: bando1 y: bando2.

	combate desarrollar.

	self deny: isac estaSano.
	self deny: goliat estaSano.! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 15:06:13'!
test04_ElCombateTerminaLuegoDeUnaRonda

	| humano1 humano2 bando1 bando2 combate|

	humano1 := Humano new.
	humano2 := Humano new.
	bando1 := Bando crearConGuerreros: {Humano new. Humano new.}.
	bando2 := Bando crearConGuerreros: {humano1. humano2.}.
	combate := Combate crearCon: bando1 y: bando2.

	humano1 recibirDaño: 17.
	humano2 recibirDaño: 18.
	humano1 enfocarseEnElMasSano.
	humano2 enfocarseEnElMasSano.
	combate desarrollar.

	self assert: (combate cantidadDeRondas = 1)! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 15:11:21'!
test05_ElCombatePuedeDurarVariasRondas

	| david isac bando1 bando2 combate|

	david := Humano new.
	isac := Humano new.
	bando1 := Bando crearConGuerreros: {david.}.
	bando2 := Bando crearConGuerreros: {isac}.
	combate:= Combate crearCon: bando1 y: bando2.

	combate desarrollar.

	self assert: (bando1 hayAlgunoVivo = true).
	self assert: (bando2 hayAlgunoVivo = false).
	self assert: (combate ganador = bando1).
	self assert: (combate cantidadDeRondas = 5)! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 15:11:38'!
test06_TengoUnaMedidaDeCuanBienGanoUnBando

	| humano1 humano2 humano3 bando1 bando2 combate|

	humano1 := Humano new.
	humano2 := Humano new.
	humano3 := Humano new.
	bando1 := Bando crearConGuerreros: {humano1. humano3.}.
	bando2 := Bando crearConGuerreros: {humano2.}.
	combate := Combate crearCon: bando1 y: bando2.

	combate desarrollar.

	self assert: (combate queTanBienGano = 80).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 15:13:39'!
test07_ValidacionFloat

	| humano1 humano2 humano3 bando1 bando2 combate|

	humano1 := Humano new.
	humano2 := Humano new.
	humano3 := Humano new.
	bando1 := Bando crearConGuerreros: {humano2.}.
	bando2 := Bando crearConGuerreros: {humano1. humano3.}.
	combate := Combate crearCon: bando1 y: bando2.
	
	humano1 recibirDaño: 19.
	combate desarrollar.

	self assert: (combate queTanBienGano = 22.5).
	"vida humano1 = 1; vida humano3= 8 -> (1/20 +8/20)*100/(cantidad_combatientes)=22.5"! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/4/2024 23:40:11'!
test08_DesarrollarUnaRondaNoSeteaUnGanadorPorqueSi

	| bando1 bando2 combate|
	
	bando1 := Bando crearConGuerreros: {Humano new. Humano new. Humano new. Ogro new. Ogro new. }.
	bando2 := Bando crearConGuerreros: {Ogro new. Hostigador new. Mago new. Mago new. Mago new.}.
	combate := Combate crearCon: bando1 y: bando2.
	
	combate desarrollarUnaRonda.
	
	self deny: combate ganador = bando1.
	self deny: combate ganador = bando2.

	! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'fv 4/4/2024 23:40:43'!
test09_CombateMasComplejo

	| bando1 bando2 combate|

	bando1 := Bando crearConGuerreros: {Humano new. Humano new. Humano new. Ogro new. Ogro new. }.
	bando2 := Bando crearConGuerreros: {Ogro new. Hostigador new. Mago new. Mago new. Mago new.}.
	combate := Combate crearCon: bando1 y: bando2.

	combate desarrollarUnaRonda.
	self assert: (bando1 obtenerListaDeVidas) = (OrderedCollection withAll: {14. 14. 14. 26. 30}).
	combate desarrollarUnaRonda.
	combate desarrollarUnaRonda.
	combate desarrollarUnaRonda.
	self assert: (bando1 obtenerListaDeVidas) = (OrderedCollection withAll: {0. 0. 0. 2. 2.}).
	self assert: (bando2 obtenerListaDeVidas) = (OrderedCollection withAll: {0. 4. 0. 4. 4}).
	combate desarrollarUnaRonda.
	self assert: (combate ganador = bando2).
	self assert: (combate cantidadDeRondas =5).
	self assert: (combate queTanBienGano =4)
"
                    H1 H2 H3 O1 O2     vs    O1 Hostig1   M1 M2 M3
round1         14 14 14  26  30            20     12        20  20  20
round2         4    8   8   20  16            12     12        8    16   16
round3         0   2    2   6     6             12       8        8     4    4
round4         0   0    0   2     2             0        4         0     4    4
round5         0   0    0   0     0             0        0         0     0    4

para verificar los resultados se utilizo 'combate desarollarUnaRonda'
y luego combate obtenerListaDeVidas
"
	! !


!classDefinition: #HostigadorTest category: #TP_CombatientesFantasticos!
TestCase subclass: #HostigadorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!HostigadorTest methodsFor: 'tests-estrategia' stamp: 'SDD 4/1/2024 23:15:04'!
test05_EstrategiaDeHostigadorCorrecta

	|ogro mago hostigador|
	hostigador := Hostigador new.
	mago := Mago new.
	ogro := Ogro new.

	hostigador asignarEnemigos: {ogro. mago}.
	hostigador atacar .
	self assert: (mago estaSano =true).
	self assert: (ogro estaSano = false).
	hostigador atacar .
	self assert: (mago estaSano =false).
	self assert: (ogro estaSano= false).! !

!HostigadorTest methodsFor: 'tests-estrategia' stamp: 'SDD 4/1/2024 23:15:14'!
test06_HaceDañoCorrecto

	|ogro mago hostigador|
	hostigador := Hostigador new.
	mago := Mago new.
	ogro := Ogro new.

	hostigador asignarEnemigos: {ogro. mago}.
	hostigador atacar .
	self assert: (mago estaSano =true).
	self assert: (ogro estaDañadoPor: 4).
	hostigador atacar .
	self assert: (mago estaDañadoPor: 4).
	hostigador atacar .
	self assert: (ogro estaDañadoPor: 8).
	hostigador atacar .
	self assert: (mago estaDañadoPor: 8).
	self assert: (ogro estaDañadoPor: 8).! !

!HostigadorTest methodsFor: 'tests-estrategia' stamp: 'SDD 4/2/2024 00:23:59'!
test07_AtacaAUnCombatienteVivoAntesQueUnMuerto

	|ogro mago hostigador|
	hostigador := Hostigador new.
	mago := Mago new.
	ogro := Ogro new.
	hostigador atacar.
	mago recibirDaño: 20.
	hostigador asignarEnemigos: {mago. ogro.}.
	hostigador atacar.
	self assert: (ogro estaDañadoPor: 4).! !


!HostigadorTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 19:16:34'!
test01_HostigadorAtacaCorrectamente

	|hostigador1 hostigador2 |
	
	hostigador1 := Hostigador new.
	hostigador2 := Hostigador new.
	
	hostigador1 asignarEnemigos: {hostigador2}.
	hostigador1 atacar.
	
	self deny: hostigador2 estaSano.
	self assert: (hostigador2 estaDañadoPor: 4).! !

!HostigadorTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 19:12:22'!
test02_HostigadorNoAtacaAlMorir

	|hostigador1 hostigador2|
	
	hostigador1 := Hostigador new.
	hostigador2:= Hostigador new.
	
	hostigador1 recibirDaño: 20.
	hostigador1 asignarEnemigos: {hostigador2.}.
	hostigador1 atacar.
	
	self assert: (hostigador2 estaSano).! !

!HostigadorTest methodsFor: 'tests-combatir' stamp: 'SDD 4/1/2024 23:14:14'!
test03_HostigadorSabeRecibirDaño

	| hostigador |
	
	hostigador := Hostigador new.	
	hostigador recibirDaño: 12.
	
	self assert: (hostigador obtenerVida =8).! !

!HostigadorTest methodsFor: 'tests-combatir' stamp: 'SDD 4/1/2024 23:14:24'!
test04_HostigadorTiene0VidaAlMorir

	| hostigador |
	
	hostigador := Hostigador new.	
	hostigador recibirDaño: 25.
	
	self assert: (hostigador obtenerVida =0).! !


!classDefinition: #HumanoTest category: #TP_CombatientesFantasticos!
TestCase subclass: #HumanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:18:50'!
test01_GoliatEmpiezaSano

	| goliat |
	
	goliat := Humano new.
	
	self assert: goliat estaSano.! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:00'!
test02_GoliatNoEstaSanoSiRecibeDaño

	| goliat |

	goliat := Humano new.
	goliat recibirDaño: 2.
	
	self deny: goliat estaSano.! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:06'!
test03_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |

	goliat := Humano new.
	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:10'!
test04_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |

	goliat := Humano new.
	goliat recibirDaño: 4.
	
	self deny: (goliat estaDañadoPor: 8).! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:13'!
test05_GoliatPuedeRecibirDañoMultiplesVeces

	| goliat |
	
	goliat := Humano new.
	goliat recibirDaño: 4.
	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 8).! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:17'!
test06_DavidPuedeAtacarAAlguien

	| david goliat |

	david := Humano new.
	goliat := Humano new.
	david atacarA: goliat.

	self assert: (goliat estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:25'!
test07_DavidPuedeAtacarEnemigosAsignados

	| david goliat |
	
	david := Humano new.
	goliat := Humano new.
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:30'!
test08_DavidNoAtacaAUnEnemigoNoAsignado

	| david goliat isac |
	
	david := Humano new.
	goliat := Humano new.
	isac := Humano new.
	
	david asignarEnemigos: {goliat.}.
	
	david atacar.
	
	self assert: isac estaSano.
	! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:19:35'!
test09_GoliatNoPuedeAtacarAlMorir

	| david goliat |
	
	david := Humano new.
	goliat := Humano new.
	
	david atacarA: goliat.
	david atacarA: goliat.
	david atacarA: goliat.	
	david atacarA: goliat.	
	david atacarA: goliat.	
	goliat atacarA: david.
	
	self assert: david estaSano.! !


!HumanoTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:20:08'!
test10_PuedoDefinirleUnaEstrategiaADavid

	| goliat david |
	
	goliat := Humano new.
	david := Humano new.

	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:20:03'!
test11_EnfocarseEnElMasSanoAtacaAlMenosDañado

	| david goliat isaac |
	
	david := Humano new.
	goliat := Humano new.
	isaac := Humano new.
	
	goliat recibirDaño: 2.
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:19:57'!
test12_EnfocarseEnElMasSanoAtacaAlMenosDañadoNoImportaElOrden

	| david goliat isaac |
	
	david := Humano new.
	goliat := Humano new.	
	isaac := Humano new.
	
	goliat recibirDaño: 2.
	david enfocarseEnElMasSano.
	david asignarEnemigos: {isaac. goliat.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'SDD 4/2/2024 00:47:08'!
test13_EnfocarseEnElMasHeridoAtacaAlMasDañado

	| david goliat isaac |

	david := Humano new.
	goliat := Humano new.
	isaac := Humano new.
	
	goliat recibirDaño: 2.
	david enfocarseEnElMasHerido.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	self assert: (goliat estaDañadoPor: 6).! !


!classDefinition: #MagoTest category: #TP_CombatientesFantasticos!
TestCase subclass: #MagoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!MagoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 12:08:10'!
test01_SabeMorir

	| mago ogro |
	
	ogro := Ogro new.
	mago := Mago new.
	ogro atacarA: mago.
	ogro atacarA: mago.
	
	self assert: mago estaVivo = true.
	
	ogro atacarA: mago.
	
	self assert: mago estaVivo = false.
! !

!MagoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:22:23'!
test02_MagoHace2DeDaño

	| mago ogro |
	
	ogro := Ogro new.
	mago := Mago new.
	
	mago asignarEnemigos: {ogro}.
	mago atacar.
	
	self assert: (ogro estaDañadoPor: 2).! !

!MagoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:23:05'!
test03_SabeRecibirDaño

	| mago |

	mago := Mago new.
	mago recibirDaño: 12.
	
	self assert: (mago estaDañadoPor: 12).! !

!MagoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 12:08:51'!
test04_TieneVidaCorrecta

	| mago |

	mago := Mago new.
	self assert: mago obtenerVida =20.! !

!MagoTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 12:09:07'!
test05_NoAtacaSiEstaMuerto

	| mago ogro |
	
	ogro := Ogro new.
	mago := Mago new.
	ogro atacarA: mago.
	ogro atacarA: mago.
	
	self assert: mago estaVivo = true.
	
	ogro atacarA: mago.
	
	self assert: mago estaVivo = false.
	
	mago asignarEnemigos: {ogro}.
	mago atacar .
	
	self assert: ogro estaSano =true.! !


!MagoTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 12:11:26'!
test06_AtacaConEstrategiaAdecuada

	| mago magoQueAtaca ogro1 ogro2 ogro3 ogro4 ogro5 ogro6 |
	
	mago := Mago new.
	magoQueAtaca := Mago new.
	ogro1 := Ogro new.
	ogro2 := Ogro new.
	ogro3 := Ogro new.
	ogro4:= Ogro new.
	ogro5 := Ogro new.
	ogro6 := Ogro new.
	
	magoQueAtaca asignarEnemigos: {mago. ogro1. ogro2. ogro3. ogro4. ogro5. ogro6.}.
	magoQueAtaca atacar.
	
	self assert: (mago estaSano). ! !

!MagoTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:35:02'!
test07_DañaCorrectamenteALosEnemigosAsignados

	| magoQueAtaca mago isaac |

	magoQueAtaca := Mago new.
	mago := Mago new.
	isaac := Humano new.
	
	mago recibirDaño: 2.
	magoQueAtaca asignarEnemigos: {mago. isaac.}.
	magoQueAtaca atacar.
	
	self assert: (isaac estaDañadoPor: 2).
	self assert: (mago estaDañadoPor: 4)! !

!MagoTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 12:12:24'!
test08_SabeAtacarA6Enemigos

	| magoQueAtaca humano1 humano2 humano3 humano4 humano5 ogro |

	humano1 := Humano new.
	humano2 := Humano new.
	humano3 := Humano new.
	ogro := Ogro new.
	humano4:= Humano new.
	humano5:= Humano new.
	magoQueAtaca := Mago new.

	magoQueAtaca asignarEnemigos: {humano1. humano2. humano3. humano4. humano5. ogro.}.
	magoQueAtaca atacar.

	self assert:  (ogro estaDañadoPor: 2).
	self assert: (humano1 estaDañadoPor: 2).
	self assert: (humano2 estaDañadoPor: 2).
	self assert: (humano3 estaDañadoPor: 2).
	self assert: (humano4 estaDañadoPor: 2).
	self assert: (humano5 estaDañadoPor: 2).! !


!classDefinition: #OgroTest category: #TP_CombatientesFantasticos!
TestCase subclass: #OgroTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!OgroTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:21:02'!
test07_SabeEnfocarseEnMasHerido

	|ogro1 mago|

	mago := Mago new.
	ogro1 := Ogro new.

	ogro1 asignarEnemigos: {Ogro new. Ogro new. mago}.
	ogro1 enfocarseEnElMasHerido.
	ogro1 atacar.
	
	self assert: (mago estaDañadoPor: 8).! !

!OgroTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:21:06'!
test08_SabeEnfocarseEnMasSano

	|ogro1 ogro2|

	ogro2 := Ogro new.
	ogro1 := Ogro new.

	ogro1 asignarEnemigos: {Mago new. Mago new. ogro2}.
	ogro1 enfocarseEnElMasSano.
	ogro1 atacar.
	
	self assert: (ogro2 estaDañadoPor: 8).! !

!OgroTest methodsFor: 'tests-estrategia' stamp: 'fv 4/1/2024 15:52:49'!
test09_OgroEstaMasSanoQueUnHumanoConVidaCompleta

	| ogro humano ogroAtacante|
	
	ogro := Ogro new.
	humano := Humano new.
	ogroAtacante := Ogro new.
	ogro recibirDaño: 19.
	
	ogroAtacante asignarEnemigos: {humano. ogro}.
	ogroAtacante atacar.
	
	self assert: (ogro estaDañadoPor: 27).
	self assert: humano estaSano.
	
	! !


!OgroTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:20:34'!
test01_OgroAtacaBien

	|ogro1 ogro2 |
	
	ogro1 := Ogro new.
	ogro2 := Ogro new.
	
	ogro1 asignarEnemigos: {ogro2}.
	ogro1 atacar.
	
	self deny: ogro2 estaSano.
	self assert: (ogro2 estaDañadoPor: 8).! !

!OgroTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:20:38'!
test02_OgroNoAtacaAlMorir

	|ogro1 ogro2|
	
	ogro1 := Ogro new.
	ogro2:= Ogro new.
	
	ogro1 recibirDaño: 42.
	ogro1 asignarEnemigos: {ogro2.}.
	ogro1 atacar.
	
	self assert: (ogro2 estaSano).! !

!OgroTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:20:43'!
test03_VerificarVidaOgro

	|ogro1 ogro2 |
	
	ogro1 := Ogro new.	
	ogro2 := Ogro new.
	
 	self assert: (ogro1 obtenerVida =40).		
	self assert: (ogro1 obtenerVidaMaxima =40).		
	self assert: (ogro2 obtenerVida =40).		
	self assert: (ogro2 obtenerVidaMaxima =40).		! !

!OgroTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:20:47'!
test04_VerificarVidaOgroCuandoMuere

	|ogro1|
	
	ogro1 := Ogro new.	
	ogro1 recibirDaño: 42.
	
	self assert: (ogro1 obtenerVida =0).! !

!OgroTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:20:51'!
test05_OgroNoAtacaAlMorir

	|ogro1 ogro2|
	
	ogro1 := Ogro new.
	ogro2:= Ogro new.
	ogro1 recibirDaño: 42.
	ogro1 asignarEnemigos: {ogro2.}.
	ogro1 atacar.
	
	self assert: (ogro2 estaSano).! !

!OgroTest methodsFor: 'tests-combatir' stamp: 'fv 4/1/2024 15:20:55'!
test06_SabeMorir

	|ogro1 ogro2|
	
	ogro2 := Ogro new.
	ogro1 := Ogro new.

	ogro1 asignarEnemigos: {ogro2}.	
	ogro1 atacar.
	ogro1 atacar.
	ogro1 atacar.
	ogro1 atacar.
	ogro1 atacar.
	
	self assert: (ogro2 estaVivo =false).! !


!classDefinition: #Bando category: #TP_CombatientesFantasticos!
Object subclass: #Bando
	instanceVariableNames: 'participantes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!Bando methodsFor: 'private' stamp: 'sdd 4/4/2024 11:05:42'!
atacarABando: unBando

  	self obtenerGuerrerosVivos do: [:unCombatiente | unCombatiente asignarEnemigos: unBando obtenerGuerrerosVivos. unCombatiente atacar].! !

!Bando methodsFor: 'private' stamp: 'fv 4/4/2024 23:30:05'!
hayAlgunoVivo

	| algunoVivo |
	algunoVivo := false.
	participantes do: [:participante | (participante estaVivo) ifTrue: [^true].].
	^ algunoVivo.
! !

!Bando methodsFor: 'private' stamp: 'fv 4/1/2024 11:55:06'!
inicializarBando: variosGuerreros

	participantes := variosGuerreros. ! !

!Bando methodsFor: 'private' stamp: 'fv 4/1/2024 11:56:16'!
obtenerGuerrerosVivos

    | lista |

    lista := OrderedCollection new.
    participantes do: [:participante | (participante estaVivo) ifTrue: [lista add: participante].].
    ^lista! !

!Bando methodsFor: 'private' stamp: 'sdd 4/2/2024 17:10:15'!
obtenerListaDeVidas

    | lista |

    lista := OrderedCollection new.
    participantes do: [:participante | lista add: participante obtenerVida ].
    ^lista! !

!Bando methodsFor: 'private' stamp: 'fv 4/5/2024 14:27:48'!
obtenerPromedioDeVidas

	|indice|
	indice := participantes average: [ :participante | (participante obtenerVida / participante obtenerVidaMaxima) ].
	^indice*100.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bando class' category: #TP_CombatientesFantasticos!
Bando class
	instanceVariableNames: ''!

!Bando class methodsFor: 'as yet unclassified' stamp: 'fv 4/1/2024 12:14:39'!
crearConGuerreros: unConjuntoDeGuerreros

	^self basicNew inicializarBando: unConjuntoDeGuerreros.! !


!classDefinition: #Combate category: #TP_CombatientesFantasticos!
Object subclass: #Combate
	instanceVariableNames: 'bando1ro bando2do cantidadDeRondas ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!Combate methodsFor: 'private' stamp: 'fv 4/5/2024 14:23:28'!
inicializarCon: bando1 yCon: bando2 

	cantidadDeRondas :=0.
	bando1ro := bando1.
	bando2do := bando2.
! !


!Combate methodsFor: 'public' stamp: 'fv 4/1/2024 11:56:21'!
cantidadDeRondas

	^cantidadDeRondas .! !

!Combate methodsFor: 'public' stamp: 'fv 4/5/2024 14:21:25'!
desarrollar

	[bando1ro hayAlgunoVivo and: [bando2do hayAlgunoVivo]] whileTrue: 
	
    	[
		self desarrollarUnaRonda.
	].! !

!Combate methodsFor: 'public' stamp: 'fv 4/5/2024 14:19:48'!
desarrollarUnaRonda

	bando1ro atacarABando: bando2do.
	bando2do atacarABando: bando1ro.
	cantidadDeRondas := cantidadDeRondas +1.

	(bando1ro hayAlgunoVivo not or: bando2do hayAlgunoVivo not) ifTrue: [bando1ro hayAlgunoVivo ifTrue:[ganador := bando1ro ] ifFalse: [ganador := bando2do]].
	! !

!Combate methodsFor: 'public' stamp: 'sdd 4/4/2024 11:35:34'!
ganador

	^ganador! !

!Combate methodsFor: 'public' stamp: 'sdd 4/4/2024 11:21:24'!
queTanBienGano

	^self ganador obtenerPromedioDeVidas.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combate class' category: #TP_CombatientesFantasticos!
Combate class
	instanceVariableNames: 'bando1ro bando2do'!

!Combate class methodsFor: 'as yet unclassified' stamp: 'sdd 3/29/2024 21:14:25'!
crearCon: bando1 y: bando2
	^self basicNew inicializarCon: bando1 yCon: bando2. 
	! !


!classDefinition: #Combatiente category: #TP_CombatientesFantasticos!
Object subclass: #Combatiente
	instanceVariableNames: 'enemigos estrategia dañoRecibido dañoQueEjecuta vidaMaxima'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!
!Combatiente commentStamp: '<historical>' prior: 0!
El combatiente es la representacion de un ente capaz de hacer daño. Toda instancia de combatiente tiene una
estrategia, aunque algunos no la pueden modificar.!


!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:00:52'!
asignarEnemigos: unConjuntoDeCombatientes 

	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:00:59'!
atacar

	| victimasElegidas |

	enemigos isEmpty ifTrue: [^self].
	victimasElegidas := self elegirVictimas.
	victimasElegidas do: [ :victima |self atacarA: victima ]
! !

!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:01:14'!
estaDañadoPor: unaCantidadDeDaño

	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:01:17'!
estaSano

	^dañoRecibido = 0.! !

!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:01:19'!
estaVivo

	^dañoRecibido < vidaMaxima ! !

!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:01:26'!
obtenerVida

	self estaVivo ifTrue: [^vidaMaxima -dañoRecibido].
	^0! !

!Combatiente methodsFor: 'public' stamp: 'fv 4/1/2024 12:01:34'!
obtenerVidaMaxima

	^vidaMaxima.! !


!Combatiente methodsFor: 'private' stamp: 'fv 4/1/2024 12:01:03'!
atacarA: unCombatiente

	self estaVivo ifTrue: [unCombatiente recibirDaño: dañoQueEjecuta .].! !

!Combatiente methodsFor: 'private' stamp: 'fv 4/1/2024 12:01:11'!
elegirVictimas

	self subclassResponsibility.! !

!Combatiente methodsFor: 'private' stamp: 'fv 4/1/2024 12:01:22'!
initialize

	enemigos := #().
	dañoRecibido := 0.! !

!Combatiente methodsFor: 'private' stamp: 'fv 4/1/2024 12:01:36'!
recibirDaño: unaCantidadDeDaño

	dañoRecibido := dañoRecibido + unaCantidadDeDaño.! !


!classDefinition: #Estratega category: #TP_CombatientesFantasticos!
Combatiente subclass: #Estratega
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!
!Estratega commentStamp: '<historical>' prior: 0!
El estratega es capaz de cambiar su estrategia.!


!Estratega methodsFor: 'public' stamp: 'fv 4/4/2024 23:13:25'!
enfocarseEnElMasHerido

	estrategia := [:candidatos | | combatientesVivos combatienteConVidaMinima losQueTienenVidaMinima |
		
	combatientesVivos := candidatos select: [:combatiente | combatiente estaVivo].
	combatienteConVidaMinima := combatientesVivos detectMin: [:combatiente | (combatiente obtenerVida)].
	losQueTienenVidaMinima :=	 combatientesVivos select: [:combatiente | combatiente obtenerVida = (combatienteConVidaMinima obtenerVida) ].
	{losQueTienenVidaMinima detectMax: [:soldado | soldado obtenerVidaMaxima]}]..! !

!Estratega methodsFor: 'public' stamp: 'fv 4/4/2024 23:17:36'!
enfocarseEnElMasSano
	estrategia := [:candidatos | | vidaMaximaDelCandidato losQueTienenVidaMaxima |
	vidaMaximaDelCandidato := candidatos detectMax: [:combatiente | combatiente obtenerVida]. 
	losQueTienenVidaMaxima :=	 candidatos select: [:combatiente | combatiente obtenerVida = vidaMaximaDelCandidato obtenerVida].
	{losQueTienenVidaMaxima detectMin: [:soldado | soldado obtenerVidaMaxima]}].

! !


!Estratega methodsFor: 'private' stamp: 'SDD 4/2/2024 00:15:04'!
elegirVictimas

	^estrategia value: enemigos.! !

!Estratega methodsFor: 'private' stamp: 'fv 4/1/2024 12:01:49'!
initialize 

	super initialize.! !


!classDefinition: #Humano category: #TP_CombatientesFantasticos!
Estratega subclass: #Humano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!Humano methodsFor: 'private' stamp: 'fv 4/1/2024 12:02:05'!
initialize

	super initialize.
	self enfocarseEnElMasSano.
	dañoQueEjecuta := 4.
	vidaMaxima :=20.! !


!classDefinition: #Ogro category: #TP_CombatientesFantasticos!
Estratega subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!Ogro methodsFor: 'private' stamp: 'fv 4/1/2024 12:02:11'!
initialize

	super initialize.
	self enfocarseEnElMasSano.
	dañoQueEjecuta := 8.
	vidaMaxima := 40.! !


!classDefinition: #NoEstratega category: #TP_CombatientesFantasticos!
Combatiente subclass: #NoEstratega
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!


!classDefinition: #Hostigador category: #TP_CombatientesFantasticos!
NoEstratega subclass: #Hostigador
	instanceVariableNames: 'turnoEsPar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!Hostigador methodsFor: 'private' stamp: 'fv 4/5/2024 00:11:46'!
alternarEstrategia

	(turnoEsPar) ifTrue: [self enforcarseEnElMasSano . turnoEsPar := false.] ifFalse: [self enforcarseEnElMasHerido . turnoEsPar := true.].! !

!Hostigador methodsFor: 'private' stamp: 'fv 4/5/2024 00:00:29'!
elegirVictimas

	self alternarEstrategia.
	^estrategia value: enemigos.! !

!Hostigador methodsFor: 'private' stamp: 'fv 4/5/2024 00:10:43'!
enforcarseEnElMasHerido

        estrategia := [:candidatos | | combatientesVivos combatienteConVidaMinima losQueTienenVidaMinima |	
	combatientesVivos := candidatos select: [:combatiente | combatiente estaVivo].
	combatienteConVidaMinima := combatientesVivos detectMin: [:combatiente | (combatiente obtenerVida)].
	losQueTienenVidaMinima :=	 combatientesVivos select: [:combatiente | combatiente obtenerVida = (combatienteConVidaMinima obtenerVida) ].
	{losQueTienenVidaMinima detectMax: [:soldado | soldado obtenerVidaMaxima]}].! !

!Hostigador methodsFor: 'private' stamp: 'fv 4/5/2024 00:10:03'!
enforcarseEnElMasSano

        estrategia := [:candidatos | | vidaMaximaDelCandidato losQueTienenVidaMaxima |
	vidaMaximaDelCandidato := candidatos detectMax: [:combatiente | combatiente obtenerVida]. 
	losQueTienenVidaMaxima :=	 candidatos select: [:combatiente | combatiente obtenerVida = vidaMaximaDelCandidato obtenerVida].
	{losQueTienenVidaMaxima detectMin: [:soldado | soldado obtenerVidaMaxima]}].! !

!Hostigador methodsFor: 'private' stamp: 'fv 4/1/2024 12:02:42'!
initialize

	super initialize.
	dañoQueEjecuta := 4.
	turnoEsPar := true.
	vidaMaxima :=20.! !


!classDefinition: #Mago category: #TP_CombatientesFantasticos!
NoEstratega subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CombatientesFantasticos'!

!Mago methodsFor: 'private' stamp: 'SDD 4/2/2024 00:12:06'!
elegirVictimas

    "Devuelve hasta los 6 enemigos con más vida, o todos si hay menos de 6."
    ^estrategia value: enemigos.
! !

!Mago methodsFor: 'private' stamp: 'fv 4/4/2024 23:18:00'!
initialize

	super initialize.
	dañoQueEjecuta := 2.
	estrategia := [:candidatos | | sortedCandidatos | sortedCandidatos := candidatos sorted: [:a :b | a obtenerVida > b obtenerVida ]. sortedCandidatos size > 6 
		ifTrue: [sortedCandidatos first: 6]
		ifFalse: [sortedCandidatos].]. 
	vidaMaxima :=20.
! !
