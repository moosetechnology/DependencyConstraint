"
A DCLModule where member entities are computed from a regexp on their name (the `description` of the module)
"
Class {
	#name : 'DCLModuleOnName',
	#superclass : 'DCLAbstractModule',
	#instVars : [
		'description'
	],
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
DCLModuleOnName >> description [

	^ description
]

{ #category : 'accessing' }
DCLModuleOnName >> description: aString [
	description := aString.
	regexp := aString asRegex.
	self resetCaches 
]

{ #category : 'testing' }
DCLModuleOnName >> descriptionMatches: aMooseEntity [
	^regexp matches: aMooseEntity name
]

{ #category : 'testing' }
DCLModuleOnName >> isFullySpecified [
	^super isFullySpecified and:
	[(regexp notNil) and:
	 [(regexp class canUnderstand: #matches:) ] ]
]

{ #category : 'accessing' }
DCLModuleOnName >> privateComputeMembers [
	^model entities select: [ :each | self descriptionMatches: each ]
]
