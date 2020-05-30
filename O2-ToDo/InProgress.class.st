Class {
	#name : #InProgress,
	#superclass : #ToDoState,
	#category : #'O2-ToDo'
}

{ #category : #initialization }
InProgress >> finish [
	|newState|
	newState:= Finished new.
	newState startedTime: startedTime.
	^newState.
]

{ #category : #initialization }
InProgress >> initialize [
	nombre:= 'In Progress'
]

{ #category : #async }
InProgress >> togglePause [
	|newState|
	newState:= Paused new.
	newState startedTime: startedTime.
	^newState.
]
