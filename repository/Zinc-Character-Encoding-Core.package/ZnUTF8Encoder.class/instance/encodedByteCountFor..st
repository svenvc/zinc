converting
encodedByteCountFor: character
	| code |
	code := character charCode.
	code < 128 ifTrue: [ ^ 1 ].
	code < 2048 ifTrue: [ ^ 2 ].
	code < 65535 ifTrue: [ ^ 3 ].
	code <= self maximumUTF8Code ifTrue: [ ^ 4 ].
	self error: 'Unicode character code point outside range'
