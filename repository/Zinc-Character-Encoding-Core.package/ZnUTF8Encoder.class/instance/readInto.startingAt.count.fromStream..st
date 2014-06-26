convenience
readInto: string startingAt: offset count: requestedCount fromStream: stream
  "Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd"

  | byteBuffer readCount decoded |
  byteBuffer := ByteArray new: requestedCount.
  readCount := stream readInto: byteBuffer startingAt: 1 count: requestedCount.
  decoded := byteBuffer decodeFromUTF8.
  string
    replaceFrom: offset
    to: offset + decoded size - 1
    with: decoded
    startingAt: 1.
  ^ readCount