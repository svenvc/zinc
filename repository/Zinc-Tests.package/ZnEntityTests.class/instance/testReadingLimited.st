testing
testReadingLimited
	| limit contents |
	contents := String new: 1025 withAll: $X.
	limit := ZnConstants maximumEntitySize.
	[
		ZnConstants maximumEntitySize: 1024.
		self should: [
			ZnEntity 
				readFrom: contents asByteArray readStream 
				usingType: ZnMimeType textPlain 
				andLength: contents size ]
			raise: ZnEntityTooLarge.
		self should: [
			ZnEntity 
				readFrom: contents asByteArray readStream 
				usingType: ZnMimeType textPlain 
				andLength: nil ]
			raise: ZnEntityTooLarge.
	] ensure: [ ZnConstants maximumEntitySize: limit ]