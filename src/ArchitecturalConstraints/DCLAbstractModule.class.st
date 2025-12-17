"
I represent an architectural module

I have:
- a #name
- a #model -- (a collection of Moose entitites) on which I apply

I can also be converted to a Famix tag in my #model (#asTag)
"
Class {
	#name : 'DCLAbstractModule',
	#superclass : 'Object',
	#instVars : [
		'name',
		'regexp',
		'model',
		'cache',
		'memberEntities'
	],
	#category : 'ArchitecturalConstraints-Modules',
	#package : 'ArchitecturalConstraints',
	#tag : 'Modules'
}

{ #category : 'converting' }
DCLAbstractModule >> asTag [

	| tag |
	self isFullySpecified ifFalse: [ ^ nil ].
	tag := self mooseModel tagNamed: name.
	self memberEntities do: [ :e |
		(e hasTag: tag) ifFalse: [ e tagWith: tag ] ].
	^ tag
]

{ #category : 'DSL' }
DCLAbstractModule >> canOnly [
	^self constraint: DCLCanOnlyConstraint
]

{ #category : 'DSL' }
DCLAbstractModule >> cannot [
	^self constraint: DCLCannotConstraint 
]

{ #category : 'accessing' }
DCLAbstractModule >> constraint: aDCLConstraint [
	^aDCLConstraint  new
		moduleA: self ;
		yourself
]

{ #category : 'accessing' }
DCLAbstractModule >> incomingDependencies: association for: anEntity [
	^cache
		at: { anEntity . #incoming . association }
		ifAbsentPut: [ anEntity queryIncoming: association ]
]

{ #category : 'initialization' }
DCLAbstractModule >> initialize [ 
	super initialize.
	self resetCaches 
]

{ #category : 'testing' }
DCLAbstractModule >> isFullySpecified [
	^self model isCollection
]

{ #category : 'accessing' }
DCLAbstractModule >> memberEntities [

	self isFullySpecified ifFalse: [ ^ MooseSpecializedGroup new ].

	^ memberEntities ifNil: [ memberEntities := self privateComputeMembers ]
]

{ #category : 'accessing' }
DCLAbstractModule >> model [

	^ model
]

{ #category : 'accessing' }
DCLAbstractModule >> model: anObject [

	model := anObject.
	self resetCaches
]

{ #category : 'accessing' }
DCLAbstractModule >> mooseModel [
	"returns the MooseModel containing entities in my #model"
	model isCollection ifFalse: [ ^nil ].
	^model anyOne mooseModel
]

{ #category : 'DSL' }
DCLAbstractModule >> must [
	^self constraint: DCLMustConstraint
]

{ #category : 'accessing' }
DCLAbstractModule >> name [

	^ name
]

{ #category : 'accessing' }
DCLAbstractModule >> name: anObject [

	name := anObject
]

{ #category : 'DSL' }
DCLAbstractModule >> onlyCan [
	^self constraint: DCLOnlyCanConstraint
]

{ #category : 'accessing' }
DCLAbstractModule >> outgoingDependencies: association for: anEntity [
	^cache
		at: { anEntity . #outgoing . association }
		ifAbsentPut: [ anEntity queryOutgoing: association ]
]

{ #category : 'accessing' }
DCLAbstractModule >> privateComputeMembers [
	self subclassResponsibility 
]

{ #category : 'initialization' }
DCLAbstractModule >> resetCaches [
	cache := Dictionary new.
	memberEntities := nil
]
