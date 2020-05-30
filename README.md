## Trabajo Práctico 4 de la materia OO2
En este repositorio se encuentra todo el proyecto que incluye los paquetes de cada ejercicio respectivamente.

## Tabla de contenido
- [Información del alumno](#informacion-del-alumno)
- [Respuestas de los ejercicios](#respuestas-de-los-ejercicios)
    * [Ejercicio 1](#ejercicio-1)
    * [Ejercicio 2](#ejercicio-2)
    * [Ejercicio 3](#ejercicio-3)
    * [Ejercicio 4](#ejercicio-4)
    * [Ejercicio 5](#ejercicio-5)
    * [Ejercicio 6](#ejercicio-6)
  
  

## Información del alumno
Luca Sartori `15625/0`

## Respuestas de los ejercicios
A continuacion se encuentran listados los ejercicios y sus correspondientes preguntas / carpetas de resolucion

### Ejercicio 1
#### Resolucion de código
El codigo correspondiente al ejercicio se encuentra en las siguientes carpetas (paquetes):

- [Modelos](/Biblioteca)
- [Tests](/Biblioteca-Tests)
#### Respuesta 5.a
El UML se encuentra en formato PDF [en una carpeta en mi Drive de Google](https://drive.google.com/file/d/1mcrS3qjIvlBk6UGt-kYVS7a1yrJa9AhC/view?usp=sharing)

### Ejercicio 2
#### Respuesta 1.a
En la Clase `Magnitude`, en la categoría `comparing`, el mensaje `Magnitude>>=` es un ejemplo de la aplicación del patron `Template Method` ya que el mismo representa una operacion la cual tiene una serie de pasos (en este caso delega totalmente la implementacion), los cuales delegan el cálculo a otro mensaje que puede ser implementado por una subclase.
```
= aMagnitude 
	"Compare the receiver with the argument and answer with true if the 
	receiver is equal to the argument. Otherwise answer false."

	^self subclassResponsibility
```
En este caso no hay una serie de pasos definidos, sino que delega la totalidad de los pasos a la subclase.

Luego en la subclase `Integer` podemos observar como el mensaje fue re-implementado para situar ese tipo de magnitud:
```
= aNumber
	aNumber isNumber ifFalse: [^ false].
	aNumber isInteger ifTrue:
		[aNumber negative == self negative
			ifTrue: [^ (self bytesCompare: aNumber) = 0]
			ifFalse: [^ false]].
	^ aNumber adaptToInteger: self andCompare: #=
```
#### Respuesta 1.b
En la Clase `Collection`, en la categoría `accessing`, el mensaje `Collection>>capacity` es un ejemplo de la aplicación del patron `Template Method` ya que el mismo representa una operacion la cual tiene una serie de pasos (en este caso 1 solo), los cuales delegan el cálculo a otro mensaje que puede ser implementado por una subclase.
```
capacity
	"Answer the current capacity of the receiver."

	^ self size
```
En este caso vemos que se delega el cálculo al mensaje `Collection>>size`, el cual posee una implementación por default:
```
size
	"Answer how many elements the receiver contains."

	| tally |
	tally := 0.
	self do: [:each | tally := tally + 1].
	^ tally
```
Luego en la subclase `HashedCollection` podemos observar que el mensaje `size` es overrideado por una implementación de esa clase:
```
size
	^ tally
```
#### Respuesta 2 - Ejemplo 1
En la clase `Number`, en la categoria `arithmetic`, el mensaje `Number>>abs` es otro ejemplo de template method, ya que delega parte del cálculo a un mensaje llamado `negated`:
```
abs
	"Answer a Number that is the absolute value (positive magnitude) of the 
	receiver."

	self < 0
		ifTrue: [^self negated]
		ifFalse: [^self]
```
El cual tiene como implementacion default lo siguiente:
```
negated
	"Answer a Number that is the negation of the receiver."

	^0 - self
```
Luego en la clase `Fraction` se reusa el mensaje `abs`, pero el mensaje `negated` es overrideado con lo siguiente: 
```
negated 
	"Refer to the comment in Number|negated."

	^ Fraction
		numerator: numerator negated
		denominator: denominator
```
#### Respuesta 2 - Ejemplo 2
En la clase `Integer`, en la categoria `printing`, el mensaje `Integer>>printString` es otro ejemplo de template method, ya que delega parte del cálculo a un mensaje llamado `printOn`:
```
printString
	"For Integer, prefer the stream version to the string version for efficiency"
	
	^String streamContents: [:str | self printOn: str base: 10]
```
Luego el mismo se ve overrideado en las sublclases `LargeInteger`y `SmallInteger`.

LargeInteger:
```
printOn: aStream base: b nDigits: n
	"Append a representation of this number in base b on aStream using n digits.
	In order to reduce cost of LargePositiveInteger ops, split the number of digts approximatily in two
	Should be invoked with: 0 <= self < (b raisedToInteger: n)"
	
	| halfPower half head tail |
	n <= 1 ifTrue: [
		n <= 0 ifTrue: [self error: 'Number of digits n should be > 0'].
		
		"Note: this is to stop an infinite loop if one ever attempts to print with a huge base
		This can happen because choice was to not hardcode any limit for base b
		We let Character>>#digitValue: fail"
		^aStream nextPut: (Character digitValue: self)].
	halfPower := n bitShift: -1.
	half := b raisedToInteger: halfPower.
	head := self quo: half.
	tail := self - (head * half).
	head printOn: aStream base: b nDigits: n - halfPower.
	tail printOn: aStream base: b nDigits: halfPower
```
SmallInteger:
```
printOn: stream base: base 
	"Append a representation of this number in base b on aStream."

	self printOn: stream base: base length: 0 padded: false
```
*Aclaración: Si bien en LargeInteger se ve presente el mismo patron con el mensaje printOn y sus subclases LargeNegativeInteger y LargePositiveInteger, los ejemplos no fueron incluidos por el largo de las implementaciones de código*

### Ejercicio 3
El codigo correspondiente al ejercicio se encuentra en las siguientes carpetas (paquetes):

- [Modelos](/Topografia)
- [Tests](/Topografia-Tests)
### Ejercicio 4

### Ejercicio 5

### Ejercicio 6
