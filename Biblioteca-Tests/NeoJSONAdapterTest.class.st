Class {
	#name : #NeoJSONAdapterTest,
	#superclass : #TestCase,
	#instVars : [
		'biblioteca',
		'arya',
		'tyron'
	],
	#category : #'Biblioteca-Tests'
}

{ #category : #running }
NeoJSONAdapterTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|adapter|
	super setUp.
	adapter:= NeoJSONAdapter new: (NeoJSONWriter).
	biblioteca:= Biblioteca new: adapter.
	arya:= Socio nombre:'Arya Stark' email:'needle@stark.com' legajo: '5234/5'.
	tyron:= Socio nombre:'Tyron Lannister' email:'tyron@thelannisters.com' legajo:'2345/2'.
]

{ #category : #running }
NeoJSONAdapterTest >> tearDown [
	biblioteca:= nil.
	arya:= nil.
	tyron:= nil.
]

{ #category : #test }
NeoJSONAdapterTest >> testExport [
|result expected|
	expected:= '[
	{
		"legajo" : "5234/5",
		"email" : "needle@stark.com",
		"nombre" : "Arya Stark"
	},
	{
		"legajo" : "2345/2",
		"email" : "tyron@thelannisters.com",
		"nombre" : "Tyron Lannister"
	}
]'.
	biblioteca agregarSocio: arya.
	biblioteca agregarSocio: tyron.
	result:= biblioteca exportarSocios.
	self assert: result equals: expected.
]
