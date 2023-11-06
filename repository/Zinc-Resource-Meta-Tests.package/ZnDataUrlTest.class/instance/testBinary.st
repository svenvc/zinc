tests
testBinary
	self
		assert: (ZnDataUrl bytes: #[1 2 3] type: 'application/octet-stream')
		equals: (ZnDataUrl bytes: #[1 2 3] type: 'application/octet-stream').
	self
		assert: (ZnDataUrl bytes: #[1 2 3] type: 'application/octet-stream') hash
		equals: (ZnDataUrl bytes: #[1 2 3] type: 'application/octet-stream') hash.
	self
		assert: (ZnDataUrl bytes: #[1 2 3] type: 'application/octet-stream') printString
		equals: (ZnDataUrl bytes: #[1 2 3] type: 'application/octet-stream') printString