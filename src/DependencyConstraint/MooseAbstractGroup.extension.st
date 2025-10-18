Extension { #name : #MooseAbstractGroup }

{ #category : #'*DependencyConstraint' }
MooseAbstractGroup >> entitiesInDCLModule: aDCLModule [
	^self entities select: [ :each | aDCLModule descriptionMatches: each ]
]
