writing
writeToTranscript
	"Write the receiver on the Transcript like when sent or received over the network.
	Useful for debugging, obviously"

	self
		trace: (String streamContents: [ :stream | self writeOn: stream ])