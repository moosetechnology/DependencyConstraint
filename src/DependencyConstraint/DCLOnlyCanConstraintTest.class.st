Class {
	#name : 'DCLOnlyCanConstraintTest',
	#superclass : 'DCLAbstractConstraintTest',
	#category : 'DependencyConstraint-Tests',
	#package : 'DependencyConstraint',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLOnlyCanConstraintTest >> testCheckNotOKReference [
	| violations |
	violations := (p3 onlyCan reference: p2p5) check.
	self assert: violations size equals: 1.
	"m1p1c1Mtd2 -> M2P5C11FullRefereeOutSide"
]

{ #category : 'tests' }
DCLOnlyCanConstraintTest >> testCheckOKReference [
	| violations |
	violations := (p13 onlyCan reference: p14) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLOnlyCanConstraintTest >> testIsFullySpecified [
	| constraint |
	constraint := p2p5 onlyCan access: p3.

	self assert: constraint class equals: DCLOnlyCanConstraint.
	self assert: constraint isFullySpecified 
]

{ #category : 'tests' }
DCLOnlyCanConstraintTest >> testIsNotFullySpecified [
	| constraint |
	constraint := p2p5 onlyCan.

	self assert: constraint class equals: DCLOnlyCanConstraint.
	self deny: constraint isFullySpecified 
]
