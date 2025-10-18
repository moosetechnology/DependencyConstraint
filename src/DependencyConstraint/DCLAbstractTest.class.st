Class {
	#name : 'DCLAbstractTest',
	#superclass : 'TestCase',
	#instVars : [
		'mooseModel'
	],
	#category : 'DependencyConstraint-Tests',
	#package : 'DependencyConstraint',
	#tag : 'Tests'
}

{ #category : 'running' }
DCLAbstractTest >> setUp [
	| importer |
	super setUp.

	mooseModel := FamixStModel new.

	importer := FamixStPharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer
		model: mooseModel ;
		addFromPackageNamed: #'Moose-TestResources-KGB-P1FullReferencer' ;
		addFromPackageNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee' ;
		addFromPackageNamed: #'Moose-TestResources-KGB-P3InteractedReferencer' ;
		addFromPackageNamed: #'Moose-TestResources-KGB-P5FullReferee' ;
		addFromPackageNamed: #'Moose-TestResources-KGB-P13FullReferencer' ;
		addFromPackageNamed: #'Moose-TestResources-KGB-P14FullReferee' ;
		run
		
	"P1 references P2, P5, P6
	 P2 references P5
	 P3 references P2, P5
	 P4 references no one
	 P5 references no one
	 P6 references no one"
]
