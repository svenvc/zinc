converting
nextPut: character toStream: stream
	| code next |
	code := character charCode.
	next := [ :shift |
		stream nextPut: (2r10000000 + ((code bitShift: shift) bitAnd: 2r111111)) ].
	code < 128 ifTrue: [ 
		stream nextPut: code.
		^ character ].
	code < 2048 ifTrue: [ 
		stream nextPut: (2r11000000 + (code bitShift: -6)).
		next value: 0.
		^ character ].
	code < 65535 ifTrue: [ 
		stream nextPut: (2r11100000 + (code bitShift: -12)).
		next value: -6; value: 0.
		^ character ].
	code <= self maximumUTF8Code ifTrue: [ 
		stream nextPut: (2r11110000 + (code bitShift: -18)).
		next value: -12; value: -6; value: 0.
		^ character ].
	self error: 'Unicode character code point outside range'
