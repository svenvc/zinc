converting
nextPut: character toStream: stream
	| code |
	code := character codePoint.
	code < 128 ifTrue: [ 
		^ stream nextPut: code ].
	code < 2048 ifTrue: [ 
		^ stream 
			nextPut: (2r11000000 + (code bitShift: -6)); 
			nextPut: (2r10000000 + (code bitAnd: 2r111111)) ].
	code < 65535 ifTrue: [ 
		^ stream 
			nextPut: (2r11100000 + (code bitShift: -12));
			nextPut: (2r10000000 + ((code bitShift: -6) bitAnd: 2r111111)); 
			nextPut: (2r10000000 + (code bitAnd: 2r111111)) ].
	code <= self maximumUTF8Code ifTrue: [ 
		^ stream 
			nextPut: (2r11110000 + (code bitShift: -18));
			nextPut: (2r10000000 + (code bitShift: -12));
			nextPut: (2r10000000 + ((code bitShift: -6) bitAnd: 2r111111)); 
			nextPut: (2r10000000 + (code bitAnd: 2r111111)) ].
	self error: 'Unicode character code point outside range'
