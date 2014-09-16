"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeMetacello.

GsDeployer deploy: [
  "Load Zinc ... "
  Metacello new
    baseline: 'ZincHTTPComponents';
    repository: 'filetree://', gitPath, '/zinc/repository';
    load: #('Tests' 'default')
].

"Run the Tode tests"
TravisCIHarness
  value: #( 'BaselineOfZincHTTPComponents' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
