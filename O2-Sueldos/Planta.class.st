Class {
	#name : #Planta,
	#superclass : #Empleado,
	#instVars : [
		'antiguedad'
	],
	#category : #'O2-Sueldos'
}

{ #category : #accessing }
Planta >> antiguedad: aNumber [
	antiguedad:= aNumber.
]

{ #category : #initialization }
Planta >> initialize [
	antiguedad:= 0.
]

{ #category : #'as yet unclassified' }
Planta >> sueldoAdicional [
	^ super sueldoAdicional + (100 * antiguedad).
]

{ #category : #'as yet unclassified' }
Planta >> sueldoBasico [
	^ super sueldoBasico + 1000.
]
