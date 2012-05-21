operations get
httpGetDocument: url
	^ self 
		httpGetDocument: url 
		accept: 'application/octet-stream'