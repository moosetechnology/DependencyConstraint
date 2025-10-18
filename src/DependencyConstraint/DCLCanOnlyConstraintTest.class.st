Class {
	#name : 'DCLCanOnlyConstraintTest',
	#superclass : 'DCLAbstractConstraintTest',
	#category : 'DependencyConstraint-Tests',
	#package : 'DependencyConstraint',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLCanOnlyConstraintTest >> testCheckNotOKInvoke [
	| violations |
	violations := (p3 canOnly invoke: p2p5) check.
	self assert: violations size equals: 3.
	"m1p3c5Mtd1 -> new
	 m1p3c6Mtd1 -> new
	 m1p3c6Mtd2 -> new"
]

{ #category : 'tests' }
DCLCanOnlyConstraintTest >> testCheckOKReference [
	| violations |
	violations := (p3 canOnly reference: p2p5) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLCanOnlyConstraintTest >> testIsFullySpecified [
	| constraint |
	constraint := p2p5 canOnly access: p3.

	self assert: constraint class equals: DCLCanOnlyConstraint.
	self assert: constraint isFullySpecified 
]

{ #category : 'tests' }
DCLCanOnlyConstraintTest >> testIsNotFullySpecified [
	| constraint |
	constraint := p2p5 canOnly.

	self assert: constraint class equals: DCLCanOnlyConstraint.
	self deny: constraint isFullySpecified 
]
