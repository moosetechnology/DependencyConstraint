"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA **must** depend on moduleB
"
Class {
	#name : 'DCLMustConstraint',
	#superclass : 'DCLAbstractConstraint',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLMustConstraint >> check [
	"checks whether there is a dependency from ModuleA to ModuleB.
	If there is some, returns empty array (no violations)	
	If there is none, returns all dependencies from moduleA"

	| violations |
	violations := Set new.

	moduleA memberEntities do: [ :entityA || queryResultA |
		queryResultA := self outgoingDependenciesFor: entityA in: moduleA.
		moduleB memberEntities do: [:entityB |
			(queryResultA within: entityB)
				ifNotEmpty: [ ^#() ] ].
		violations addAll: queryResultA
	].
	^violations

]
