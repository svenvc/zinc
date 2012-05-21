convenience
encodeString: string
	^ ByteArray streamContents: [ :stream |
		string do: [ :each | 
			self nextPut: each toStream: stream ] ] 