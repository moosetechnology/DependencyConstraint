"
A DCLModule where member entities are computed from a regexp on their simple name (not fully qualified)
"
Class {
	#name : 'DCLModuleOnName',
	#superclass : 'DCLModuleOnRegexp',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'testing' }
DCLModuleOnName >> descriptionMatches: aMooseEntity [
	^regexp matches: aMooseEntity name
]
