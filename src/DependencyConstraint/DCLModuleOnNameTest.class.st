Class {
	#name : 'DCLModuleOnNameTest',
	#superclass : 'DCLAbstractTest',
	#category : 'DependencyConstraint-Tests',
	#package : 'DependencyConstraint',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLModuleOnNameTest >> testAsTag [
	| module tag |
	module := DCLModuleOnName new
		name: 'module-full' ;
		description: '.*Full.*' ;
		model: mooseModel ;
		yourself.

	self assert: mooseModel allTags isEmpty.
	self deny: module memberEntities first isTagged.

	tag := module asTag.

	self assert: mooseModel allTags size equals: 1.
	self assert: module memberEntities first isTagged.

]

{ #category : 'tests' }
DCLModuleOnNameTest >> testDescriptionMatches [
	| module |
	module := DCLModuleOnName new
		name: 'p123';
		description: '.*abc.*';
		yourself.
	
	self assert: (module descriptionMatches: (FamixStNamedEntity new name: 'abcdefg' ; yourself)).
	self deny:   (module descriptionMatches: (FamixStNamedEntity new name: 'gfedcba' ; yourself)).
]

{ #category : 'tests' }
DCLModuleOnNameTest >> testIsFullySpecified [
	self deny:   (DCLModuleOnName new name: 'mod'; yourself) isFullySpecified.
	self deny:   (DCLModuleOnName new name: 'mod'; description: '.*abc.*'; yourself) isFullySpecified.
	self assert: (DCLModuleOnName new name: 'mod'; description: '.*abc.*'; model: #() ; yourself) isFullySpecified.
	self assert: (DCLModuleOnName new name: 'mod'; description: '.*abc.*'; model: mooseModel ; yourself) isFullySpecified.

]

{ #category : 'tests' }
DCLModuleOnNameTest >> testMemberEntities [
	| module |
	module := DCLModuleOnName new
		name: 'module-full' ;
		description: '.*Full.*' ;
		model: mooseModel ;
		yourself.
	
	self assert: module memberEntities size equals: 14.
	"M1P2C4FullRefereeInSide
	 M2P6C13FullRefereeInSideOutSide
	 M1P3C7FullRefereeInSide
	 M1P3C8FullReferencerInSide
	 M2P5C11FullRefereeOutSide
	 M7P14C22FullRefereeOutSide
	 M7P13C21FullReferencerOutSide
	 M2P6C12FullReferencerInSide
	 M1P3C6FullReferencerInSideOutSide
	 M1P1C1FullReferencerOutSide
	 Moose-TestResources-KGB-P14FullReferee
	 Moose-TestResources-KGB-P5FullReferee
	 Moose-TestResources-KGB-P1FullReferencer
	 Moose-TestResources-KGB-P13FullReferencer"

]

{ #category : 'tests' }
DCLModuleOnNameTest >> testNoMemberEntities [
	| module |
	module := DCLModuleOnName new
		name: 'module-full' ;
		description: '.*whatever-inexistant.*' ;
		model: mooseModel ;
		yourself.
	
	self assert: module memberEntities isEmpty.

]
