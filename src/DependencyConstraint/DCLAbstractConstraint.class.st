"
I represent an architectural rule between two architectural modules (DCLModule).

Rule can be verified by #check that will reutrn a list of violations if any

dependencies between modules can be:
- #access:
- #invoke:
- #reference:
- #inherit:
- #depend: (all four preceeding together)
"
Class {
	#name : #DCLAbstractConstraint,
	#superclass : #Object,
	#instVars : [
		'moduleB',
		'association',
		'moduleA'
	],
	#category : #'DependencyConstraint-Constraints'
}

{ #category : #DSL }
DCLAbstractConstraint >> access: aDCLModule [
	association := FamixTAccess.
	moduleB := aDCLModule
]

{ #category : #accessing }
DCLAbstractConstraint >> association [

	^ association
]

{ #category : #accessing }
DCLAbstractConstraint >> association: anObject [

	association := anObject
]

{ #category : #checking }
DCLAbstractConstraint >> check [
	self subclassResponsibility 
]

{ #category : #DSL }
DCLAbstractConstraint >> depend: aDCLModule [
	association := FamixTAssociation.
	moduleB := aDCLModule
]

{ #category : #accessing }
DCLAbstractConstraint >> incomingDependenciesFor: entity in: module [
	^module incomingDependencies: association for: entity
]

{ #category : #DSL }
DCLAbstractConstraint >> inherit: aDCLModule [
	association := FamixTInheritance.
	moduleB := aDCLModule
]

{ #category : #DSL }
DCLAbstractConstraint >> invoke: aDCLModule [
	association := FamixTInvocation.
	moduleB := aDCLModule
]

{ #category : #testing }
DCLAbstractConstraint >> isFullySpecified [ 
| a |
a isNil.
	^ (moduleA notNil) and:
		[ moduleA isFullySpecified and: 
		[ moduleB isNotNil and:
		[ moduleB isFullySpecified and:
		[ association notNil ] ] ] ].

]

{ #category : #accessing }
DCLAbstractConstraint >> moduleA [

	^ moduleA
]

{ #category : #accessing }
DCLAbstractConstraint >> moduleA: anObject [

	moduleA := anObject
]

{ #category : #accessing }
DCLAbstractConstraint >> moduleB [

	^ moduleB
]

{ #category : #accessing }
DCLAbstractConstraint >> moduleB: anObject [

	moduleB := anObject
]

{ #category : #accessing }
DCLAbstractConstraint >> outgoingDependenciesFor: entity in: module [
	^module outgoingDependencies: association for: entity
]

{ #category : #DSL }
DCLAbstractConstraint >> reference: aDCLModule [
	association := FamixTReference.
	moduleB := aDCLModule
]

{ #category : #accessing }
DCLAbstractConstraint >> violations [
	^self check
]
