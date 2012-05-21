accessing
contentType
	^ ZnMimeType fromString: (self headers at: 'Content-Type')