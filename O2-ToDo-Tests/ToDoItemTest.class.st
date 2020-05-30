"
A ToDoItemTest is a test class for testing the behavior of ToDoItem
"
Class {
	#name : #ToDoItemTest,
	#superclass : #TestCase,
	#instVars : [
		'item1',
		'item2',
		'item3'
	],
	#category : #'O2-ToDo-Tests'
}

{ #category : #running }
ToDoItemTest >> setUp [
	super setUp.
	item1:= ToDoItem name: 'Tarea 1'.
	item2:= ToDoItem name: 'Tarea 2'.
	item3:= ToDoItem name: 'Tarea 3'.
]

{ #category : #running }
ToDoItemTest >> tearDown [
	item1:= nil.
	item2:= nil.
	item3:= nil.
]

{ #category : #test }
ToDoItemTest >> testAddComment [
	self assert: item1 comments size equals: 0.
	
	item1 addComment: 'Comment 1'.
	self assert: item1 comments size equals: 1.
	self assert: item1 comments first equals: 'Comment 1'.
	
	item1 start.
	item1 addComment: 'Comment 2'.
	self assert: item1 comments size equals: 2.
	self assert: item1 comments last equals: 'Comment 2'.
	
	item1 togglePause.
	item1 addComment: 'Comment 3'.
	self assert: item1 comments size equals: 3.
	self assert: item1 comments last equals: 'Comment 3'.
	
	item1 finish.
	item1 addComment: 'Comment 4'.
	self assert: item1 comments size equals: 3.
	self assert: item1 comments last equals: 'Comment 3'.
]

{ #category : #test }
ToDoItemTest >> testFinish [
	|finishedState pendingState|
	finishedState:= Finished new.
	pendingState:= Pending new.

	item1 start.
	item1 togglePause.
	item1 finish.
	self assert: item1 state nombre equals: finishedState nombre.
	
	item2 start.
	item2 finish.
	self assert: item2 state nombre equals: finishedState nombre.
	
	item3 finish.
	self assert: item3 state nombre equals: pendingState nombre.
]

{ #category : #test }
ToDoItemTest >> testStart [
	|pendingState inProgressState|
	pendingState:= Pending new.
	inProgressState:= InProgress new.
	self assert: item1 state nombre equals: pendingState nombre.
	self assert: item2 state nombre equals: pendingState nombre.

	item1 start.
	item2 start.
	
	self assert: item1 state nombre equals: inProgressState nombre.
	self assert: item2 state nombre equals: inProgressState nombre.
]

{ #category : #test }
ToDoItemTest >> testTogglePause [
	|pausedState inProgressState|
	pausedState:= Paused new.
	inProgressState:= InProgress new.

	"self should: item1 togglePause raise: Error.
	self should: item2 togglePause raise: Error."

	item1 start.
	item2 start.
	item1 togglePause.
	item2 togglePause.
	self assert: item1 state nombre equals: pausedState nombre.
	self assert: item2 state nombre equals: pausedState nombre.
	
	item1 togglePause.
	item2 togglePause.
	self assert: item1 state nombre equals: inProgressState nombre.
	self assert: item2 state nombre equals: inProgressState nombre.
	
	item1 finish.
	item2 finish.
	"self should: item1 togglePause raise: Error.
	self should: item2 togglePause raise: Error."
]

{ #category : #test }
ToDoItemTest >> testWorkedTime [
	|expected|
	item1 start.
	item1 togglePause.
	item1 togglePause.
	item1 finish.
	expected:= item1 state finishedTime asSeconds.
	
	self assert: item1 workedTime equals: expected.
	
	"self should: item2 workedTime raise: Error."
	
	item2 start.
	item2 finish.
	self assert: item2 workedTime equals: 0.
]
