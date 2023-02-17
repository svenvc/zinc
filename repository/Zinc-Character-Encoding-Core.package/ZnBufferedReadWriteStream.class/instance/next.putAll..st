accessing
next: count putAll: collection

	self writingActionDo: [
		writeStream next: count putAll: collection ]