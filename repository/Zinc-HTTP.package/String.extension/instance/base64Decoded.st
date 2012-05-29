*zinc-http
base64Decoded
	"Encode the receiver as base64"
	"'Hello World' base64Encoded"
	^(Base64MimeConverter mimeDecodeToChars: self readStream) contents