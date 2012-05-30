running
setUp
	self tearDown.
	ServerFileDirectory default 
		newFileNamed: 'small.html' 
		do: [ :stream |
			stream nextPutAll: self smallHtml ]