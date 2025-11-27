Extension { #name : 'MooseAbstractGroup' }

{ #category : '*ArchitecturalConstraints' }
MooseAbstractGroup >> entitiesInDCLModule: aDCLModule [
	^self entities select: [ :each | aDCLModule descriptionMatches: each ]
]
