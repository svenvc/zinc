private
optimizedReadInto: string startingAt: offset count: requestedCount fromStream: stream
  ^ self
    brokenReadInto: string
    startingAt: offset
    count: requestedCount
    fromStream: stream