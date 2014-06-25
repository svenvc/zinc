private
notifyUnreportableError: aString
  "unconditional logging to stdout"

  | stdout |
  stdout := GsFile stdoutServer.
  stdout
    nextPutAll:
      '-----------  Unreportable ERROR Encountered: ' , DateAndTime now printString.
  stdout nextPutAll: aString.
  stdout nextPutAll: '-----------'.
  stdout cr.
  stdout close