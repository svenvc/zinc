encoding - decoding
backOnStream: stream
	"Move back one character on stream"

	| word |
	word := self back16BitWordOnStream: stream.
	(self isSurrogateCodePoint: word)
		ifTrue: [
			self back16BitWordOnStream: stream ]