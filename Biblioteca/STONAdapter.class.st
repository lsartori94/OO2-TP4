Class {
	#name : #STONAdapter,
	#superclass : #Exporter,
	#category : #Biblioteca
}

{ #category : #exporting }
STONAdapter >> export: anArray [
	^adaptee toStringPretty: anArray.
]
