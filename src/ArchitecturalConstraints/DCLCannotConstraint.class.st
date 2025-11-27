"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify that moduleA cannot have any dependency on moduleB
"
Class {
	#name : 'DCLCannotConstraint',
	#superclass : 'DCLAbstractConstraint',
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLCannotConstraint >> fmProperties [

	^self sourceFmProperties
]

{ #category : 'checking' }
DCLCannotConstraint >> isViolation: entityAssociation [
	"Violation if it's a dependency to ModuleB, anything else is OK"

	^self result: entityAssociation target belongsTo: moduleB
]

{ #category : 'checking' }
DCLCannotConstraint >> moduleToCheck [

	^moduleA
]
