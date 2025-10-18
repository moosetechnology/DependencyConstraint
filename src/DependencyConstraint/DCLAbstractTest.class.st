Class {
	#name : #DCLAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'mooseModel'
	],
	#category : #'DependencyConstraint-Tests'
}

{ #category : #initialization }
DCLAbstractTest >> setUp [
	mooseModel := FamixStModel new.
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter ;
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
