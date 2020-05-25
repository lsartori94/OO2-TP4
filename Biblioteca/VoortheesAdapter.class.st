Class {
	#name : #VoortheesAdapter,
	#superclass : #Exporter,
	#instVars : [
		'adaptee'
	],
	#category : #Biblioteca
}

{ #category : #exporting }
VoortheesAdapter >> export: anArray [
	^adaptee export: anArray.
]
