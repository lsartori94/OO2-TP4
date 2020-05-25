Class {
	#name : #VoortheesAdapter,
	#superclass : #Exporter,
	#instVars : [
		'adaptee'
	],
	#category : #Biblioteca
}

{ #category : #'instance creation' }
VoortheesAdapter class >> new: anExporter [

	^self new initialize: anExporter
]

{ #category : #accessing }
VoortheesAdapter >> adaptee: anAdaptee [
	adaptee:= anAdaptee.
]

{ #category : #exporting }
VoortheesAdapter >> export: anArray [
	^adaptee export: anArray.
]

{ #category : #initialization }
VoortheesAdapter >> initialize: anExporter [
	adaptee:= anExporter.
]
