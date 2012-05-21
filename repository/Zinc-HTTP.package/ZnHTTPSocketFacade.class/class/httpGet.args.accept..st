operations get
httpGet: url args: queryArguments accept: mimeType
	^ self 
		httpGet: url 
		args: queryArguments 
		accept: mimeType 
		request: nil