streaming
streamFrom: inputStream to: outputStream
	| buffer totalRead |
	buffer := (inputStream isBinary ifTrue: [ ByteArray ] ifFalse: [ String ]) new: 16384.
	totalRead := 0.
	[ inputStream atEnd ]
		whileFalse: [ | readCount |
			readCount := inputStream readInto: buffer startingAt: 1 count: buffer size.
			readCount > 0
				ifTrue: [
					totalRead := totalRead + readCount.
					outputStream next: readCount putAll: buffer startingAt: 1 ].
			inputStream atEnd
				ifFalse: [
					ZnSignalProgress enabled
						ifTrue: [ 
							HTTPProgress new 
								signal: ('Tranferred {0} bytes ...' format: { totalRead asBytesDescription }) ]. 
					outputStream flush ] ]