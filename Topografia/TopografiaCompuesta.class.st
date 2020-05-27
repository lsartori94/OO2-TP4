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

{ #category : #accessing }
TopografiaCompuesta >> base [
	^4.
]

{ #category : #accessing }
TopografiaCompuesta >> esIgualA: topografia [
	| equality |
	equality:= true.
	"es simple"
	topografia base < 4
	ifTrue: [
		equality:= false.
	]
	ifFalse: [
		topografias
		  doWithIndex: [
			  :each :index |
			  ((topografia topografias at: index) esIgualA: each)
				  ifFalse: [ equality:= false ].
		  ].
	].
	^ equality.
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

{ #category : #accessing }
TopografiaCompuesta >> topografias [
	^topografias.
]
