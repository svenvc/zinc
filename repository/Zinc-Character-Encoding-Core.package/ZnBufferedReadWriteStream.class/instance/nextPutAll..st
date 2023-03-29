accessing
nextPutAll: aString

	^ self writingActionDo: [ writeStream nextPutAll: aString ]