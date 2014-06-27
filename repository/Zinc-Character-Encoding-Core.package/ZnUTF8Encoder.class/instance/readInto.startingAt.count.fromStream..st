convenience
readInto: string startingAt: offset count: requestedCount fromStream: stream
  "Read requestedCount decoded characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd"

  | byteBuffer readCount decoded |
  true
    ifTrue: [ 
      "https://github.com/glassdb/zinc/issues/51"
      ^ super
        readInto: string
        startingAt: offset
        count: requestedCount
        fromStream: stream ].
  byteBuffer := ByteArray new: requestedCount.
  readCount := stream readInto: byteBuffer startingAt: 1 count: requestedCount.
  [ decoded := byteBuffer decodeFromUTF8 ]
    on: Error
    do: [ 
      ^ super
        readInto: string
        startingAt: offset
        count: requestedCount
        fromStream: stream ].
  decoded size < requestedCount
    ifTrue: [ 
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