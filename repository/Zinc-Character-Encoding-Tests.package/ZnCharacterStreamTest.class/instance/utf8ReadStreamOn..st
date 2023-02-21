test support
utf8ReadStreamOn: string
	^ ZnCharacterReadStream
		on: (ZnUTF8Encoder new encodeString: string) readStream
		encoding: #utf8