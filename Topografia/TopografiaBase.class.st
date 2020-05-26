Class {
	#name : #TopografiaBase,
	#superclass : #Object,
	#category : #'Topografia-Model'
}

{ #category : #'as yet unclassified' }
TopografiaBase >> proporcionDeAgua [
	^self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
TopografiaBase >> proporcionDeTierra [
	^self subclassResponsibility.
]
