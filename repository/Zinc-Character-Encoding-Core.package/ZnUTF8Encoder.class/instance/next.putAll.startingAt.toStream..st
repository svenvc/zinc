convenience
next: count putAll: string startingAt: offset toStream: stream
  "Write count encoded bytes from string starting at offset to stream."

  | bytes str |
  str := string copyFrom: offset to: offset + count - 1.
  bytes := str encodeAsUTF8.
  stream nextPutAll: bytes