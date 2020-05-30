Class {
	#name : #Paused,
	#superclass : #ToDoState,
	#category : #'O2-ToDo'
}

{ #category : #initialization }
Paused >> finish [
	^ Finished new.
]

{ #category : #initialization }
Paused >> initialize [
	nombre:= 'Paused'.
]

{ #category : #'as yet unclassified' }
Paused >> togglePause [
	|newState|
	newState:= InProgress new.
	newState startedTime: startedTime.
	^newState.
]
