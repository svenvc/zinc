protocol
newClientKey
	"Generate a new WebSocket client key"
	
	| rawKey |
	rawKey := self randomByteArrayOfSize: 16.
	^ ZnUtils encodeBase64: rawKey