"
A TopografiaCompuestaTest is a test class for testing the behavior of TopografiaCompuesta
"
Class {
	#name : #TopografiaCompuestaTest,
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
TopografiaCompuestaTest >> setUp [
	super setUp.
	agua1:= TopografiaAgua new.
	agua2:= TopografiaAgua new.
	agua3:= TopografiaAgua new.
	tierra1:= TopografiaTierra new.
	tierra2:= TopografiaTierra new.
]

{ #category : #running }
TopografiaCompuestaTest >> tearDown [
	agua1:= nil.
	agua2:= nil.
	agua3:= nil.
	tierra1:= nil.
	tierra2:= nil.
	super tearDown.
]

{ #category : #test }
TopografiaCompuestaTest >> testEsIgualA [
	|top1 top2 top3 top4 top5 top6 set set2 set3 res1 res2 res3 res4 res5 res6 res7|
	set:= OrderedCollection new.
	set add: agua1. set add: tierra1. set add: agua2. set add: tierra2.
	set2:= OrderedCollection new.
	set2 add: agua2. set2 add: agua1. set2 add: agua3. set2 add: tierra1.
	
	top1:= TopografiaCompuesta new: set.
	top2:= TopografiaCompuesta new: set2.
	top3:= TopografiaCompuesta new: set.
	top4:= TopografiaCompuesta new: set.	
	set3:= OrderedCollection new.
	set3 add: top1. set3 add: top2. set3 add: top3. set3 add: top4.
	top5:= TopografiaCompuesta new: set3.
	top6:= TopografiaCompuesta new: set3.
	
	res1:= top1 esIgualA: top2.
	res2:= top1 esIgualA: top3.
	res3:= top1 esIgualA: top4.
	res4:= top1 esIgualA: top5.
	res5:= top5 esIgualA: top1.
	res6:= top5 esIgualA: top6.
	res7:= top6 esIgualA: top5.
	
	self assert: res1 equals: false.
	self assert: res2 equals: true.
	self assert: res3 equals: true.
	self assert: res4 equals: false.
	self assert: res5 equals: false.
	self assert: res6 equals: true.
	self assert: res7 equals: true.
]

{ #category : #test }
TopografiaCompuestaTest >> testProporcionDeAgua [
	|top1 top2 top3 top4 top5 prop1 prop2 propFinal set set2 set3 sumaProps|
	prop1:= 2/4.
	prop2:= 3/4.
	sumaProps:= prop1 + prop2 + prop1 + prop1.
	propFinal:= sumaProps/4.
	set:= OrderedCollection new.
	set add: agua1. set add: tierra1. set add: agua2. set add: tierra2.
	set2:= OrderedCollection new.
	set2 add: agua2. set2 add: agua1. set2 add: agua3. set2 add: tierra1.
	
	top1:= TopografiaCompuesta new: set.
	top2:= TopografiaCompuesta new: set2.
	self assert: top1 proporcionDeAgua equals: prop1.
	self assert: top2 proporcionDeAgua equals: prop2.
	
	top3:= TopografiaCompuesta new: set.
	top4:= TopografiaCompuesta new: set.
	self assert: top3 proporcionDeAgua equals: prop1.
	self assert: top4 proporcionDeAgua equals: prop1.
	
	set3:= OrderedCollection new.
	set3 add: top1. set3 add: top2. set3 add: top3. set3 add: top4.
	top5:= TopografiaCompuesta new: set3.
	self assert: top5 proporcionDeAgua equals: propFinal.
]

{ #category : #test }
TopografiaCompuestaTest >> testProporcionDeTierra [
	|top1 top2 top3 top4 top5 prop1 prop2 propFinal set set2 set3 sumaProps|
	prop1:= 2/4.
	prop2:= 1/4.
	sumaProps:= prop1 + prop2 + prop1 + prop1.
	propFinal:= sumaProps/4.
	set:= OrderedCollection new.
	set add: agua1. set add: tierra1. set add: agua2. set add: tierra2.
	set2:= OrderedCollection new.
	set2 add: agua2. set2 add: agua1. set2 add: agua3. set2 add: tierra1.
	
	top1:= TopografiaCompuesta new: set.
	top2:= TopografiaCompuesta new: set2.
	self assert: top1 proporcionDeTierra equals: prop1.
	self assert: top2 proporcionDeTierra equals: prop2.
	
	top3:= TopografiaCompuesta new: set.
	top4:= TopografiaCompuesta new: set.
	self assert: top3 proporcionDeTierra equals: prop1.
	self assert: top4 proporcionDeTierra equals: prop1.
	
	set3:= OrderedCollection new.
	set3 add: top1. set3 add: top2. set3 add: top3. set3 add: top4.
	top5:= TopografiaCompuesta new: set3.
	self assert: top5 proporcionDeTierra equals: propFinal.
]
