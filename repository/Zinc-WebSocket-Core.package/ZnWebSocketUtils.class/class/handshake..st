protocol
handshake: clientKey
	"Perform the WebSocket key handshake"
	
	"self handshake: 'dGhlIHNhbXBsZSBub25jZQ=='"
	
	| string hash |
	string := clientKey, self serverGUID.
	hash := SHA1 hashMessage: string.
	^ ZnUtils encodeBase64: hash