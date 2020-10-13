writing
writeOn: stream

	"We always go via our representation because we need a bivalent stream"

	representation ifNil: [ self computeRepresentation ].
	ZnUtils nextPutAll: representation on: stream