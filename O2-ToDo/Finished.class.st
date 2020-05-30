Class {
	#name : #Finished,
	#superclass : #ToDoState,
	#category : #'O2-ToDo'
}

{ #category : #accessing }
Finished >> elapsedTime [
	^ finishedTime asSeconds.
]

{ #category : #initialization }
Finished >> initialize [
	nombre:= 'Finished'.
	finishedTime:= DateAndTime new.
]

{ #category : #testing }
Finished >> isFinished [
	^true.
]
