private
readingActionDo: aBlock

	"Reading from the read stream.
	We should
	 - flush the write stream
	 - discard the read buffer (which may contain incorrect data).
	 - and then perform the read."

	lastRead ifFalse: [
		writeStream flush.
		readStream discardBuffer ].
	^ aBlock ensure: [ lastRead := true ]