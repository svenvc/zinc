testing
testByteOrderMarksAreKeptWhenNotIgnored
	self byteOrderMarkEncoders do: [ :encoder |
		encoder ignoreByteOrderMark: false.
		#( 'a<' '<<' '<a<b' ) do: [ :pattern | | string bytes |
			string := self withByteOrderMarks: pattern.
			bytes := encoder encodeString: string.
			self assert: (encoder decodeBytes: bytes) equals: string.
			self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd equals: string ] ]