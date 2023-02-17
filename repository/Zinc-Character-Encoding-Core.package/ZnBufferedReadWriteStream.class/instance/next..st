accessing
next: anInteger

	^ self readingActionDo: [
		readStream next: anInteger ]