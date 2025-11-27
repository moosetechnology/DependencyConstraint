"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA cannot depend on any other module than moduleB (and itself)
"
Class {
	#name : 'DCLCanOnlyConstraint',
	#superclass : 'DCLAbstractConstraint',
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLCanOnlyConstraint >> fmProperties [

	^self sourceFmProperties
]

{ #category : 'checking' }
DCLCanOnlyConstraint >> isViolation: entityAssociation [
	"Violation if dependency to anything else than ModuleA or ModuleB"

	^(self result: entityAssociation target belongsTo: moduleA) not and:
	[ (self result: entityAssociation target belongsTo: moduleB) not ]
]

{ #category : 'checking' }
DCLCanOnlyConstraint >> moduleToCheck [

	^moduleA
]
