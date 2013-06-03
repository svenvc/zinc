"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load Tode ... "
Metacello new
	baseline: 'Zinc';
  repository: 'filetree://', gitPath, '/zinc/repository';
  load: #('Tests' 'default').

"Run the Tode tests"
TravisCIHarness
  value: #( 'BaselineOfZinc' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
