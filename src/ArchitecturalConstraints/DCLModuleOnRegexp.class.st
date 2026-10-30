"
A DCLModule where member entities are computed from a regexp
The regexp is stored in the `description` of the module

Use `exclude:` with a second regular expression to remove the entities it matches from the module.
"
Class {
	#name : 'DCLModuleOnRegexp',
	#superclass : 'DCLAbstractModule',
	#instVars : [
		'description',
		'regexp',
		'exclude',
		'excludeRegexp'
	],
	#category : 'ArchitecturalConstraints-Modules',
	#package : 'ArchitecturalConstraints',
	#tag : 'Modules'
}

{ #category : 'accessing' }
DCLModuleOnRegexp >> description [

	^ description
]

{ #category : 'accessing' }
DCLModuleOnRegexp >> description: aString [
	description := aString.
	regexp := aString asRegex.
	self resetCaches 
]

{ #category : 'testing' }
DCLModuleOnRegexp >> descriptionMatches: aMooseEntity [

	| string |
	string := self matchedStringOf: aMooseEntity.
	^ (regexp matches: string) and: [ (self isExcluded: string) not ]
]

{ #category : 'accessing' }
DCLModuleOnRegexp >> exclude [

	^ exclude
]

{ #category : 'testing' }
DCLModuleOnRegexp >> exclude: aString [

	exclude := aString.
	excludeRegexp := aString ifNotNil: [ aString asRegex ].
	self resetCaches 
]

{ #category : 'testing' }
DCLModuleOnRegexp >> isExcluded: aString [

	^ excludeRegexp notNil and: [ excludeRegexp matches: aString ]
]

{ #category : 'testing' }
DCLModuleOnRegexp >> isFullySpecified [
	^super isFullySpecified and:
	[(regexp notNil) and:
	 [(regexp class canUnderstand: #matches:) ] ]
]

{ #category : 'testing' }
DCLModuleOnRegexp >> matchedStringOf: anEntity [

	self subclassResponsibility
]

{ #category : 'accessing' }
DCLModuleOnRegexp >> privateComputeMembers [
	^model entities select: [ :each | self descriptionMatches: each ]
]
