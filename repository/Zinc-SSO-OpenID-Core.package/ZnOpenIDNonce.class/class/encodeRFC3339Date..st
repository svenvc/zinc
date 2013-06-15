utility
encodeRFC3339Date: aDateAndTime

	| dt |
	
	dt := aDateAndTime asUTC.

	^ String streamContents: [ :stream |
		dt printYMDOn: stream.
		stream nextPut: $T.
		dt printHMSOn: stream.
		stream nextPut: $Z ]