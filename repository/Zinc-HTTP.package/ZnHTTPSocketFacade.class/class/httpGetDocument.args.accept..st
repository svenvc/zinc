operations get
httpGetDocument: url args: queryArguments accept: mimeType
	^ self 
		httpGetDocument: url 
		args: queryArguments 
		accept: mimeType
		request: nil