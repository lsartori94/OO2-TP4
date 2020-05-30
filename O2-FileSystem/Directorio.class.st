Class {
	#name : #Directorio,
	#superclass : #O2File,
	#instVars : [
		'contenido'
	],
	#category : #'O2-FileSystem'
}

{ #category : #'as yet unclassified' }
Directorio class >> llamado: unString creadoEl: unaFecha [
	"Método de clase. Crea un nuevo Directorio con nombre unString y en la fecha unaFecha."
	|tmp|
	tmp:= self new.
	tmp nombre: unString.
	tmp fechaCreacion: unaFecha.
	tmp tamanoBytes: 32 * 1000.
	^tmp.
]

{ #category : #'as yet unclassified' }
Directorio >> agregar: unArchivo [
	contenido add: unArchivo.
	
]

{ #category : #'as yet unclassified' }
Directorio >> archivoMasGrande [
	"Retorna el archivo con mayor cantidad de bytes en cualquier nivel del filesystem contenido por directorio receptor."
	|max newMax|
	max:= Archivo llamado: 'max' creadoEl: '1990-01-01' kBytes:0. 
	contenido
		do: [
			:each | each cantDeArch == 0
			ifTrue: [
				newMax:= each detectMaxFile: max.
				newMax tamanoTotalOcupado > max tamanoTotalOcupado
				ifTrue: [ max:= newMax ]
			]
			ifFalse: [
				each tamanoTotalOcupado > max tamanoTotalOcupado
				ifTrue: [ max:= each ]
			]
		].
	^ max
]

{ #category : #'as yet unclassified' }
Directorio >> archivoMasNuevo [
	"retorna el archivo con fecha de creacion más reciente en cualquier nivel del filesystem contenido por directorio receptor."
	|max newMax|
	max:= Archivo llamado: 'max' creadoEl: '1990-01-01' kBytes:0. 
	contenido
		do: [
			:each | each cantDeArch == 0
			ifTrue: [
				newMax:= each fechaCreacionMasNueva: max.
				newMax fechaCreacion > max fechaCreacion
				ifTrue: [ max:= newMax ]
			]
			ifFalse: [
				each fechaCreacion > max fechaCreacion
				ifTrue: [ max:= each ]
			]
		].
	^ max.
]

{ #category : #'as yet unclassified' }
Directorio >> cantDeArch [
	^ 0
]

{ #category : #'as yet unclassified' }
Directorio >> detectMaxFile: fileMax [
	| max newMax |
	max := fileMax.
	newMax := fileMax.
	contenido
		do: [
			:each | (each cantDeArch == 0)
			ifTrue:[
				newMax := each detectMaxFile: max.
				newMax tamanoTotalOcupado > max tamanoTotalOcupado
				ifTrue:[max:=newMax]
			]
			ifFalse:[
				each tamanoTotalOcupado > max tamanoTotalOcupado 
				ifTrue: [max:= each]
			]
		].
	^ max
]

{ #category : #'as yet unclassified' }
Directorio >> fechaCreacionMasNueva: fileMax [
	| max newMax |
	max := fileMax.
	newMax := fileMax.
	contenido
		do: [
			:each | each cantDeArch == 0
			ifTrue: [
				newMax := each fechaCreacionMasNueva: max.
				newMax fechaCreacion > max fechaCreacion
				ifTrue: [ max:= newMax ]
			]
			ifFalse: [
				each fechaCreacion > max fechaCreacion
				ifTrue: [ max:= each ]
			]
		].
	^ max.
]

{ #category : #initialization }
Directorio >> initialize [
	contenido:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Directorio >> listadoDeContenido [
	"Retorna un string con el listado del contenido del directorio imprimiendo el path completo de cada elemento (similar al comando pwd de linux) siguiendo el
	modelo presentado a continuación:
	/Directorio A
	/Directorio A/Directorio A.1
	/Directorio A/Directorio A.1/Directorio A.1.1 (3 archivos)
	/Directorio A/Directorio A.1/Directorio A.1.2 (2 archivos)
	/Directorio A/Directorio A.2
	/Directorio B"
	| listadoStream |
	listadoStream := WriteStream on: String new.
	self printElem: listadoStream route:''.
	^ listadoStream contents.
]

{ #category : #printing }
Directorio >> printElem: aListado route: aRoute [
	| route |
	aRoute = ''
		ifFalse: [ aListado cr ].
	route := aRoute , '/' , nombre.
	aListado
		<< (route , ' (' , self processCantDeArch printString , ' archivos)').
	contenido do: [ :each | each printElem: aListado route: route ].
	^ aListado
]

{ #category : #'as yet unclassified' }
Directorio >> processCantDeArch [
	^ contenido sumNumbers: [:each| each cantDeArch ]
]

{ #category : #'as yet unclassified' }
Directorio >> tamanoTotalOcupado [
	"Retorna el espacio total ocupado en KB, incluyendo su contenido."
	|total sum|
	total:= 0.
	sum:= 0.
	contenido ifNotEmpty: [ sum:= contenido sum: [ :each | each tamanoTotalOcupado  ] ].
	total:= total + sum + self tamanoKBytes.
	^total.
]
