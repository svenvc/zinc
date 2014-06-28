convenience
readInto: string startingAt: offset count: requestedCount fromStream: stream
  "Read requestedCount decoded characters into string starting at offset,
	returning the number of characters read, there could be less available when stream is 
   atEnd"

  | byteBuffer read chars decoded nullOffset |
  byteBuffer := ByteArray new: requestedCount.
  read := stream readInto: byteBuffer startingAt: 1 count: requestedCount.
  [ decoded := (byteBuffer copyFrom: 1 to: read) decodeFromUTF8 ]
    on: ArgumentError
    do: [ :ignored | 
      | repeat |
      "byteBuffer boundary has fallen on bad UTF8 encoding boundary. read one byte at 
       a time until we can decode the byteBuffer cleanly"
      repeat := true.
      [ repeat ]
        whileTrue: [ 
          | extra |
          extra := stream
            readInto: byteBuffer
            startingAt: byteBuffer size + 1
            count: 1.
          extra == 0
            ifTrue: [ self error: 'incomplete utf-8 encoding' ].
          read := read + extra.
          [ 
          repeat := false.
          decoded := (byteBuffer copyFrom: 1 to: read) decodeFromUTF8 ]
            on: ArgumentError
            do: [ :ignored | repeat := true ] ] ].
  chars := decoded size.
  decoded size < requestedCount
    ifTrue: [ 
      "remaining characters decoded one by one from the stream"
      string
        replaceFrom: offset
        to: offset + decoded size - 1
        with: decoded
        startingAt: 1.
      decoded size to: requestedCount - 1 do: [ :count | 
        stream atEnd
          ifTrue: [ ^ chars ].
        chars := chars + 1.
        string at: count + 1 put: (self nextFromStream: stream) ].
      ^ chars ].
  string
    replaceFrom: offset
    to: offset + decoded size - 1
    with: decoded
    startingAt: 1.
  ^ chars