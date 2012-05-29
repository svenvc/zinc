*zinc-http
readFrom: aStream ifFail: aBlock
	"Answer a new Integer as described on the stream, aStream.
	Embedded radix specifiers not allowed - use Number readFrom: for that."
	^(SqNumberParser on: aStream) nextIntegerBase: 10 ifFail: aBlock