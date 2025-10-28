Class {
	#name : 'DCLAbstractConstraintTest',
	#superclass : 'DCLAbstractTest',
	#instVars : [
		'p2p5',
		'p3',
		'p13',
		'p14'
	],
	#category : 'DependencyConstraint-Tests',
	#package : 'DependencyConstraint',
	#tag : 'Tests'
}

{ #category : 'initialization' }
DCLAbstractConstraintTest >> setUp [
	super setUp.

	p2p5 := DCLModuleOnMooseName new
		name: 'p2p5' ;
		description: '.*M[12]P[25].*' ;
		model: mooseModel ;
		yourself.
	p3 := DCLModuleOnMooseName new
		name: 'p3' ;
		description: '.*M1P3.*' ;
		model: mooseModel ;
		yourself.
	p13 := DCLModuleOnMooseName new
		name: 'p13' ;
		description: '.*M7P13.*' ;
		model: mooseModel ;
		yourself.
	p14 := DCLModuleOnMooseName new
		name: 'p14' ;
		description: '.*M7P14.*' ;
		model: mooseModel ;
		yourself.

]
