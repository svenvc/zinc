private
withServerDo: block
  | server |
  server := ZnServer on: self port.
  TranscriptProxy proxyTranscript
    ifNil: [ 
      "non-interactive tests, log to Transcript ... gem log"
      server logToTranscript ]
    ifNotNil: [ 
      "interactive tests, log to Object Log ... 
       avoid network delay associated with each Transcript show:"
      server logToObjectLog ].
  ^ server