instance creation
text: string
	"self text: 'Hello there !'"
	
	^ self new
		mediaType: ZnMimeType textPlain;
		data: string;
		yourself