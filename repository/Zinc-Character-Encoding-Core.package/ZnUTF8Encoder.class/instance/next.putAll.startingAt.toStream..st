convenience
next: count putAll: string startingAt: offset toStream: stream
  "Write count bytes from string starting at offset to stream."

  stream nextPutAll: string encodeAsUTF8