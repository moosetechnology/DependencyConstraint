Class {
	#name : 'DCLViolationsTypeTest',
	#superclass : 'DCLAbstractConstraintTest',
	#category : 'ArchitecturalConstraints-Tests',
	#package : 'ArchitecturalConstraints',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLViolationsTypeTest >> runInCriticTree: aConstraint [

	| root |
	root := FamixCBRootContext new
		        contextFilter: [ :c | c ];
		        yourself.
	root addChild: aConstraint.
	root runDownTree: mooseModel entities withCallback: [ ].

	^ aConstraint violations
]

{ #category : 'tests' }
DCLViolationsTypeTest >> testConstraintViolationSeverity [

	| constraint |
	constraint := p3 cannot invoke: p2p5.

	self assert: constraint severity equals: FamixCBErrorSeverity
]

{ #category : 'tests' }
DCLViolationsTypeTest >> testRunInCriticTreeEqualsCheck [

	| constraint |
	constraint := p3 cannot invoke: p2p5.

	self assert: (self runInCriticTree: constraint) size equals: constraint check size
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
