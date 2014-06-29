testing
testWriting
  [ 
  | string |
  string := String
    streamContents: [ :stringStream | 
      | bufferedStream |
      bufferedStream := ZnBufferedWriteStream on: stringStream.
      0 to: 9 do: [ :each | bufferedStream nextPut: (Character digitValue: each) ].
      bufferedStream flush ].
  self assert: string = '0123456789' ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'ZnBufferedWriteStreamTests>>testWriting';
        cr;
        show: ex description;
        cr;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]