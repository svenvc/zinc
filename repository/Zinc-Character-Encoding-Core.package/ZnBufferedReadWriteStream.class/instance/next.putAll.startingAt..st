accessing
next: count putAll: collection startingAt: offset

	self writingActionDo: [
		writeStream next: count putAll: collection startingAt: offset ]