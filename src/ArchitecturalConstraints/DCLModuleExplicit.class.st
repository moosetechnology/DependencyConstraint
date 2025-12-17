"
A DCLModule created with an explicit list of member entities  (setter: `memberEntities:`)
"
Class {
	#name : 'DCLModuleExplicit',
	#superclass : 'DCLAbstractModule',
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'testing' }
DCLModuleExplicit >> isFullySpecified [
	^memberEntities isCollection
]

{ #category : 'accessing' }
DCLModuleExplicit >> memberEntities: aCollection [
	memberEntities := aCollection
]

{ #category : 'accessing' }
DCLModuleExplicit >> model [

	^ model ifNil: [
		self model: (self memberEntities anyOne mooseModel).
		self model
	]
]

{ #category : 'accessing' }
DCLModuleExplicit >> privateComputeMembers [
	Error signal: 'You should have given a list of member entities when creating this DCLModuleExplicit'
]

{ #category : 'initialization' }
DCLModuleExplicit >> resetCaches [
	"do not wipe out #memberentities of explicit module"

	cache := Dictionary new
]
