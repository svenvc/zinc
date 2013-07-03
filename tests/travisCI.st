"Load and run tests to be performed by TravisCI"
| gitCache gitPath |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

"Load Zinc... "
Metacello new
	baseline: 'ZincHTTPComponents';
  repository: 'filetree://', gitPath, '/zinc/repository';
  load: #('Tests' 'Core').

"Run the Zinc tests"
TravisCIHarness
  value: #( 'BaselineOfZincHTTPComponents' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
