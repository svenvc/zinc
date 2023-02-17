accessing
defaultBufferSize
	"Return the default size of my buffer, which limits how far I can be positioned backwards. See #sizeBuffer: to set another buffer size."

	^ 2 raisedToInteger: 8