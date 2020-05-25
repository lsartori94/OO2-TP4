Class {
	#name : #VoorheesExporter,
	#superclass : #Object,
	#category : #Biblioteca
}

{ #category : #exporting }
VoorheesExporter >> export: socios [ 
	
	| exportedString |
	
	exportedString := '[', Character cr asString, 	(self exportSocio: socios first). 
	socios allButFirst do: [ :socio | 
		exportedString := exportedString, ',', Character cr asString, (self exportSocio: socio).	
		].
	
	^exportedString,Character cr asString,']'.

]

{ #category : #exporting }
VoorheesExporter >> exportSocio: aSocio [
	^
		'	{', Character cr asString,
		'		"nombre" : "',aSocio nombre,'",',Character cr asString,
		'		"email" : "',aSocio email,'",',Character cr asString,
		'		"legajo" : "',aSocio legajo,'"',Character cr asString,
		'	}'
]
