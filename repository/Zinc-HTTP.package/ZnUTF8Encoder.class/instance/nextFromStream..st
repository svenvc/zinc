converting
nextFromStream: stream
	| code byte next |
	next := [ | nextByte |
		((nextByte := stream next) bitAnd: 2r11000000) = 2r10000000
			ifTrue: [ code := (code bitShift: 6) + (nextByte bitAnd: 2r00111111) ]
			ifFalse: [ self error: 'illegal UTF-8 encoding' ] ].
	(byte := stream next) < 128 ifTrue: [
		^ Character codePoint: byte ].
	(byte bitAnd: 2r11100000) = 2r11000000 ifTrue: [
		code := byte bitAnd: 2r00011111.
		next value.
		^ Character codePoint: code ].
	(byte bitAnd: 2r11110000) = 2r11100000 ifTrue: [
		code := byte bitAnd: 2r00001111.
		next value; value.
		^ Character codePoint: code ].
	(byte bitAnd: 2r11111000) = 2r11110000 ifTrue: [
		code := byte bitAnd: 2r00000111.
		next value; value; value.
		^ Character codePoint: code ].
	self error: 'illegal UTF-8 encoding'