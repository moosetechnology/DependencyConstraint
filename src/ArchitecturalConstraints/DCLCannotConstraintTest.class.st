Class {
	#name : 'DCLCannotConstraintTest',
	#superclass : 'DCLAbstractConstraintTest',
	#category : 'ArchitecturalConstraints-Tests',
	#package : 'ArchitecturalConstraints',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLCannotConstraintTest >> testCheckNotOKDepend [
	| violations |
	violations := (p3 cannot depend: p2p5) check.
	self assert: violations size equals: 4.
	"m1p3c6Mtd2 -> M2P5C11FullRefereeOutSide
	 m1p3c6Mtd2 -> m2p5c11InstCreation1
	 m1p3c6Mtd1 -> M1P2C3ReferencerInSideRefereeOutSide
	 m1p3c6Mtd1 -> m1p2c3Mtd3"
]

{ #category : 'tests' }
DCLCannotConstraintTest >> testCheckNotOKInvoke [
	| violations |
	violations := (p3 cannot invoke: p2p5) check.
	self assert: violations size equals: 2.
	"m1p3c6Mtd2 -> m2p5c11InstCreation1
	 m1p3c6Mtd1 -> m1p2c3Mtd3"
]

{ #category : 'tests' }
DCLCannotConstraintTest >> testCheckOKDepend [
	| violations |
	violations := (p2p5 cannot depend: p3) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLCannotConstraintTest >> testCheckOKInvoke [
	| violations |
	violations := (p2p5 cannot invoke: p3) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLCannotConstraintTest >> testCheckOKReference [
	| violations |
	violations := (p2p5 cannot reference: p3) check.
	self assert: violations isEmpty
]

{ #category : 'tests' }
DCLCannotConstraintTest >> testIsFullySpecified [
	| constraint |
	constraint := p2p5 cannot access: p3.

	self assert: constraint class equals: DCLCannotConstraint.
	self assert: constraint isFullySpecified 
]

{ #category : 'tests' }
DCLCannotConstraintTest >> testIsNotFullySpecified [
	| constraint |
	constraint := p2p5 cannot.

	self assert: constraint class equals: DCLCannotConstraint.
	self deny: constraint isFullySpecified 
]
