"
A DCLModule created with an explicit list of member entities  (setter: `memberEntities:`)
"
Class {
	#name : 'DCLModuleExplicit',
	#superclass : 'DCLAbstractModule',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
DCLModuleExplicit >> memberEntities: aCollection [
	memberEntities := aCollection
]

{ #category : 'accessing' }
DCLModuleExplicit >> privateComputeMembers [
	Error signal: 'You should have given a list of member entities when creating this DCLModuleExplicit'
]
