accessing
error: errorDescription
  self enabled
    ifTrue: [ self announcer announce: (ZnLogEvent error: errorDescription value) ]