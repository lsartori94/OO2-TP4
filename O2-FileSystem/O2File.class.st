Class {
	#name : #O2File,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'fechaCreacion',
		'tamanoBytes',
		'tamanoKBytes'
	],
	#category : #'O2-FileSystem'
}

{ #category : #'as yet unclassified' }
O2File >> cantDeArch [
	^self subclassResponsibility.
]

{ #category : #accessing }
O2File >> fechaCreacion [
	^fechaCreacion asDate.
]

{ #category : #accessing }
O2File >> fechaCreacion: aString [
	fechaCreacion:= aString.
]

{ #category : #accessing }
O2File >> nombre [
	^nombre
]

{ #category : #accessing }
O2File >> nombre: aString [
	nombre:= aString.
]

{ #category : #printing }
O2File >> printElem:aListado route:aRoute [
]

{ #category : #accessing }
O2File >> tamanoBytes: aNumber [
	tamanoBytes:= aNumber.
]

{ #category : #accessing }
O2File >> tamanoKBytes [
	^tamanoBytes / 1000.
]

{ #category : #'as yet unclassified' }
O2File >> tamanoTotalOcupado [
	^self tamanoKBytes.
]
