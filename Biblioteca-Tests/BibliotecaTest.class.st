"
A BibliotecaTest is a test class for testing the behavior of Biblioteca
"
Class {
	#name : #BibliotecaTest,
	#superclass : #TestCase,
	#instVars : [
		'biblioteca',
		'arya',
		'tyron'
	],
	#category : #'Biblioteca-Tests'
}

{ #category : #running }
BibliotecaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	biblioteca:= Biblioteca new: VoorheesExporter new.
	arya:= Socio nombre:'Arya Stark' email:'needle@stark.com' legajo: '5234/5'.
	tyron:= Socio nombre:'Tyron Lannister' email:'tyron@thelannisters.com' legajo:'2345/2'.
]

{ #category : #running }
BibliotecaTest >> tearDown [
	biblioteca:= nil.
	arya:= nil.
	tyron:= nil.
]

{ #category : #test }
BibliotecaTest >> testAgregarSocio [
	self assert: biblioteca socios size equals: 0.
	biblioteca agregarSocio: arya.
	self assert: biblioteca socios first nombre equals: arya nombre.
	biblioteca agregarSocio: tyron.
	self assert: biblioteca socios last nombre equals: tyron nombre.
	
]

{ #category : #test }
BibliotecaTest >> testExportarSocios [
	|result|
	result:= '[
	{
		"nombre" : "Arya Stark",
		"email" : "needle@stark.com",
		"legajo" : "5234/5"
	},
	{
		"nombre" : "Tyron Lannister",
		"email" : "tyron@thelannisters.com",
		"legajo" : "2345/2"
	}
]'.
	biblioteca agregarSocio: arya.
	biblioteca agregarSocio: tyron.
	self assert: biblioteca exportarSocios equals: result.
]
