"
A DCLModule where member entities are computed from a regexp on their mooseName
"
Class {
	#name : 'DCLModuleOnMooseName',
	#superclass : 'DCLModuleOnRegexp',
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'testing' }
DCLModuleOnMooseName >> descriptionMatches: aMooseEntity [
	^regexp matches: aMooseEntity mooseName
]
