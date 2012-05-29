*zinc-http
forkAt: priority named: aName
  "forks the receiver as a new process at the given priority"
  
  | proc |
  proc := self newProcess.
  proc priority: priority.
  ^proc resume
