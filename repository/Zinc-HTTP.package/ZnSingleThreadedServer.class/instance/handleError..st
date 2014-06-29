private
handleError: anException
  [ 
  | messageText data stack |
  "Handle different argument arrangements (probably introduced in 2.3.2)"
  messageText := anException messageText.
  data := messageText isNil
    ifTrue: [ anException description ]
    ifFalse: [ messageText ].
  GsFile
    gciLogServer:
      '------INTERNAL ZINC ERROR: ' , Time now printString , '------'.
  GsFile gciLogServer: anException description.
  GsFile gciLogServer: (stack := GsProcess stackReportToLevel: 100).
  GsFile gciLogServer: '------'.
  (ObjectLogEntry error: 'Zinc Server error: ' , data object: stack) addToLog ]
    on: Error
    do: [ :e | self notifyUnreportableError: anException description ].
  TranscriptProxy proxyTranscript
    ifNotNil: [ 
      "interactive session, so bring up a debugger"
      anException pass ]