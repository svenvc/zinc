accessing
position: anInteger
	| bufferEnd bufferStart |
	bufferEnd := stream position.
	bufferStart := bufferEnd - limit.
	(anInteger between: bufferStart and: bufferEnd)
		ifTrue: [ position := anInteger - bufferStart + 1 ]
		ifFalse: [
			"We reset the buffer and update the position in the underlying stream"
			self discardBuffer.
			stream position: anInteger ]