converting
encodeAsIri: readStream to: writeStream
	| character codePoint |
	[ readStream atEnd ]
		whileFalse: [
			character := readStream next.
			codePoint := character codePoint.
			((self safeSet includes: codePoint) or: [ codePoint > 16rA0 ])
				ifTrue: [ 
					writeStream nextPut: character ]
				ifFalse: [ 
					writeStream nextPut: $%.
					self writeHex: codePoint to: writeStream ] ]