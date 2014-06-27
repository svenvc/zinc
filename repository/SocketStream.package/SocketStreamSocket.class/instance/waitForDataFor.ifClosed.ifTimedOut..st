as yet unclassified
waitForDataFor: timeout ifClosed: closedBlock ifTimedOut: timedOutBlock
  "Wait for the given nr of seconds for data to arrive."

  | startTime msecsDelta |
  startTime := Time millisecondClockValue.
  msecsDelta := (timeout * 1000) truncated.
  [ (Time millisecondsSince: startTime) < msecsDelta ]
    whileTrue: [ 
      self readyForRead
        ifTrue: [ ^ self ].
      self isConnected
        ifFalse: [ ^ closedBlock value ].
      self
        waitForNonBlockingReadActivityUpToMs:
          (msecsDelta - (Time millisecondsSince: startTime) max: 0) ].
  self readyForRead
    ifFalse: [ 
      self isConnected
        ifTrue: [ ^ timedOutBlock value ]
        ifFalse: [ ^ closedBlock value ] ]