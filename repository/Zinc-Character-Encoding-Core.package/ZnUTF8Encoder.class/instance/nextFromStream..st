converting
nextFromStream: stream
	| code byte next |
	(byte := stream next) < 128
		ifTrue: [ ^ Character codePoint: byte ].
	(byte bitAnd: 2r11100000) == 2r11000000
		ifTrue: [ 
			code := byte bitAnd: 2r00011111.
			((next := stream next) bitAnd: 2r11000000) == 2r10000000
				ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
				ifFalse: [ ^ self error: 'illegal UTF-8 encoding' ].
			^ Character codePoint: code ].
	(byte bitAnd: 2r11110000) == 2r11100000
		ifTrue: [ 
			code := byte bitAnd: 2r00001111.
			2 timesRepeat: [ 
				((next := stream next) bitAnd: 2r11000000) == 2r10000000
					ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
					ifFalse: [ ^ self error: 'illegal UTF-8 encoding' ] ].
			^ Character codePoint: code ].
	(byte bitAnd: 2r11111000) == 2r11110000
		ifTrue: [ 
			code := byte bitAnd: 2r00000111.
			3 timesRepeat: [ 
				((next := stream next) bitAnd: 2r11000000) == 2r10000000
					ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
					ifFalse: [ ^ self error: 'illegal UTF-8 encoding' ] ].
			^ Character codePoint: code ].
	self error: 'illegal UTF-8 encoding'