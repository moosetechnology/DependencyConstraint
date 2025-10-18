"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA **cannot** depend on moduleB
"
Class {
	#name : 'DCLCannotConstraint',
	#superclass : 'DCLAbstractConstraint',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLCannotConstraint >> check [

	"checks that there is no dependency from ModuleA to ModuleB.
	If there is none, returns empty array (no violations)	
	If there is some, returns them"

	| violations |
	violations := Set new.

	moduleA memberEntities do: [ :entityA || queryResultA |
		queryResultA := self outgoingDependenciesFor: entityA in:  moduleA.
		(moduleB memberEntities do: [ :entityB | 
			(queryResultA within: entityB)
				ifNotEmpty: [ :dependenciesToB | violations addAll: dependenciesToB ]
		])
	].
	^ violations
]
