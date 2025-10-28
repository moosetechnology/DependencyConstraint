"
A DCLModule where member entities are computed from a regexp
The regexp is stored in the `description` of the module
"
Class {
	#name : 'DCLModuleOnRegexp',
	#superclass : 'DCLAbstractModule',
	#instVars : [
		'description'
	],
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
DCLModuleOnRegexp >> description [

	^ description
]

{ #category : 'accessing' }
DCLModuleOnRegexp >> description: aString [
	description := aString.
	regexp := aString asRegex.
	self resetCaches 
]

{ #category : 'testing' }
DCLModuleOnRegexp >> descriptionMatches: aMooseEntity [

	self subclassResponsibility
]

{ #category : 'testing' }
DCLModuleOnRegexp >> isFullySpecified [
	^super isFullySpecified and:
	[(regexp notNil) and:
	 [(regexp class canUnderstand: #matches:) ] ]
]

{ #category : 'accessing' }
DCLModuleOnRegexp >> privateComputeMembers [
	^model entities select: [ :each | self descriptionMatches: each ]
]
