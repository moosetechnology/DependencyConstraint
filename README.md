# DependencyConstraint
DCL is a language to define dependency constraints between software entities.
It is intended to define and check architectural constraints.

It is inspired by: Valente, Terra, "[A dependency constraint language to manage object-oriented software architectures](https://homepages.dcc.ufmg.br/~mtov/pub/2009_spe.pdf)", *Software Practice and Experience,* 39(12), 1073-1094, August 2009

## Using

### Create "Modules"

```Smalltalk
gui := DCLModule new
  name: 'gui' ;
  description: '.*\.gui'; "match entities with name ending in '.gui'"
  model: <a-moose-model> ;
  yourself.
draw := DCLModule new
  name: 'draw' ;
  description: '.*\.draw'; "match entities with name ending in '.draw'"
  model: <a-moose-model> ;
  yourself.
```

One can get the members of a module with the getter: `memberEntities`.
This list is cached, in case of errors, the cache can be reseted (to force recomputing the member list) with `resetCache`.

### Define constraints

```Smalltalk
constraint := gui canOnly depend: draw.
```
### Check constraints

```Smalltalk
violations := constraint check.
```
This returns the list of dependencies that violate the constraint.

## Dependency Constraint Language

Possible "modules" are:
- `DCLModuleExplicit` -- A DCLModule created with an explicit list of member entities  (with setter: `memberEntities:`)
- `DCLModuleOnName` -- A DCLModule where member entities are computed from a regexp on their name (setter: `description:`)
- `DCLModuleOnMooseName` -- A DCLModuleOnName where member entities are computed from a regexp on their fully qualified name (aka mooseName)
- `DCLModuleOnPackageName` -- A DCLModuleOnName where member entities are computed from a regexp on the name of their parent packages

Possible constraints are:
- `moduleA cannot <a-dependence> moduleB` -- moduleA cannot depend on moduleB
- `moduleA must <a-dependence> moduleB` -- moduleA must have dependence(s) on moduleB
- `moduleA canOnly <a-dependence> moduleB` -- moduleA can only depend on moduleB (apart from self dependencies in moduleA)
- `moduleA onlyCan <a-dependence> moduleB` -- moduleA only, can depend on moduleB (apart from self dependencies in moduleB)

Possible dependencies are:
- `dependence:` -- looks for any dependency (`FamixTAssociation`) from a memberEntity in moduleA to a memberEntity in moduleB
- `access:` -- looks for accesses in moduleA to variables (attributes, parameters,...) of moduleB (`FamixTAccesse`)
- `invoke:` -- looks for invocations from moduleA methods to methods in moduleB (`FamixTInvocation`)
- `reference:` -- looks for references in moduleA to class name of moduleB (`FamixTReference`)
- `inherit:` -- looks for sub-classes in moduleA inheriting from super-classes in moduleB (`FamixTInheritance`)
