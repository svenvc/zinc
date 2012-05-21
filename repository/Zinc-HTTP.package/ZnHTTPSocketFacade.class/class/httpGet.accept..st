operations get
httpGet: url accept: mimeType
	^ self 
		httpGet: url 
		args: nil 
		accept: mimeType