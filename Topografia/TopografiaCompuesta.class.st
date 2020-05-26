Class {
	#name : #TopografiaCompuesta,
	#superclass : #TopografiaBase,
	#instVars : [
		'topografias'
	],
	#category : #'Topografia-Model'
}

{ #category : #'instance creation' }
TopografiaCompuesta class >> new: someTopografias [
	^self new initialize: someTopografias.
]

{ #category : #initialization }
TopografiaCompuesta >> initialize: someTopografias [
	topografias:= someTopografias copyFrom: 1 to: 4.
]

{ #category : #'as yet unclassified' }
TopografiaCompuesta >> proporcionDeAgua [
	|result|
	result:= 0.
	topografias do: [
		:each | result:= result + each proporcionDeAgua.
	].
	^result/4.
]

{ #category : #'as yet unclassified' }
TopografiaCompuesta >> proporcionDeTierra [
	^1 - self proporcionDeAgua.
]
