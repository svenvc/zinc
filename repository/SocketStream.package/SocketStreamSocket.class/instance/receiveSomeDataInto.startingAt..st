as yet unclassified
receiveSomeDataInto: aStringOrByteArray startingAt: aNumber

	^self readInto: aStringOrByteArray startingAt: aNumber for: (aStringOrByteArray size  -aNumber +1)