Class {
	#name : #STONAdapter,
	#superclass : #Exporter,
	#instVars : [
		'adaptee'
	],
	#category : #Biblioteca
}

{ #category : #'instance creation' }
STONAdapter class >> new: anExporter [

	^self new initialize: anExporter
]

{ #category : #accessing }
STONAdapter >> adaptee: anAdaptee [
	adaptee:= anAdaptee.
]

{ #category : #exporting }
STONAdapter >> export: anArray [
	^adaptee toStringPretty: anArray.
]

{ #category : #initialization }
STONAdapter >> initialize: anExporter [
	adaptee:= anExporter.
]
