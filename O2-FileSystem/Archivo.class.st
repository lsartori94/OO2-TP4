Class {
	#name : #Archivo,
	#superclass : #O2File,
	#category : #'O2-FileSystem'
}

{ #category : #'as yet unclassified' }
Archivo class >> llamado: unString creadoEl: unaFecha kBytes: unNumero [
	"Método de clase. Crea un nuevo archivo con nombre unString, de unNumero kBytes y en la fecha unaFecha."
	|tmp|
	tmp:= self new.
	tmp nombre: unString.
	tmp fechaCreacion: unaFecha.
	tmp tamanoBytes: unNumero * 1000.
	^tmp.
]

{ #category : #'as yet unclassified' }
Archivo >> cantDeArch [
	^ 1
]
