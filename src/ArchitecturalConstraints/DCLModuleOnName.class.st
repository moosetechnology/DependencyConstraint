"
A DCLModule where member entities are computed from a regexp on their simple name (not fully qualified)
"
Class {
	#name : 'DCLModuleOnName',
	#superclass : 'DCLModuleOnRegexp',
	#category : 'ArchitecturalConstraints-Modules',
	#package : 'ArchitecturalConstraints',
	#tag : 'Modules'
}

{ #category : 'testing' }
DCLModuleOnName >> descriptionMatches: aMooseEntity [
	^regexp matches: aMooseEntity name
]
