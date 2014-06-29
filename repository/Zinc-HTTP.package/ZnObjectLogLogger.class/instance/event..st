accessing
event: logEvent
  | category entry label |
  category := logEvent category.
  label := logEvent label.
  entry := category == #'error'
    ifTrue: [ ObjectLogEntry error: logEvent label object: logEvent ]
    ifFalse: [ 
      category == #'debug'
        ifTrue: [ ObjectLogEntry debug: logEvent label object: logEvent ]
        ifFalse: [ ObjectLogEntry info: label object: logEvent ] ].
  entry addToLog