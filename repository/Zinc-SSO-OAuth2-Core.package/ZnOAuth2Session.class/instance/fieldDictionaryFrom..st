private
fieldDictionaryFrom: aString

	| dict stream |
	
	dict := Dictionary new.
	stream := aString readStream.
	[ stream atEnd ] whileFalse: [ dict at: (stream upTo: $=) put: (stream upTo: $&) ].

	^dict