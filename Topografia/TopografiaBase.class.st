Class {
	#name : #TopografiaBase,
	#superclass : #Object,
	#category : #'Topografia-Model'
}

{ #category : #accessing }
TopografiaBase >> base [
	^1.
]

{ #category : #'as yet unclassified' }
TopografiaBase >> esIgualA: topografia [
	^self proporcionDeAgua == topografia proporcionDeAgua.
]

{ #category : #'as yet unclassified' }
TopografiaBase >> proporcionDeAgua [
	^self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
TopografiaBase >> proporcionDeTierra [
	^self subclassResponsibility.
]
