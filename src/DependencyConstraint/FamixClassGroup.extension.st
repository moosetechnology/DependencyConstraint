Extension { #name : #FamixClassGroup }

{ #category : #'*DependencyConstraint' }
FamixClassGroup >> queryOutgoingDependencies: aClassGroup byType: aFAMIXAssociationClass [

	"queries all dependencies to a class group that has a given type"

	^ self allClasses flatCollect: [ :class | 
		  (class queryOutgoing: aFAMIXAssociationClass) select: [ 
			  :dependency | 
			  dependency target asCollection anySatisfy: [ :to | 
				  aClassGroup includes: to typeScope ] ] ]
]
