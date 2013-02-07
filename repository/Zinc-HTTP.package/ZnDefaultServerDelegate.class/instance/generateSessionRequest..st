private
generateSessionRequest: session
	"Generate an HTML page using a session"
	
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream nextPutAll: '<html><head><title>Session</title></head>'.
		stream nextPutAll: '<body><h1>Session</h1>'.
		stream nextPutAll: '<p>I am using '; print: session; nextPutAll: '</p>'.
		stream nextPutAll: '<p>Current session-id='; nextPutAll: session id; nextPutAll: '</p>'.
		stream nextPutAll: '<p>Session hit count is '; print: (session attributeAt: #hitCount); nextPutAll: '</p>'.
		stream nextPutAll: '</body></html>' ] 