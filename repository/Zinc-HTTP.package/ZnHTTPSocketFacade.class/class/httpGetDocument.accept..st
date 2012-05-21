operations get
httpGetDocument: url accept: mimeType
	^ self 
		httpGetDocument: url 
		args: nil 
		accept: mimeType