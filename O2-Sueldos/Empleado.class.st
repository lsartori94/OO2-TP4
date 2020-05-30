Class {
	#name : #Empleado,
	#superclass : #Object,
	#instVars : [
		'casado',
		'hijos'
	],
	#category : #'O2-Sueldos'
}

{ #category : #'instance creation' }
Empleado class >> crearConHijos: aNumber casado: aBoolean [
	|tmp|
	tmp:= self new.
	tmp hijos: aNumber.
	tmp casado: aBoolean.
	^tmp.
]

{ #category : #accessing }
Empleado >> casado: aBoolean [
	casado:= aBoolean.
]

{ #category : #'as yet unclassified' }
Empleado >> descuento [
	^ (self sueldoAdicional * 0.05) + (self sueldoBasico * 0.13).
]

{ #category : #accessing }
Empleado >> hijos: aNumber [
	hijos:= aNumber.
]

{ #category : #'as yet unclassified' }
Empleado >> sueldo [
	^self sueldoBasico + self sueldoAdicional - self descuento.
]

{ #category : #'as yet unclassified' }
Empleado >> sueldoAdicional [
	|total|
	total:=0.
	casado ifTrue: [ total:= total + 500 ].
	^total + (100 * hijos).
]

{ #category : #'as yet unclassified' }
Empleado >> sueldoBasico [
	^2000.
]
