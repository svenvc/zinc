private
readUpToEndFrom: stream
	| newString limit |
	limit := ZnConstants maximumEntitySize.
	self initializeEncoder.
	newString := String streamContents: [ :stringStream |
		[ [ stream atEnd or: [ stream peek isNil ] ] whileFalse: [
			stringStream nextPut: (encoder nextFromStream: stream).
			(limit := limit - 1) < 0 ifTrue: [ ZnEntityTooLarge signal ] ] ] 
			on: ConnectionClosed 
			do: [ :exception | exception return ] ].
	self string: newString