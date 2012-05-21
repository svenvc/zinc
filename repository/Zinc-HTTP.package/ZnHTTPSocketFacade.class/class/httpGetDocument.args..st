operations get
httpGetDocument: url args: queryArguments
	^ self 
		httpGetDocument: url 
		args: queryArguments 
		accept: 'application/octet-stream'