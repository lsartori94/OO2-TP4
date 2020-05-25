Class {
	#name : #VoortheesAdapterTest,
	#superclass : #TestCase,
	#instVars : [
		'biblioteca',
		'arya',
		'tyron'
	],
	#category : #'Biblioteca-Tests'
}

{ #category : #running }
VoortheesAdapterTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|adapter|
	super setUp.
	adapter:= VoortheesAdapter new: (VoorheesExporter new).
	biblioteca:= Biblioteca new: adapter.
	arya:= Socio nombre:'Arya Stark' email:'needle@stark.com' legajo: '5234/5'.
	tyron:= Socio nombre:'Tyron Lannister' email:'tyron@thelannisters.com' legajo:'2345/2'.
]

{ #category : #running }
VoortheesAdapterTest >> tearDown [
	biblioteca:= nil.
	arya:= nil.
	tyron:= nil.
	super tearDown.
]

{ #category : #test }
VoortheesAdapterTest >> testExport [
|result expected|
	expected:= '[
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
	result:= biblioteca exportarSocios.
	self assert: result equals: expected.
]
