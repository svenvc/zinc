convenience
readInto: string startingAt: offset count: requestedCount fromStream: stream
  "Read requestedCount decoded characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd"

  | byteBuffer readCount decoded |
  byteBuffer := ByteArray new: requestedCount.
  readCount := stream readInto: byteBuffer startingAt: 1 count: requestedCount.
  [ decoded := byteBuffer decodeFromUTF8 ]
    on: ArgumentError
    do: [ :ignored | 
      | extra repeat |
      "byteBuffer boundary has fallen on bad UTF8 encoding boundary. read one byte at 
       a time until we can decode the byteBuffer cleanly"
      repeat := true.
      [ repeat ]
        whileTrue: [ 
          extra := stream readInto: byteBuffer startingAt: byteBuffer size + 1 count: 1.
          readCount := readCount + 1.
          [ 
          repeat := false.
          decoded := byteBuffer decodeFromUTF8 ]
            on: ArgumentError
            do: [ :ignored | repeat := true ] ] ].
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
          ifTrue: [ ^ count ].
        string at: count + 1 put: (self nextFromStream: stream) ].
      ^ requestedCount ].
  string
    replaceFrom: offset
    to: offset + decoded size - 1
    with: decoded
    startingAt: 1.
  ^ readCount