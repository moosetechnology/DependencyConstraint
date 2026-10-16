Class {
	#name : 'DCLViolationsTypeTest',
	#superclass : 'DCLAbstractConstraintTest',
	#category : 'ArchitecturalConstraints-Tests',
	#package : 'ArchitecturalConstraints',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLViolationsTypeTest >> testViolatedConditionAreConstraintAsCBCondition [

	| violations constraint cbViolatedConditions |
	
	constraint := p3 cannot invoke: p2p5.
	violations := constraint check.
	
	cbViolatedConditions := violations collect: [ :violation | violation violatedCondition ].

	"m1p3c6Mtd2 -> m2p5c11InstCreation1
	 m1p3c6Mtd1 -> m1p2c3Mtd3"
	self assert: violations size equals: 2.
	self assert: (cbViolatedConditions allSatisfy: [ :cond | cond = constraint asCBCondition ])
]

{ #category : 'tests' }
DCLViolationsTypeTest >> testViolationsAreFamixCBViolation [

	| violations constraint |
	constraint := p3 cannot invoke: p2p5.
	violations := constraint check.

	"m1p3c6Mtd2 -> m2p5c11InstCreation1
	 m1p3c6Mtd1 -> m1p2c3Mtd3"
	self assert: violations size equals: 2.
	self assert: (violations allSatisfy: [ :violation | violation class = FamixCBViolation ]).
	
]
