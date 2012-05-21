streaming
readUpToEnd: inputStream limit: limit
	| species bufferSize buffer totalRead |
	bufferSize := limit ifNil: [ 4096 ] ifNotNil: [ 4096 min: limit ].
	species := inputStream isBinary ifTrue: [ ByteArray ] ifFalse: [ String ].
	buffer := species new: bufferSize.
	totalRead := 0.
	^ species streamContents: [ :out |
		[ inputStream atEnd ] whileFalse: [ | readCount |
			readCount := inputStream readInto: buffer startingAt: 1 count: bufferSize.
			(limit notNil and: [ (totalRead := totalRead + readCount) > limit ])
				ifTrue: [ ZnEntityTooLarge signal ].
			out next: readCount putAll: buffer startingAt: 1 ] ]