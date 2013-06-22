protocol
sendMessage: stringOrByteArray
	"Send stringOrByteArray in one textual or binary frame"

	stringOrByteArray isString
		ifTrue: [ self sendText: stringOrByteArray ] 
		ifFalse: [ self sendBytes: stringOrByteArray ]