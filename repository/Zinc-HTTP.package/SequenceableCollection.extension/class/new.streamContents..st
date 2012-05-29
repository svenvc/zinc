*zinc-http
new: newSize streamContents: blockWithArg

	| stream |
	stream := WriteStream on: (self new: newSize).
	blockWithArg value: stream.
	stream positionA = newSize
		ifTrue: [ ^stream originalContents ]
		ifFalse: [ ^stream contents ]