Class {
	#name : 'DCLMustConstraintTest',
	#superclass : 'DCLAbstractConstraintTest',
	#category : 'ArchitecturalConstraints-Tests',
	#package : 'ArchitecturalConstraints',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLMustConstraintTest >> testCheckNotOKDepend [
	| violations |
	violations := (p2p5 must depend: p3) check.
	self assert: violations size equals: 18
	"((mooseModel entityNamed: 'Moose-TestResources-KGB-P2InteractedReferencerReferee')
		queryAllOutgoing) withoutSelfLoops.
		--> 14 (15 - 'M1P2C3ReferencerInSideRefereeOutSide-|>M2P5C11FullRefereeOutSide)'
	 ((mooseModel entityNamed: 'Moose-TestResources-KGB-P5FullReferee')
		queryAllOutgoing) withoutSelfLoops.
		--> 4"
]

{ #category : 'tests' }
DCLMustConstraintTest >> testCheckNotOKInvoke [
	| violations |

	violations := (p2p5 must invoke: p3) check.
	self assert: violations size equals: 13

	"((model entityNamed: 'Moose-TestResources-KGB-P2InteractedReferencerReferee')
		queryOutgoing: FamixTInvocation) withoutSelfLoops.
		--> 10
	 ((model entityNamed: 'Moose-TestResources-KGB-P5FullReferee')
		queryOutgoing: FamixTInvocation) withoutSelfLoops.
		--> 3"
]

{ #category : 'tests' }
DCLMustConstraintTest >> testCheckOKDepend [
	| violations |
	violations := (p3 must depend: p2p5) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLMustConstraintTest >> testCheckOKInvoke [
	| violations |
	violations := (p3 must invoke: p2p5) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLMustConstraintTest >> testCheckOKReference [
	| violations |
	violations := (p3 must reference: p2p5) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLMustConstraintTest >> testIsFullySpecified [
	| constraint |
	constraint := p2p5 must access: p3.

	self assert: constraint class equals: DCLMustConstraint.
	self assert: constraint isFullySpecified 
]

{ #category : 'tests' }
DCLMustConstraintTest >> testIsNotFullySpecified [
	| constraint |
	constraint := p2p5 must.

	self assert: constraint class equals: DCLMustConstraint.
	self deny: constraint isFullySpecified 
]
