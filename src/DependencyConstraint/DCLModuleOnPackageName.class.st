"
A DCLModule where member entities are computed from a regexp on the name of their parent packages
"
Class {
	#name : 'DCLModuleOnPackageName',
	#superclass : 'DCLModuleOnName',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
DCLModuleOnPackageName >> privateComputeMembers [
	^model allPackages select: [ :pckg | self descriptionMatches: pckg ]
]
