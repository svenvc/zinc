"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load latest GLASS1 from github"
Metacello new
  baseline: 'GLASS1';
  repository: 'github://glassdb/glass:dev/repository';
  onWarning: [:ex |
    Transcript cr; show: ex description.
    ex resume ];
  load.

"Load Zinc ... "
Metacello new
  baseline: 'Zinc';
  repository: 'filetree://', gitPath, '/zinc/repository';
  onWarning: [:ex |
    Transcript cr; show: ex description.
    ex resume ];
  load: #('Tests' 'default').

"Run the Tode tests"
TravisCIHarness
  value: #( 'BaselineOfZinc' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
