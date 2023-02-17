accessing
next
	| byte |
	byte := stream next.
	logger value: ('{1} read 1 byte: {2}' format: {
		identifier.
		byte ifNotNil: [ byte printStringBase: 16 length: 2 padded: true ] }).
	^ byte