accessing
peek
	| byte |
	byte := stream peek.
	logLevel > 1
		ifTrue: [
			logger value: ('{1} peeked 1 byte: {2}' format: {
				identifier.
				byte printStringBase: 16 length: 2 padded: true }) ].
	^ byte