instance creation
newForEncoding: string
	"Return a new character encoder object for an encoding described by string.
	Search for a subclass that handles it and delegate"
	
	| encoder byteTextConverterClass |
	encoder := self new.
	byteTextConverterClass := ByteTextConverters at: string.
	self initializeEncoder: encoder using: byteTextConverterClass.
	^ encoder