Class {
	#name : #NeoJSONAdapter,
	#superclass : #Exporter,
	#category : #Biblioteca
}

{ #category : #exporting }
NeoJSONAdapter >> export: anArray [
	|processed|
	processed:= self process: anArray.
	^adaptee toStringPretty: processed.
]

{ #category : #processing }
NeoJSONAdapter >> process: anArray [
	^anArray collect: [
		:each | (Dictionary new at: #nombre put: each nombre; at: #email put: each email; at: #legajo put: each legajo; yourself)
	] as: OrderedCollection.
]
