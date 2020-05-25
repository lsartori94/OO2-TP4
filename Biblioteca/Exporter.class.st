Class {
	#name : #Exporter,
	#superclass : #Object,
	#instVars : [
		'adaptee'
	],
	#category : #Biblioteca
}

{ #category : #'instance creation' }
Exporter class >> new: anExporter [

	^self new initialize: anExporter
]

{ #category : #accessing }
Exporter >> adaptee: anAdaptee [
	adaptee:= anAdaptee.
]

{ #category : #exporting }
Exporter >> export: anArray [
	^self subclassResponsibility.
]

{ #category : #initialization }
Exporter >> initialize: anExporter [
	adaptee:= anExporter.
]
