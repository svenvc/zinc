comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^ mediaType hash bitXor: (base64Encoded hash bitXor: data hash)