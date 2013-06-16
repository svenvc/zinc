private
readUpToEndFrom: stream
	| newString limit bufferSize index |
	limit := ZnConstants maximumEntitySize.
	self initializeEncoder.
	bufferSize := ZnUtils streamingBufferSize.
	index := 0.
	newString := String streamContents: [ :stringStream |
		[ [ stream atEnd or: [ stream peek isNil ] ] whileFalse: [
			stringStream nextPut: (encoder nextFromStream: stream).
			(index := index + 1) < limit ifFalse: [ ZnEntityTooLarge signal ].
			(index \\ bufferSize) = 0 ifTrue: [ ZnUtils signalProgress: index total: nil ] ] ] 
				on: ConnectionClosed 
				do: [ :exception | exception return ] ].
	self string: newString