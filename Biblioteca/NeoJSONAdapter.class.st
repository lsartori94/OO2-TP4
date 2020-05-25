Class {
	#name : #NeoJSONAdapter,
	#superclass : #Exporter,
	#instVars : [
		'adaptee'
	],
	#category : #Biblioteca
}

{ #category : #'instance creation' }
NeoJSONAdapter class >> new: anExporter [

	^self new initialize: anExporter
]

{ #category : #accessing }
NeoJSONAdapter >> adaptee: anAdaptee [
	adaptee:= anAdaptee.
]

{ #category : #exporting }
NeoJSONAdapter >> export: anArray [
	|processed|
	processed:= self process: anArray.
	^adaptee toStringPretty: processed.
]

{ #category : #initialization }
NeoJSONAdapter >> initialize: anExporter [
	adaptee:= anExporter.
]

{ #category : #processing }
NeoJSONAdapter >> process: anArray [
	^anArray collect: [
		:each | (Dictionary new at: #nombre put: each nombre; at: #email put: each email; at: #legajo put: each legajo; yourself)
	] as: OrderedCollection.
]
