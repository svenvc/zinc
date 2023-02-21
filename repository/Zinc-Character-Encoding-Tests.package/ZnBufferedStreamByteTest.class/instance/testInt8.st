tests
testInt8
	| bytes readStream |
	bytes := ByteArray streamContents: [ :out |
		ZnBufferedWriteStream on: out do: [ :bout |
			bout int8: 123; uint8: 123; int8: -123 ] ].
	readStream := ZnBufferedReadStream on: bytes readStream.
	self assert: readStream peek equals: 123.
	self assert: readStream int8 equals: 123.
	self assert: readStream peek equals: 123.
	self assert: readStream uint8 equals: 123.
	self deny: readStream peek equals: 123.
	self deny: readStream peek equals: -123.
	self assert: readStream int8 equals: -123