"
I represent an architectural rule between two architectural modules (DCLModule).

Rule can be verified by #check that will return a list of violations if any

dependencies between modules can be:
- #access:
- #invoke:
- #reference:
- #inherit:
- #depend: (any dependency)
- #association:to: (specified with a Famix dependency)
"
Class {
	#name : 'DCLAbstractConstraint',
	#superclass : 'Object',
	#instVars : [
		'moduleB',
		'moduleA',
		'violations',
		'associations',
		'description'
	],
	#category : 'ArchitecturalConstraints-Constraints',
	#package : 'ArchitecturalConstraints',
	#tag : 'Constraints'
}

{ #category : 'DSL' }
DCLAbstractConstraint >> access: aDCLModule [

	self metaAssociation: FamixTAccess opposite: aDCLModule
]

{ #category : 'checking' }
DCLAbstractConstraint >> allAssociationsOn: anEntity forFMProperties: fmProperties [
	"For each fmProperty finds associations from (or to) anEntity.
	 - first checks that the entity can have this type of relation
	 - then call the accessor fot that property on anEntity"

	^fmProperties
		flatCollect: [ :aFmProperty |
			(anEntity usesFamixTrait: aFmProperty type implementingClass)
				ifTrue: [ self allAssociationsOn: anEntity forFMProperty: aFmProperty ]
				ifFalse: [ #() ]
		].
]

{ #category : 'checking' }
DCLAbstractConstraint >> allAssociationsOn: anEntity forFMProperty: aFmProperty [
	"Finds associations from/to anEntity by calling the accessor ('aFmProperty opposite name')
	 for that property on anEntity"

	| assoc |
	assoc := anEntity perform: aFmProperty opposite name.
	^assoc
		ifNil: [ #() ]
		ifNotNil: [ assoc isCollection
			ifTrue: [ assoc ]
			ifFalse: [ { assoc } ]
		]
]

{ #category : 'DSL' }
DCLAbstractConstraint >> associationClassesFor: aFamixTrait [
	"returns the concrete classes of ModuleA's metamodel that can implement aFamixTrait"

	^moduleA model metamodel concreteImplementingClasses select: [ :c |
		  c usesFamixTrait: aFamixTrait ]
]

{ #category : 'accessing' }
DCLAbstractConstraint >> associations [

	^ associations
]

{ #category : 'accessing' }
DCLAbstractConstraint >> associations: anObject [

	associations := anObject
]

{ #category : 'checking' }
DCLAbstractConstraint >> check [

	| fmProperties |

	fmProperties := self fmProperties.
	violations removeAll.

	self moduleToCheck memberEntities do: [ :entity |
		(self allAssociationsOn: entity forFMProperties: fmProperties)
			do: [ :entityAssociation |
				(self isViolation: entityAssociation)
					ifTrue: [
						violations add: ((DCLViolation for: entityAssociation)
							constraint: self) ]
		]
	].

	^ violations
]

{ #category : 'DSL' }
DCLAbstractConstraint >> depend: aDCLModule [

	self metaAssociation: FamixTAssociation opposite: aDCLModule
]

{ #category : 'accessing' }
DCLAbstractConstraint >> description [

	^description ifNil: [ 'An undescribed architectural constraint' ]
]

{ #category : 'accessing' }
DCLAbstractConstraint >> description: aString [

	description := aString 
]

{ #category : 'checking' }
DCLAbstractConstraint >> fmProperties [
	"must return the fmProperties associated with all the #associations of this constraint
	 The choice is between the #source or #target properties of these associations"

	self subclassResponsibility 
]

{ #category : 'DSL' }
DCLAbstractConstraint >> inherit: aDCLModule [

	self metaAssociation: FamixTInheritance opposite: aDCLModule
]

{ #category : 'initialization' }
DCLAbstractConstraint >> initialize [ 

	super initialize.

	violations := OrderedCollection new.
	MiApplication current registerProducer: self for: DCLViolation.
]

{ #category : 'DSL' }
DCLAbstractConstraint >> invoke: aDCLModule [

	self metaAssociation: FamixTInvocation opposite: aDCLModule
]

{ #category : 'testing' }
DCLAbstractConstraint >> isFullySpecified [ 
| a |
a isNil.
	^ (moduleA notNil) and:
		[ moduleA isFullySpecified and: 
		[ moduleB isNotNil and:
		[ moduleB isFullySpecified and:
		[ associations notNil ] ] ] ].

]

{ #category : 'checking' }
DCLAbstractConstraint >> isViolation: entityAssociation [

	self subclassResponsibility 
]

{ #category : 'DSL' }
DCLAbstractConstraint >> metaAssociation: aFamixTrait opposite: aDCLModule [

	associations := self associationClassesFor: aFamixTrait.
	moduleB := aDCLModule
]

{ #category : 'accessing' }
DCLAbstractConstraint >> moduleA [

	^ moduleA
]

{ #category : 'accessing' }
DCLAbstractConstraint >> moduleA: anObject [

	moduleA := anObject.

]

{ #category : 'accessing' }
DCLAbstractConstraint >> moduleB [

	^ moduleB
]

{ #category : 'accessing' }
DCLAbstractConstraint >> moduleB: anObject [

	moduleB := anObject
]

{ #category : 'checking' }
DCLAbstractConstraint >> moduleToCheck [

	self subclassResponsibility 
]

{ #category : 'accessing' }
DCLAbstractConstraint >> mooseModel [

	^moduleA mooseModel
]

{ #category : 'DSL' }
DCLAbstractConstraint >> reference: aDCLModule [

	self metaAssociation: FamixTReference opposite: aDCLModule
]

{ #category : 'checking' }
DCLAbstractConstraint >> result: result belongsTo: module [

	^result isCollection
		ifTrue: [ result anySatisfy: [ :entity | self result: entity belongsTo: module ] ]
		ifFalse: [ module memberEntities includes: result ]
]

{ #category : 'accessing' }
DCLAbstractConstraint >> sourceFmProperties [
	"collects all fmProperties that are source of any of the #associtions"

	^associations collect: [ :asso |
		(moduleA model metamodel fmTypeOf: asso) allProperties detect: #isSource
	].
]

{ #category : 'accessing' }
DCLAbstractConstraint >> targetFmProperties [
	"collects all fmProperties that are target of any of the #associations"

	^ associations collect: [ :asso |
		  (moduleA model metamodel fmTypeOf: asso) allProperties detect: #isTarget ]
]

{ #category : 'accessing' }
DCLAbstractConstraint >> violations [
	^violations
]
