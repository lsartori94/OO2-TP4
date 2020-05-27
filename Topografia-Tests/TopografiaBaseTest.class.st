"
A TopografiaBaseTest is a test class for testing the behavior of TopografiaBase
"
Class {
	#name : #TopografiaBaseTest,
	#superclass : #TestCase,
	#instVars : [
		'agua1',
		'agua2',
		'agua3',
		'tierra1',
		'tierra2'
	],
	#category : #'Topografia-Tests-Tests'
}

{ #category : #running }
TopografiaBaseTest >> setUp [
	super setUp.
	agua1:= TopografiaAgua new.
	agua2:= TopografiaAgua new.
	agua3:= TopografiaAgua new.
	tierra1:= TopografiaTierra new.
	tierra2:= TopografiaTierra new.
]

{ #category : #running }
TopografiaBaseTest >> tearDown [
	agua1:= nil.
	agua2:= nil.
	agua3:= nil.
	tierra1:= nil.
	tierra2:= nil.
	super tearDown.
]

{ #category : #test }
TopografiaBaseTest >> testEsIgualA [
	|res1 res2 res3|
	agua1:= TopografiaAgua new.
	agua2:= TopografiaAgua new.
	tierra1:= TopografiaTierra new.
	tierra2:= TopografiaTierra new.
	res1:= agua1 esIgualA: agua2.
	res2:= agua1 esIgualA: tierra1.
	res3:= tierra1 esIgualA: tierra2.
	self assert: res1 equals: true.
	self assert: res2 equals: false.
	self assert: res3 equals: true.
]
