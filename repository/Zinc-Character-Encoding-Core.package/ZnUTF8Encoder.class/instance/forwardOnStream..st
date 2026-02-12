encoding - decoding
forwardOnStream: stream
	"Move forward one character on stream"

	| firstByte |
	(firstByte := stream next) ifNil: [ self error: 'Cannot move forward once at the end' ].
	(firstByte bitAnd: 2r10000000) = 0 ifTrue: [ ^ self ].
	(firstByte bitAnd: 2r11100000) = 2r11000000 ifTrue: [ ^ stream skip: 1 ].
	(firstByte bitAnd: 2r11110000) = 2r11100000 ifTrue: [ ^ stream skip: 2 ].
	(firstByte bitAnd: 2r11111000) = 2r11110000 ifTrue: [ ^ stream skip: 3 ].
	^ self errorIllegalLeadingByte: firstByte from: stream