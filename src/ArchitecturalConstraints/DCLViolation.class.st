Class {
	#name : 'DCLViolation',
	#superclass : 'Object',
	#instVars : [
		'association',
		'constraint'
	],
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'instance creation' }
DCLViolation class >> for: anAssociation [

	^self new
		for: anAssociation
]

{ #category : 'accessing' }
DCLViolation >> constraint [

	^constraint
]

{ #category : 'accessing' }
DCLViolation >> constraint: aDCLConstraint [

	constraint := aDCLConstraint 
]

{ #category : 'instance creation' }
DCLViolation >> for: anAssociation [

	association := anAssociation 
]

{ #category : 'accessing' }
DCLViolation >> mooseModel [

	^self constraint mooseModel
]

{ #category : 'accessing' }
DCLViolation >> sourceFile [

	^association sourceAnchor fileReference fullName
]
