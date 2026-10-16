Class {
	#name : 'DCLQueryHandler',
	#superclass : 'FamixCBQueryHandler',
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'running' }
DCLQueryHandler >> asRuleEditorString [

	^ innerQuery description
]

{ #category : 'running' }
DCLQueryHandler >> convertToSTONString [

	^ innerQuery description printString
]

{ #category : 'running' }
DCLQueryHandler >> runOnCollection: aCollection [
	"the innerQuery is a DCLConstraint"
	^ innerQuery violatingAssociations
]
