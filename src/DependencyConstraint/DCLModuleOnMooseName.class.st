"
A DCLModule where member entities are computed from a regexp on their mooseName
"
Class {
<<<<<<< HEAD
	#name : 'DCLModuleOnMooseName',
	#superclass : 'DCLModuleOnName',
	#category : 'DependencyConstraint-Constraints',
	#package : 'DependencyConstraint',
	#tag : 'Constraints'
}

{ #category : 'testing' }
=======
	#name : #DCLModuleOnMooseName,
	#superclass : #DCLModuleOnName,
	#category : #'DependencyConstraint-Constraints'
}

{ #category : #testing }
>>>>>>> master
DCLModuleOnMooseName >> descriptionMatches: aMooseEntity [
	^regexp matches: aMooseEntity mooseName
]
