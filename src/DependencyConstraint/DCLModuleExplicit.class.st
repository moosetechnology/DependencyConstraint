"
<<<<<<< HEAD
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
=======
A DCLModule created with an explicit list of member entities
"
Class {
	#name : #DCLModuleExplicit,
	#superclass : #DCLAbstractModule,
	#category : #'DependencyConstraint-Constraints'
}

{ #category : #accessing }
>>>>>>> master
DCLModuleExplicit >> memberEntities: aCollection [
	memberEntities := aCollection
]

<<<<<<< HEAD
{ #category : 'accessing' }
=======
{ #category : #accessing }
>>>>>>> master
DCLModuleExplicit >> privateComputeMembers [
	Error signal: 'You should have given a list of member entities when creating this DCLModuleExplicit'
]
