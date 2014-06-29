logging
logServerError: exception
  (self logServerErrorDetails and: [ self log enabled ])
    ifTrue: [ 
      "for GemStone, we are typically logging to an object log, so we don't have 
       to conform to classical `log format`"
      self log
        error: 'ERROR: ' , exception description
        message: (GsProcess stackReportToLevel: 100) ]
    ifFalse: [ self handleError: exception ]