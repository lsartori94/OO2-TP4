Class {
	#name : #Socio,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'email',
		'legajo'
	],
	#category : #Biblioteca
}

{ #category : #creation }
Socio class >> nombre: aString email: aString2 legajo: aString3 [ 
	^self new nombre: aString email: aString2 legajo: aString3 
]

{ #category : #accessing }
Socio >> email [
	^ email
]

{ #category : #accessing }
Socio >> email: anObject [
	email := anObject
]

{ #category : #accessing }
Socio >> legajo [
	^ legajo
]

{ #category : #accessing }
Socio >> legajo: anObject [
	legajo := anObject
]

{ #category : #accessing }
Socio >> nombre [
	^ nombre
]

{ #category : #accessing }
Socio >> nombre: anObject [
	nombre := anObject
]

{ #category : #initialization }
Socio >> nombre: aString email: aString2 legajo: aString3 [ 
	nombre:= aString.
	email:= aString2.
	legajo:= aString3.
]
