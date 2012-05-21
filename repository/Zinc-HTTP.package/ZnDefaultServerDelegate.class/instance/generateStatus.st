private
generateStatus
	"Generate an HTML page with the state of the server"
	
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream nextPutAll: '<html><head><title>ZnServer Status</title></head>'.
		stream nextPutAll: '<body><h1>ZnServer Status</h1>'.
		stream nextPutAll: '<p>'; nextPutAll: self systemVersionInfo; nextPutAll: '</p>'.
		stream nextPutAll: '<pre>'; nextPutAll: self vmStats; nextPutAll: '</pre>'.  
		stream nextPutAll: '<h1>Processes</h1><ol>'.
		self processes do: [ :each |
			stream 
				nextPutAll: '<li>'; 
				nextPutAll: each name; space; nextPut: $[; print: each priority; nextPut: $]; nextPutAll: '<br/>'; nextPutAll: each printString;
				nextPutAll: '</li>' ].
		stream nextPutAll: '</ol>'.  
		stream nextPutAll: '</body></html>' ]