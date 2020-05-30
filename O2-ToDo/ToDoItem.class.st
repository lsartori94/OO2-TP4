Class {
	#name : #ToDoItem,
	#superclass : #Object,
	#instVars : [
		'name',
		'state',
		'comments'
	],
	#category : #'O2-ToDo'
}

{ #category : #accessing }
ToDoItem class >> name: aName [
	"Instancia un ToDoItem nuevo en estado pending con aName como nombre"
	|tmp|
	tmp:= self new.
	tmp initialize.
	tmp name: aName.
	^tmp.
]

{ #category : #adding }
ToDoItem >> addComment: aComment [
	state isFinished
		ifFalse: [
			comments add: aComment.
		]
]

{ #category : #accessing }
ToDoItem >> comments [
	^comments.
]

{ #category : #initialization }
ToDoItem >> finish [
	"Pasa el ToDoItem a finished
	(siempre y cuando su estado actual sea in-progress o pausada, si se encuentra en otro estado, no hace nada)"
	state:= state finish.
]

{ #category : #initialization }
ToDoItem >> initialize [
	state:= Pending new.
	comments:= OrderedCollection new.
]

{ #category : #accessing }
ToDoItem >> name [
	^name.
]

{ #category : #accessing }
ToDoItem >> name: aName [
	name:= aName.
]

{ #category : #accessing }
ToDoItem >> start [
	"Pasa el ToDoItem a in-progress (siempre y cuando su estado actual sea pending, si se encueentra en otro estado, no hace nada"
	state:= state start.
]

{ #category : #accessing }
ToDoItem >> state [
	^state.
]

{ #category : #'as yet unclassified' }
ToDoItem >> togglePause [
	"Pasa la tarea a paused si su estado es in-progress, o a in-progress si su estado es paused.
	Caso contrario (pending o finished) generea un error informando la causa especifica del mismo"
	state:= state togglePause.
]

{ #category : #'as yet unclassified' }
ToDoItem >> workedTime [
	"Retorna el tiempo que transcurrio desde que se inicio la tarea (start) hasta que se finalizo.
	En caso de que no este finalizada, hasta el actual.
	Si la tarea no se inicio genera un error informando la causa especifica del mismo"
	^ state elapsedTime.
]
