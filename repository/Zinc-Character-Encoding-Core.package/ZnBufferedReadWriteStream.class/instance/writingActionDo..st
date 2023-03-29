accessing
writingActionDo: aBlock

	"Writing to the write stream.
	We should
	 - write the write stream
	 - discard the read buffer (which may contain incorrect data)"
	lastRead ifTrue: [
		writeStream discardBuffer ].
	readStream discardBuffer.
	^ aBlock ensure: [ lastRead := false ]