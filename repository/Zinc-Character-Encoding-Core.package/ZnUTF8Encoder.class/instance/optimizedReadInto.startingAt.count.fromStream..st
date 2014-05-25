private
optimizedReadInto: string startingAt: offset count: requestedCount fromStream: stream
  "Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd.
	Optimized based on the assumption that most decoded characters will be ASCII.
	I signal a ZnByteStringBecameWideString notification if necessary."

  | stringBuffer byteBuffer bytesRead read last next count readStream bytesLeft char |
  stringBuffer := string.	"Start by reading the minimum amount of bytes for decoding requestedCount characters"
  byteBuffer := ByteArray new: requestedCount.
  bytesRead := stream
    readInto: byteBuffer asString
    startingAt: 1
    count: requestedCount.
  readStream := byteBuffer readStream.
  read := 0.
  last := offset.
  next := self findFirstNonASCIIIn: byteBuffer asString startingAt: last.
  (next = 0 or: [ bytesRead < next ])
    ifTrue: [ 
      "The whole input is ASCII"
      self
        replace: stringBuffer
        from: offset
        to: offset + bytesRead - 1
        with: byteBuffer asString
        startingAt: 1.
      ^ bytesRead ].
  [ 
  next > last
    ifTrue: [ 
      "Copy the ASCII run from last to next"
      count := next - last.
      self
        replace: stringBuffer
        from: offset + read
        to: offset + read + count - 1
        with: byteBuffer asString
        startingAt: last.
      read := read + count ].	"Read one UTF-8 encoded non ASCII character"
  readStream position: next - 1.
  count := self encodingLengthFor: readStream peek.
  bytesLeft := bytesRead - next + 1.
  count <= bytesLeft
    ifTrue: [ 
      char := self nextFromStream: readStream.
      (char isOctetCharacter not and: [ stringBuffer isOctetString ])
        ifTrue: [ stringBuffer := ZnByteStringBecameWideString convert: stringBuffer ].
      stringBuffer at: offset + read put: char ]
    ifFalse: [ 
      | tmpBuffer extraRead |
      tmpBuffer := ByteArray new: count.
      readStream readInto: tmpBuffer startingAt: 1 count: bytesLeft.
      extraRead := stream
        readInto: tmpBuffer
        startingAt: bytesLeft + 1
        count: count - bytesLeft.
      extraRead = (count - bytesLeft)
        ifFalse: [ self error: 'incomplete utf-8 encoding' ].
      char := self nextFromStream: tmpBuffer readStream.
      (char isOctetCharacter not
        and: [ (stringBuffer isKindOf: MultiByteString) not ])
        ifTrue: [ stringBuffer := ZnByteStringBecameWideString convert: stringBuffer ].
      stringBuffer at: offset + read put: char ].
  last := next + count.
  read := read + 1.	"Iterate"
  next := self findFirstNonASCIIIn: byteBuffer asString startingAt: last.
  next = 0 or: [ bytesRead < next ] ]
    whileFalse.
  bytesRead < last
    ifFalse: [ 
      "There is a last ASCII run left"
      count := bytesRead - last + 1.
      self
        replace: stringBuffer
        from: offset + read
        to: offset + read + count - 1
        with: byteBuffer asString
        startingAt: last.
      read := read + count ].	"Try consuming enough input to reach requestedCount since we probably read too little"
  count := requestedCount - read.
  ^ read
    +
      (self
        originalReadInto: stringBuffer
        startingAt: offset + read
        count: count
        fromStream: stream)