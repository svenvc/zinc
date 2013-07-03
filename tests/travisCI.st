"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load Tode ... "
Metacello new
	baseline: 'BaselineOfZincHTTPComponents';
  repository: 'filetree://', gitPath, '/zinc/repository';
  load: #('Tests' 'Core').

"Run the Tode tests"
TravisCIHarness
  value: #( 'BaselineOfZincHTTPComponents' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
