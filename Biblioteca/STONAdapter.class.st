Class {
	#name : #STONAdapter,
	#superclass : #Exporter,
	#instVars : [
		'adaptee'
	],
	#category : #Biblioteca
}

{ #category : #exporting }
STONAdapter >> export: anArray [
	^adaptee toStringPretty: anArray.
]
