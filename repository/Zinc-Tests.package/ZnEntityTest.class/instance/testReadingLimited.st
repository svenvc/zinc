testing
testReadingLimited
	| contents |
	contents := String new: 1025 withAll: $X.
	ZnOptions globalDefault clone
		at: #maximumEntitySize put: 1024;
		during: [
			self
				should: [
					ZnEntity
						readFrom: contents asByteArray readStream
						usingType: ZnMimeType textPlain
						andLength: contents size ]
				raise: ZnEntityTooLarge.
			self
				should: [
					ZnEntity
						readFrom: contents asByteArray readStream
						usingType: ZnMimeType textPlain
						andLength: nil ]
						raise: ZnEntityTooLarge ]