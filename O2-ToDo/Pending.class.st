Class {
	#name : #Pending,
	#superclass : #ToDoState,
	#category : #'O2-ToDo'
}

{ #category : #accessing }
Pending >> elapsedTime [
	self throwError: 'La tarea no ha sido iniciada'.
]

{ #category : #initialization }
Pending >> initialize [
	nombre:= 'Pending'.
]

{ #category : #accessing }
Pending >> start [
	|newState|
	newState:= InProgress new.
	newState startedTime: DateAndTime new.
	^ newState.
]
