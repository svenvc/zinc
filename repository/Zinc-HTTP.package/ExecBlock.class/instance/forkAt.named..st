as yet unclassified
forkAt: priority named: aName
  "forks the receiver as a new process at the given priority"
  "aName is ignored"
  | proc |
  proc := GsProcess _forkBlock: self with: #() env: 0 .
  proc priority: priority .
  ^ proc 
