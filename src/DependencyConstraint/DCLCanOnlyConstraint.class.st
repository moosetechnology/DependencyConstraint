"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA **can only** depend on moduleB (or on itself)
"
Class {
	#name : 'DCLCanOnlyConstraint',
	#superclass : 'DCLAbstractConstraint',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLCanOnlyConstraint >> check [
	"checks whether ModuleA only depends on ModuleB (ignoring self dependencies).
	If yes, returns empty array (no violations)	
	If there are other dependencies, return them"

	| violations |
	violations := Set new.

	moduleA memberEntities do: [ :entityA || queryResultA |
		queryResultA := (self outgoingDependenciesFor: entityA in:  moduleA)
			withoutSelfLoops.
		moduleB memberEntities do: [:entityB |
			queryResultA := queryResultA outOf: entityB ].
		violations addAll: queryResultA.
	].
	^violations

]
