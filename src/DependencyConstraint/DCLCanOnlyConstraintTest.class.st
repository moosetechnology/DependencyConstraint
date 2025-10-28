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

	self flag: 'make it pass for now, but "new" should be part of P3'.
	violations := (p3 canOnly invoke: p2p5) check.
	self assert: violations size equals: 3.

	"  m1p3c5Mtd1 -> M1P3C7FullRefereeInSide.m1p3c7Mtd1
	 * m1p3c5Mtd1 -> M1P3C7FullRefereeInSide.new
	   m1p3c6Mtd1 -> M1P2C3ReferencerInSideRefereeOutSide.m1p2c3Mtd3
	 * m1p3c6Mtd1 -> M1P2C3ReferencerInSideRefereeOutSide.new
	   m1p3c6Mtd2 -> M1P3C5ReferencerInSideRefereeInSide.m1p3c5Mtd1
	 * m1p3c6Mtd2 -> M1P3C5ReferencerInSideRefereeInSide.new
	   m1p3c6Mtd2 -> M2P5C11FullRefereeOutSide.m2p5c11InstCreation1"
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
