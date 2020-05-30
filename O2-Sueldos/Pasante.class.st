Class {
	#name : #Pasante,
	#superclass : #Empleado,
	#instVars : [
		'examenesRendidos'
	],
	#category : #'O2-Sueldos'
}

{ #category : #accessing }
Pasante >> examenesRendidos: aNumber [
	examenesRendidos:= aNumber.
]

{ #category : #initialization }
Pasante >> initialize [
	examenesRendidos:= 0.
]

{ #category : #'as yet unclassified' }
Pasante >> sueldoAdicional [
	^100 * examenesRendidos.
]
