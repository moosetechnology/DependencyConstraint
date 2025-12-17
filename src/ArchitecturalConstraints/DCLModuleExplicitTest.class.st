Class {
	#name : 'DCLModuleExplicitTest',
	#superclass : 'DCLAbstractTest',
	#category : 'ArchitecturalConstraints-Tests',
	#package : 'ArchitecturalConstraints',
	#tag : 'Tests'
}

{ #category : 'tests' }
DCLModuleExplicitTest >> testAsTag [
	| module tag |
	module := DCLModuleExplicit new
		name: 'module-full' ;
		memberEntities: mooseModel allModelClasses  ;
		model: mooseModel ;
		yourself.

	self assert: mooseModel allTags isEmpty.
	self deny: module memberEntities first isTagged.

	tag := module asTag.

	self assert: mooseModel allTags size equals: 1.
	self assert: module memberEntities first isTagged.

]

{ #category : 'tests' }
DCLModuleExplicitTest >> testIsFullySpecified [
	self deny:   (DCLModuleExplicit new name: 'mod'; yourself)
		isFullySpecified.
	self assert:   (DCLModuleExplicit new name: 'mod'; memberEntities: mooseModel allModelClasses; yourself)
		isFullySpecified.

]

{ #category : 'tests' }
DCLModuleExplicitTest >> testMemberEntities [
	| module |
	module := DCLModuleExplicit new
		name: 'module-full' ;
		memberEntities: mooseModel allModelClasses ;
		model: mooseModel ;
		yourself.
	
	self assert: module memberEntities size equals: 11

]

{ #category : 'tests' }
DCLModuleExplicitTest >> testMemberGetModel [
	| module |
	module := DCLModuleExplicit new
		memberEntities: mooseModel allModelClasses ;
		yourself.
	
	self assert: module model equals: mooseModel

]

{ #category : 'tests' }
DCLModuleExplicitTest >> testNoMemberEntities [
	| module |
	module := DCLModuleExplicit new
		name: 'module-full' ;
		memberEntities: #() ;
		model: mooseModel ;
		yourself.
	
	self assert: module memberEntities isEmpty.

]
