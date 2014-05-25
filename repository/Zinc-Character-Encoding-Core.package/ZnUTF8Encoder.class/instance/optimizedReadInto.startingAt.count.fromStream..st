private
optimizedReadInto: string startingAt: offset count: requestedCount fromStream: stream
  ^ self
    originalReadInto: string
    startingAt: offset
    count: requestedCount
    fromStream: stream