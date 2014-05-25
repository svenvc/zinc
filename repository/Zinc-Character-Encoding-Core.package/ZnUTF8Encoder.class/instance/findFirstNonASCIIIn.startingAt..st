private
findFirstNonASCIIIn: string startingAt: offset
  "This calls a fast primitive. Note that string can be a ByteString or ByteA`rray"

  offset > string size
    ifTrue: [ ^ 0 ].
  ^ CharacterCollection
    findFirstByteInString: string
    inSet: ByteASCIISet
    startingAt: offset