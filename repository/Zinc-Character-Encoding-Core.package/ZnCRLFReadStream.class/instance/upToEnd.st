accessing
upToEnd
	"Answer a ByteArray of the stream from the current position to the last"

	^ByteArray streamContents: [ :newStream | | nextByte |
		[ (nextByte := self next) isNil ] whileFalse:
			[ newStream nextPut: nextByte ] ]