Class {
	#name : #ToDoState,
	#superclass : #Object,
	#instVars : [
		'startedTime',
		'nombre',
		'finishedTime'
	],
	#category : #'O2-ToDo'
}

{ #category : #accessing }
ToDoState >> elapsedTime [
	^ (DateAndTime now - startedTime) asSeconds.
	
]

{ #category : #initialization }
ToDoState >> finish [
	^ self.
]

{ #category : #accessing }
ToDoState >> finishedTime [
	^finishedTime.
]

{ #category : #testing }
ToDoState >> isFinished [
	^false.
]

{ #category : #accessing }
ToDoState >> nombre [
	^nombre.
]

{ #category : #accessing }
ToDoState >> start [
	^ self.
]

{ #category : #accessing }
ToDoState >> startedTime [
	^startedTime.
]

{ #category : #accessing }
ToDoState >> startedTime: aTime [
	startedTime:= aTime.
]

{ #category : #'as yet unclassified' }
ToDoState >> throwError: aMessage [
	self error: aMessage.
]

{ #category : #async }
ToDoState >> togglePause [
	self throwError: 'El Estado ' , nombre , ' no puede ser pausado'.
	^ self.
]
