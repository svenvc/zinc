private
logRunCase
  | msg |
  msg := '---> ' , self printString.
  TranscriptProxy proxyTranscript
    ifNil: [ 
      "non-interactive tests, log to Transcript ... gem log"
      Transcript
        cr;
        show: msg ]
    ifNotNil: [ 
      "interactive tests, log to Object Log ... 
       avoid network delay associated with each Transcript show:"
      (ObjectLogEntry trace: msg) addToLog ]