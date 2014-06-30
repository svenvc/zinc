private
notifyUnreportableError: aString
  "unconditional logging to stdout"

  | stdout |
  (ObjectLogEntry error: 'Zinc Server unreportable error' object: aString)
    addToLog.
  stdout := GsFile stdoutServer.
  stdout
    nextPutAll:
      '-----------  Unreportable ERROR Encountered: ' , DateAndTime now printString.
  stdout nextPutAll: aString.
  stdout nextPutAll: '-----------'.
  stdout cr.
  stdout close.
  TranscriptProxy proxyTranscript ~~ nil
    ifTrue: [ 
      "interactive session, so bring up a debugger"
      self error: 'Unreportable error' ]