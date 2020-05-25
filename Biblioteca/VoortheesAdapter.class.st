Class {
	#name : #VoortheesAdapter,
	#superclass : #Exporter,
	#category : #Biblioteca
}

{ #category : #exporting }
VoortheesAdapter >> export: anArray [
	^adaptee export: anArray.
]
