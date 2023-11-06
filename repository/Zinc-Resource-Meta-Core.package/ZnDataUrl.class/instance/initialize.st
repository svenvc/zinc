initialization
initialize
	super initialize.
	mediaType := 'text/plain;charset=ASCII' asZnMimeType.
	base64Encoded := false.
	data := #[]