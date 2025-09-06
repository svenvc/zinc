testing
testBytes
	self withServerDo: [ :server | | bytes newBytes |
		bytes := ZnClient new beOneShot; get: server localUrl / 'bytes/128'.
		self assert: bytes size equals: 128.
		self assert: bytes last equals: Character lf asciiValue.
		newBytes := ZnClient new beOneShot; get: server localUrl / 'bytes/128'.
		self assert: newBytes equals: bytes ]