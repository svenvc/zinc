private
signalHTTPProgress: message
	(ZnCurrentOptions at: #signalProgress)
		ifTrue: [ HTTPProgress signal: message ]