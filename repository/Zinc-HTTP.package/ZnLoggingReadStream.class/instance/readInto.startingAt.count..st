accessing
readInto: collection startingAt: offset count: count
	"Read count elements and place them in collection starting at offset.
	Return the number of elements actually read."

	| bytesRead message |
	bytesRead := stream readInto: collection startingAt: offset count: count.
	message := bytesRead isZero
		ifTrue: [ '{1} read 0 bytes' format: { identifier } ]
		ifFalse: [
			String streamContents: [ :out |
				out nextPutAll: identifier; space.
				out nextPutAll: 'read '; print: bytesRead;
				nextPutAll: (bytesRead = 1 ifTrue: [ ' byte: ' ] ifFalse: [ ' bytes: ']).
			offset to: offset + bytesRead - 1 do: [ :index |
				(collection at: index) printOn: out base: 16 length: 2 padded: true ] ] ].
	logger value: message.
	^ bytesRead