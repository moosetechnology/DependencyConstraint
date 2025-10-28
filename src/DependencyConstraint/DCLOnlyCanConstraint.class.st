"
I represent an architectural rule between two architectural modules A and B (DCLModule).
I specify no other entities than those in moduleA can depend on moduleB (or moduleB itself)
"
Class {
	#name : 'DCLOnlyCanConstraint',
	#superclass : 'DCLAbstractConstraint',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'checking' }
DCLOnlyCanConstraint >> fmProperties [

	^self targetFmProperties
]

{ #category : 'checking' }
DCLOnlyCanConstraint >> isViolation: entityAssociation [
	"If there is a dependency from outside ModuleA and ModuleB, it's a violation"

	^(self result: entityAssociation source belongsTo: moduleA) not and:
	[ (self result: entityAssociation source belongsTo: moduleB) not ]
]

{ #category : 'checking' }
DCLOnlyCanConstraint >> moduleToCheck [

	^moduleB
]
