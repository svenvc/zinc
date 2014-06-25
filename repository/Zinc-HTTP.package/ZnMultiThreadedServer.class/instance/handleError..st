private
handleError: anException
  [ 
  | messageText data |
  "Handle different argument arrangements (probably introduced in 2.3.2)"
  messageText := anException messageText.
  data := messageText isNil
    ifTrue: [ anException description ]
    ifFalse: [ messageText ].
  GsFile
    gciLogServer:
      '------INTERNAL ZINC ERROR: ' , Time now printString , '------'.
  GsFile gciLogServer: anException description.
  GsFile gciLogServer: (GsProcess stackReportToLevel: 100).
  GsFile gciLogServer: '------' ]
    on: Error
    do: [ :e | self notifyUnreportableError: anException description ]