"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA **only, can** depend on moduleB (and no other module apart for moduleB itself)
"
Class {
	#name : #DCLOnlyCanConstraint,
	#superclass : #DCLAbstractConstraint,
	#category : #'DependencyConstraint-Constraints'
}

{ #category : #checking }
DCLOnlyCanConstraint >> check [
	"checks whether only ModuleA depends on ModuleB (ignoring self dependencies in moduleB).
	If yes, returns empty array (no violations)	
	If there are other dependencies, return them"

	| violations |
	violations := Set new.

	moduleB memberEntities do: [ :entityB || queryResultB |
		queryResultB := (self incomingDependenciesFor: entityB in: moduleB) withoutSelfLoops.
		moduleA memberEntities do: [:entityA |
			queryResultB := queryResultB outOf: entityA ].
		violations addAll: queryResultB.
	].
	^violations

]
