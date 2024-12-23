encoding - decoding
nextCodePointFromStream: stream
	"Read and return the next integer code point from stream"

	| code byte next |
	(byte := stream next ifNil: [ ^ self errorIncompleteFrom: stream ]) < 128
		ifTrue: [ ^ byte ].
	(byte bitAnd: 2r11100000) == 2r11000000
		ifTrue: [
			code := byte bitAnd: 2r00011111.
			((next := stream next ifNil: [ ^ self errorIncompleteFrom: stream ]) bitAnd: 2r11000000) == 2r10000000
				ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
				ifFalse: [ ^ self errorIllegalContinuationByte: next from: stream ].
			code < 128 ifTrue: [ ^ self errorOverlong: code from: stream ].
			^ code ].
	(byte bitAnd: 2r11110000) == 2r11100000
		ifTrue: [
			code := byte bitAnd: 2r00001111.
			2 timesRepeat: [
				((next := stream next ifNil: [ ^ self errorIncompleteFrom: stream ]) bitAnd: 2r11000000) == 2r10000000
					ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
					ifFalse: [ ^ self errorIllegalContinuationByte: next from: stream ] ].
			code < 2048 ifTrue: [ ^ self errorOverlong: code from: stream ].
			(self isSurrogateCodePoint: code) ifTrue: [ ^ self errorOutsideRange: code from: stream ].
			(code = self byteOrderMark and: [ self ignoreByteOrderMark ]) ifTrue: [
				stream atEnd ifTrue: [ ^ self errorIncompleteFrom: stream ].
				^ self nextCodePointFromStream: stream ].
			^ code ].
	(byte bitAnd: 2r11111000) == 2r11110000
		ifTrue: [
			code := byte bitAnd: 2r00000111.
			3 timesRepeat: [
				((next := stream next ifNil: [ ^ self errorIncompleteFrom: stream ]) bitAnd: 2r11000000) == 2r10000000
					ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
					ifFalse: [ ^ self errorIllegalContinuationByte: next from: stream ] ].
			code < 65535 ifTrue: [ ^ self errorOverlong: code from: stream ].
			code > self maximumUTFCode ifTrue: [ ^ self errorOutsideRange: code from: stream ].
			^ code ].
	^ self errorIllegalLeadingByte: byte from: stream