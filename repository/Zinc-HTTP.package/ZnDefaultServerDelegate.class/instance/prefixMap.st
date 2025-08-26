accessing
prefixMap
	"Return my prefix map, with each prefix key mapped to its handler value.
	A handler is either a block or one of my methods, taking the request as argument."

	^ prefixMap ifNil: [ prefixMap := Dictionary new ]