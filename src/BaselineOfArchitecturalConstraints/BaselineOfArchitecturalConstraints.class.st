Class {
	#name : 'BaselineOfArchitecturalConstraints',
	#superclass : 'Object',
	#category : 'BaselineOfArchitecturalConstraints',
	#package : 'BaselineOfArchitecturalConstraints'
}

{ #category : 'baselines' }
BaselineOfArchitecturalConstraints >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec description: 'Dependency Constraint Language'.
		self defineDependencies: spec.
		self definePackages: spec.
		"self defineGroups: spec."
	]
]

{ #category : 'baselines' }
BaselineOfArchitecturalConstraints >> defineDependencies: spec [

	spec
		baseline: 'Famix'
		with: [ 
			spec
				loads: #( 'Core' 'Minimal' 'Basic' );
				repository: 'github://moosetechnology/Famix:development' ]
]

{ #category : 'baselines' }
BaselineOfArchitecturalConstraints >> definePackages: spec [

	spec
		package: 'ArchitecturalConstraints' with: [ spec requires: #(Famix) ]


]
