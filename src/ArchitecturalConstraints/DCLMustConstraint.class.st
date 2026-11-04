"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA must have dependencies on moduleB
"
Class {
	#name : 'DCLMustConstraint',
	#superclass : 'DCLAbstractConstraint',
	#instVars : [
		'foundDependencyToB'
	],
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLMustConstraint >> fmProperties [

	^self sourceFmProperties
]

{ #category : 'checking' }
DCLMustConstraint >> isViolation: entityAssociation [
	"Violation if there is a dependency to something not ModuleA or Module B
	 If there is a dependency to ModuleA: ignore it (not a violation)
	 If there is a dependency to ModuleB: record it was found (and not a violation)"

	(self result: entityAssociation target belongsTo: moduleA)
		ifTrue: [ ^false ].

	^(self result: entityAssociation target belongsTo: moduleB)
		ifTrue: [ foundDependencyToB :=  true. false ]
		ifFalse: [ true ]
]

{ #category : 'checking' }
DCLMustConstraint >> moduleToCheck [

	^moduleA
]

{ #category : 'running' }
DCLMustConstraint >> runOn: aCollection [
	foundDependencyToB := false.
	super runOn: aCollection.
	foundDependencyToB ifTrue: [ self removeAllViolations ]

]
