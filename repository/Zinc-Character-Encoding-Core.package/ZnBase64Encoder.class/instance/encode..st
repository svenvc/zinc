converting
encode: byteArray
	"Encode byteArray using Base64 encoding and return the resulting string"
	
	^ String
		new: byteArray size
		streamContents: [ :stringStream | self encode: byteArray readStream to: stringStream ]