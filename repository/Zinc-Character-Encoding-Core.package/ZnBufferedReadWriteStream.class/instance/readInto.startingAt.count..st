accessing
readInto: collection startingAt: offset count: requestedCount

	^ self readingActionDo: [
		readStream readInto: collection startingAt: offset count: requestedCount ]