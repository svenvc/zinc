convenience
encodeString: string
	"Encode string and return the resulting byte array"
	
	^ ByteArray streamContents: [ :stream |
		string do: [ :each | 
			self nextPut: each toStream: stream ] ] 