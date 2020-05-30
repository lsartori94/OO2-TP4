Class {
	#name : #Temporario,
	#superclass : #Empleado,
	#instVars : [
		'hsTrabajadas'
	],
	#category : #'O2-Sueldos'
}

{ #category : #accessing }
Temporario >> hsTrabajadas: aNumber [
	hsTrabajadas:= aNumber.
]

{ #category : #'as yet unclassified' }
Temporario >> sueldoBasico [
	^ super sueldoBasico + 2000 + (10 * hsTrabajadas).
]
