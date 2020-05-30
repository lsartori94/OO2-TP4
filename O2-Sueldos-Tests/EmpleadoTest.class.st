"
An EmpleadoTest is a test class for testing the behavior of Empleado
"
Class {
	#name : #EmpleadoTest,
	#superclass : #TestCase,
	#instVars : [
		'temporario',
		'temporarioCasado',
		'temporarioCon2Hijos',
		'pasante',
		'pasanteCon2Examenes',
		'planta',
		'plantaCasado',
		'plantaCon2Hijos',
		'plantaCon2HijosMuchaAntiguedad'
	],
	#category : #'O2-Sueldos-Tests'
}

{ #category : #running }
EmpleadoTest >> setUp [
	super setUp.
	temporario:= Temporario crearConHijos:0  casado: false.
	temporario hsTrabajadas: 10.
	temporarioCasado:= Temporario crearConHijos:0 casado: true.
	temporarioCasado hsTrabajadas: 10.
	temporarioCon2Hijos:= Temporario crearConHijos: 2 casado: false.
	temporarioCon2Hijos hsTrabajadas: 10.
	pasante:= Pasante crearConHijos: 0 casado: false.
	pasanteCon2Examenes:= Pasante crearConHijos: 0 casado: true.
	pasanteCon2Examenes examenesRendidos: 2.
	planta:= Planta crearConHijos: 0 casado: false.
	plantaCasado:= Planta crearConHijos: 0 casado: true.
	plantaCon2Hijos:= Planta crearConHijos: 2 casado: false.
	plantaCon2HijosMuchaAntiguedad:= Planta crearConHijos: 2 casado: true.
	plantaCon2HijosMuchaAntiguedad antiguedad: 10.
]

{ #category : #running }
EmpleadoTest >> tearDown [
	temporario:= nil.
	temporarioCasado:= nil.
	temporarioCon2Hijos:= nil.
	pasante:= nil.
	pasanteCon2Examenes:= nil.
	planta:= nil.
	plantaCasado:= nil.
	plantaCon2Hijos:= nil.
	plantaCon2HijosMuchaAntiguedad:= nil.
	super tearDown.
]

{ #category : #test }
EmpleadoTest >> testSueldo [
	self assert: temporario sueldo equals: 3567.
	self assert: temporarioCasado sueldo equals: 4042.
	self assert: temporarioCon2Hijos sueldo equals: 3757.
	self assert: pasante sueldo equals: 1740.
	self assert: pasanteCon2Examenes sueldo equals: 1930.
	self assert: planta sueldo equals: 2610.
	self assert: plantaCasado sueldo equals: 3085.
	self assert: plantaCon2Hijos sueldo equals: 2800.
	self assert: plantaCon2HijosMuchaAntiguedad sueldo equals: 4225.
]
