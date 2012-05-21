testing
testReading
	| data chunked plain |
	data := String withAll: ($a to: $z), ($A to: $Z).
	chunked := String streamContents: [ :stream |
		ZnUtils nextPutAll: data on: stream chunked: 16 ].
	plain := (ZnChunkedReadStream on: chunked readStream) upToEnd.
	self assert: plain = data